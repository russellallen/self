import java.awt.*;
import java.applet.Applet;
import java.io.*;
import java.net.*;
import java.util.*;

//-------------------------------------------------------------------------
// Kansas Java interface -- bringing Kansas to the Web
//
//   RadarViewer.java -- the radar view Browser Core
//
// $Revision: 30.1 $
//      Andy Collins, Sun Microsystems Laboratories, Summer 1996
//-------------------------------------------------------------------------

//---------------------------------------------------------------------
//---------------------------------------------------------------------
class SelfRadarObject
{
   Rectangle rect = new Rectangle (0,0,0,0);
   Color color = Color.black;

   SelfRadarObject (SelfObjectState objectState)
   { 
      setState (objectState);
   }

   public void setState (SelfObjectState objectState)
   {
      try 
         {
         rect.x = (int) objectState.getNumberValue ("r.l");
         rect.y = (int) objectState.getNumberValue ("r.t");
         rect.width = (int) (objectState.getNumberValue ("r.r") - rect.x);
         rect.height = (int) (objectState.getNumberValue ("r.b") - rect.y);
         }
      catch (SelfMissingStateException e)
         {
         }

      try 
         {
         color = new Color ((float) objectState.getNumberValue ("c.r"),
                            (float) objectState.getNumberValue ("c.g"),
                            (float) objectState.getNumberValue ("c.b"));
         }
      catch (SelfMissingStateException e)
         {
         }
   }

   public void paint (Graphics g, Rectangle logicalArea, double xZoomFactor, double yZoomFactor)
   {
      if (rect.intersects (logicalArea))
         {
         g.setColor (color);
         g.fillRect ((int) ((rect.x - logicalArea.x) / xZoomFactor), 
                     (int) ((rect.y - logicalArea.y) / yZoomFactor),
                     Math.max (1, (int) (rect.width / xZoomFactor)), 
                     Math.max (1, (int) (rect.height / yZoomFactor)));
         }
   }
}

class RadarViewerBrowserCore extends BrowserCore
{
   String hostname = "localhost";
   int port = 1420;

   Thread runThread = null;

   Socket downlinkSocket = null;
   public StreamTokenizer downlinkStream;

   double xZoomFactor;
   double yZoomFactor;
   Hashtable objects;

   RadarViewerBrowserCore (BrowserPanel browser, BailInOut bailoutPt,
                           String hostname, int port,
                           double xZoomFactor, double yZoomFactor)
   {
      super (browser, bailoutPt);
 
      this.hostname = hostname;
      this.port = port;

      setZoom (xZoomFactor, yZoomFactor);
   }

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
         runThread = new RadarViewMonitor (this, ownerBrowser, bailoutPoint);
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

   public void setZoom (double xZoomFactor, double yZoomFactor)
   {
      this.xZoomFactor = xZoomFactor;
      this.yZoomFactor = yZoomFactor;
   }
   public void setZoom (double zoomFactor)
   {
      setZoom (zoomFactor, zoomFactor);
   }

   public void paint (Graphics g, Rectangle region)
   {
      Rectangle logicalArea = new Rectangle (0, 0, (int) (ownerBrowser.getViewSize ().width * xZoomFactor),
                                                   (int) (ownerBrowser.getViewSize ().height * yZoomFactor));
      logicalArea.x = (int) (ownerBrowser.getViewOrigin ().x - ((logicalArea.width - ownerBrowser.getViewSize ().width) / 2));
      logicalArea.y = (int) (ownerBrowser.getViewOrigin ().y - ((logicalArea.height - ownerBrowser.getViewSize ().height) / 2));

      Rectangle displayInto = new Rectangle (0,0,ownerBrowser.getViewSize ().width, ownerBrowser.getViewSize ().height);
      Graphics paintOn = g.create (displayInto.x, displayInto.y, displayInto.width, displayInto.height);
      paintOn.setColor (Color.white);
      paintOn.fillRect (0,0,displayInto.width,displayInto.height);

      Enumeration e = objects.elements ();
      while (e.hasMoreElements ())
         ((SelfRadarObject) e.nextElement ()).paint (paintOn, logicalArea, xZoomFactor, yZoomFactor);
   }

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

class RadarViewMonitor extends Thread
{
   RadarViewerBrowserCore browser;
   Browser ownerBrowser;
   BailInOut bailoutPoint;

   public RadarViewMonitor (RadarViewerBrowserCore browser, Browser ownerBrowser, BailInOut bailoutPoint)
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
                           SelfRadarObject existingObject = 
                                       (SelfRadarObject) browser.objects.get (objectState.getStringValue ("o"));
                           if (existingObject == null)
                              browser.objects.put (objectState.getStringValue ("o"), new SelfRadarObject (objectState));
                           else
                              existingObject.setState (objectState);
                           }
                        catch (SelfMissingStateException e2) 
                           {
                           }
                        }

//                     System.out.println ("Radarview: " + browser.objects.size () + " objects");
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
