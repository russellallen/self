import java.awt.*;
import java.applet.Applet;
import java.io.*;
import java.net.*;
import java.util.*;
//-------------------------------------------------------------------------
// Kansas Java interface -- bringing Kansas to the Web
//
//   LensRadarViewer.java - the fish eye radar view Browser Core
//
// $Revision: 30.1 $
//      Andy Collins, Sun Microsystems Laboratories, Summer 1996
//-------------------------------------------------------------------------


class LensRadarObject extends SelfRadarObject
{
   public LensRadarObject (SelfObjectState objectState)
   {
      super (objectState);
   }

   public void paint (Graphics g, Point logicalCenter, Point screenCenter, int innerRadius)
   {
      int Xs[] = new int[13];
      int Ys[] = new int[13];
      boolean lastWasIn = false;
      boolean thisIsIn;
      int radius;

      Point input[] = new Point[5];
      input[0] = new Point (rect.x, rect.y);
      input[1] = new Point (rect.x + rect.width, rect.y);
      input[2] = new Point (rect.x + rect.width, rect.y + rect.height);
      input[3] = new Point (rect.x, rect.y + rect.height);
      input[4] = new Point (rect.x, rect.y);

      int outputIndex = 0;
      for (int inputIndex = 0; inputIndex < 5; ++inputIndex)
         {
         radius = (int) Math.sqrt ((input[inputIndex].x - logicalCenter.x) * (input[inputIndex].x - logicalCenter.x) + 
                                   (input[inputIndex].y - logicalCenter.y) * (input[inputIndex].y - logicalCenter.y));
         thisIsIn = (radius < innerRadius);
         if (inputIndex > 0)
            {
            int x1 = input[inputIndex-1].x - logicalCenter.x;
            int y1 = input[inputIndex-1].y - logicalCenter.y;
            int x2 = input[inputIndex].x   - logicalCenter.x;
            int y2 = input[inputIndex].y   - logicalCenter.y;

            long A = (x2 - x1) * (x2 - x1) + (y2 - y1) * (y2 - y1);
            long B = 2 * x1 * (x2 - x1) + 2 * y1 * (y2 - y1);
            long C = x1 * x1 + y1 * y1 - innerRadius * innerRadius;

            double discrim = (double) (B * B) - 4.0 * A * C;

//            System.out.println ("A = " + A + "; B = " + B + "; C = " + C + "; discrim = " + discrim);

            if (discrim >= 0)
               {
               double s1 = (-B + Math.sqrt (discrim)) / (2.0 * A);
               double s2 = (-B - Math.sqrt (discrim)) / (2.0 * A);

               if (s1 > s2)
                  {
                  double tmp = s1;
                  s1 = s2;
                  s2 = tmp;
                  }

//               System.out.println ("Positive discrim, roots are: " + s1 + ", " + s2);

               if ((s1 > 0.0) && (s1 < 1.0))
                  {
                  Xs[outputIndex] = x1 + (int) (s1 * (x2 - x1)) + screenCenter.x;
                  Ys[outputIndex] = y1 + (int) (s1 * (y2 - y1)) + screenCenter.y;
                  ++outputIndex;
                  }

               if ((s2 > 0.0) && (s2 < 1.0))
                  {
                  Xs[outputIndex] = x1 + (int) (s2 * (x2 - x1)) + screenCenter.x;
                  Ys[outputIndex] = y1 + (int) (s2 * (y2 - y1)) + screenCenter.y;
                  ++outputIndex;
                  }

               }
            }

         // Emit this point (after possible conversion)
         if (thisIsIn)
            {
            Xs[outputIndex] = input[inputIndex].x - logicalCenter.x + screenCenter.x;
            Ys[outputIndex] = input[inputIndex].y - logicalCenter.y + screenCenter.y;
            ++outputIndex;
            }
         else
            {
            double power = 0.7;
            double recip = 1.0 / power;
            int newRadius = (int) (innerRadius - recip + recip * Math.pow (radius - innerRadius + 1, power));
            double shrinkFactor = ((double) newRadius) / radius;

            Xs[outputIndex] = (int) ((input[inputIndex].x - logicalCenter.x) * shrinkFactor) + screenCenter.x;
            Ys[outputIndex] = (int) ((input[inputIndex].y - logicalCenter.y) * shrinkFactor) + screenCenter.y;
            ++outputIndex;
            }

         lastWasIn = thisIsIn;
         }

      g.setColor (color);
      g.fillPolygon (Xs, Ys, outputIndex);
/*
      for (int inputIndex=0; inputIndex < 4; ++inputIndex)
         {
         Xs[inputIndex] = input[inputIndex].x - logicalCenter.x + screenCenter.x;
         Ys[inputIndex] = input[inputIndex].y - logicalCenter.y + screenCenter.y;
         }

      Xs[4] = Xs[0];
      Ys[4] = Ys[0];

      g.setColor (Color.black);
      g.drawPolygon (Xs, Ys, 5);
*/
   }
}

class LensRadarViewerBrowserCore extends BrowserCore
{
   String hostname = "localhost";
   int port = 1420;

   Thread runThread = null;

   Socket downlinkSocket = null;
   public StreamTokenizer downlinkStream;

   Hashtable objects;

   LensRadarViewerBrowserCore (BrowserPanel browser, BailInOut bailoutPt,
                               String hostname, int port, double innerRadiusFactor)
   {
      super (browser, bailoutPt);
      this.innerRadiusFactor = innerRadiusFactor;
      this.hostname = hostname;
      this.port = port;
   }

   double innerRadiusFactor = 0.6;

   public void bailin ()
   {
      System.out.println ("RadarViewerBrowserCore.bailin (): " + Thread.currentThread ().hashCode ());
      objects = new Hashtable ();

      try 
         {
         // open the downlink socket (and follow the Self server . protocol)
         downlinkSocket = new Socket (hostname, port);
         DataOutputStream downlinkBackStream = 
                        new DataOutputStream (downlinkSocket.getOutputStream ());
         downlinkBackStream.writeBytes ("<radarview>\r\n");
         downlinkBackStream.flush ();
         downlinkStream = new StreamTokenizer (downlinkSocket.getInputStream ());
         downlinkStream.ordinaryChar (39);
         downlinkStream.wordChars (60, 62);
         downlinkStream.eolIsSignificant (false);
         downlinkStream.parseNumbers ();

         if (runThread != null)
            runThread.stop ();
         runThread = new LensRadarViewMonitor (this, ownerBrowser, bailoutPoint);
         runThread.start ();
         }
      catch (IOException e)
         {
         System.out.println ("Radarview initialization failure, closing down");
         bailoutPoint.bailout ();
         }      
   }

   public synchronized void bailout ()
   {
      System.out.println ("RadarViewerBrowserCore.bailout (): " + Thread.currentThread ().hashCode ());
      
      if (runThread == Thread.currentThread ())
         System.out.println ("  runThread is currentThread");

      try 
         {
         if (downlinkSocket != null)
            downlinkSocket.close ();
         }
      catch (IOException e)
         {
         }

      if (runThread != null)
         {
         System.out.println ("  Killing thread - " + runThread.hashCode ());
         runThread.stop ();
         runThread = null;
         }
      else
         System.out.println ("  Thread is already dead");

      System.out.println ("  returning");
   }

   // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
   public void paint (Graphics g, Rectangle region)
   {
      if (objects == null)
         return;

      int xr = ownerBrowser.getViewSize ().width / 2;
      int yr = ownerBrowser.getViewSize ().height / 2;
      double radius = Math.sqrt (xr * xr + yr * yr);
      Point logicalCenter = new Point (ownerBrowser.getViewOrigin ().x + xr,
                                       ownerBrowser.getViewOrigin ().y + yr);
      Point screenCenter = new Point (ownerBrowser.getViewSize ().width / 2,
                                      ownerBrowser.getViewSize ().height / 2);
      Enumeration e = objects.elements ();
      while (e.hasMoreElements ())
         ((LensRadarObject) e.nextElement ()).paint (g, logicalCenter, screenCenter,
                                                     (int) (innerRadiusFactor * radius));
/*
      g.setColor (new Color (0xFF000000));  // alpha = FF
      g.fillArc (screenCenter.x - (int) (radius * innerRadiusFactor), screenCenter.y - (int) (radius * innerRadiusFactor),
                 2 * (int) (radius * innerRadiusFactor), 2 * (int) (radius * innerRadiusFactor), 0, 360);
*/
   }

   // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
   public void notifyViewChanged ()
   {
      ownerBrowser.redrawRect (new Rectangle (ownerBrowser.getViewOrigin ().x,
                                              ownerBrowser.getViewOrigin ().y,
                                              ownerBrowser.getViewSize ().width,
                                              ownerBrowser.getViewSize ().height));
      ownerBrowser.issueRepaint ();
      Thread.yield ();
   }
}

class LensRadarViewMonitor extends Thread
{
   LensRadarViewerBrowserCore browser;
   Browser ownerBrowser;
   BailInOut bailoutPoint;

   public LensRadarViewMonitor (LensRadarViewerBrowserCore browser, Browser ownerBrowser, BailInOut bailoutPoint)
   {
      this.browser = browser;
      this.ownerBrowser = ownerBrowser;
      this.bailoutPoint = bailoutPoint;
   }

   public void run ()
   {
      String keyName;
      SelfObjectState objectState = new SelfObjectState ();

      Thread.yield ();

      for (;;)
         {
            try
               {
               browser.downlinkStream.nextToken ();

               if (browser.downlinkStream.ttype == StreamTokenizer.TT_WORD)
                  {
                  keyName = browser.downlinkStream.sval;
            
                  if (keyName == null)
                     System.out.println ("!!!!!");

                  browser.downlinkStream.nextToken ();

                  if (browser.downlinkStream.ttype == StreamTokenizer.TT_NUMBER)
                     objectState.setValue (keyName, browser.downlinkStream.nval);
                  else if ((browser.downlinkStream.ttype == StreamTokenizer.TT_WORD) ||
                           (browser.downlinkStream.ttype == '\"'))
                     objectState.setValue (keyName, browser.downlinkStream.sval);
                  else
                     {
                     System.out.println ("Unexpected second token following " + keyName + 
                                         ": type is " + browser.downlinkStream.ttype);
                     }
/* 
                  try
                     {
                     System.out.println (keyName + " " + objectState.getStringValue (keyName));
                     }
                  catch (SelfMissingStateException e)
                     {
                     }
*/
                  // Is this a complete object update, if so, it will end with "o"
                  if (keyName.equals ("o"))
                     {
                     try 
                        {
                        if (objectState.getStringValue ("owner").equals ("nil"))
                           browser.objects.remove (objectState.getStringValue ("o"));
                        }
                     catch (SelfMissingStateException e) 
                        {
                        try 
                           {
                           LensRadarObject existingObject = 
                                       (LensRadarObject) browser.objects.get (objectState.getStringValue ("o"));
                           if (existingObject == null)
                              browser.objects.put (objectState.getStringValue ("o"), new LensRadarObject (objectState));
                           else
                              existingObject.setState (objectState);
                           }
                        catch (SelfMissingStateException e2) 
                           {
                           }
                        }

//                     System.out.println ("LensRadarview: " + browser.objects.size () + " objects");
                     objectState = new SelfObjectState ();

                     ownerBrowser.redrawRect (new Rectangle (ownerBrowser.getViewOrigin ().x,
                                                             ownerBrowser.getViewOrigin ().y,
                                                             ownerBrowser.getViewSize ().width,
                                                             ownerBrowser.getViewSize ().height));
                     ownerBrowser.issueRepaint ();
                     Thread.yield ();
                     }
                  } 
               else
                  {
                  if (browser.downlinkStream.ttype == StreamTokenizer.TT_EOF)
                     {
                     System.out.println ("Radarview EOF, closing down: " + Thread.currentThread ().hashCode ());
                     bailoutPoint.bailout ();
                     }
                  }
               }
             catch (IOException e)
               {
               System.out.println ("Radarview IOException, closing down: " + Thread.currentThread ().hashCode ());
               bailoutPoint.bailout ();
               }
         }
   }
}
