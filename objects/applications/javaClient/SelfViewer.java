import java.awt.*;
import java.applet.Applet;
import java.io.*;
import java.net.*;
import java.util.*;

//-------------------------------------------------------------------------
// Kansas Java interface -- bringing Kansas to the Web
//
//   SelfViewer.java -- the top-level applet with navigation controls
//
// $Revision: 30.1 $
//      Andy Collins, Sun Microsystems Laboratories, Summer 1996
//-------------------------------------------------------------------------


//----------------------------------------------------------------------------------
//----------------------------------------------------------------------------------
class LoginScreen extends Panel
{
   TextField loginName;
   TextField password;
   TextField hostname;
   TextField port;
   int defaultPort;

   public String getLoginName ()
   {
      return (loginName.getText ());
   }
   public String getPassword ()
   {
      return (password.getText ());
   }
   public String getHostname ()
   {
      return (hostname.getText ());
   }
   public int getPort ()
   {
      int d;
      try 
         {
         d = Integer.parseInt (port.getText ());
         }
      catch (NumberFormatException e)
         {
         d = defaultPort;
         }
      return (d);
   }

   public LoginScreen (String defaultHostname, int defaultPort)
   {
      this.defaultPort = defaultPort;

      GridBagLayout loginLayout = new GridBagLayout ();
      setLayout (loginLayout);

      GridBagConstraints topBottom = new GridBagConstraints ();
      topBottom.gridwidth = GridBagConstraints.REMAINDER;

      GridBagConstraints left = new GridBagConstraints ();
      left.anchor = GridBagConstraints.EAST;
      left.weightx = 1.0;
      GridBagConstraints right = new GridBagConstraints ();
      right.anchor = GridBagConstraints.WEST;
      right.gridwidth = GridBagConstraints.REMAINDER;
      right.weightx = 1.0;

      Component c = new Label ("Kansas login:");
      loginLayout.setConstraints (c, topBottom);
      add (c);

      c = new Label ("Name: ");
      loginLayout.setConstraints (c, left);
      add (c);
      loginName = new TextField ("java user", 20);
      loginLayout.setConstraints (loginName, right);
      add (loginName);

      c = new Label ("Password: ");
      loginLayout.setConstraints (c, left);
      add (c);
      password = new TextField (20);
      loginLayout.setConstraints (password, right);
      add (password);

      c = new Label ("Host: ");
      loginLayout.setConstraints (c, left);
      add (c);
      hostname = new TextField (defaultHostname, 30);
      loginLayout.setConstraints (hostname, right);
      add (hostname);

      c = new Label ("Port: ");
      loginLayout.setConstraints (c, left);
      add (c);
      port = new TextField (String.valueOf (defaultPort), 10);
      loginLayout.setConstraints (port, right);
      add (port);

      c = new Button ("Reconnect");
      loginLayout.setConstraints (c, topBottom);
      add (c);
   }
}

public class SelfViewer extends Applet implements BailInOut
{
   private BrowserPanel disp = null;

   LoginScreen stoppedMessage = null;
   Panel toolbar = null;
   Panel indicators = null;
   Label toolbarText = null;
   Button navButtons[]= new Button[8];       // NW N NE W E SW S SE

   boolean canStart = true;

   public long startTimeMillis = 0;

   CaughtUpIndicator caughtUpIndicator;
   IdleIndicator netIdleIndicator;

   String hostname;
   int port;
   Point viewOrigin;

   String getParam (String p, String d)
   {
      String s = getParameter (p);
      if (s == null)
         return (d);
      else
         return (s);
   }
   int getParam (String p, int d)
   {
      try 
         {
         d = Integer.parseInt (getParameter (p));
         }
      catch (NumberFormatException e)
         {
         }
      return (d);
   }
   double getParam (String p, double d)
   {
      try 
         {
         d = Double.valueOf (getParameter (p)).doubleValue ();
         }
      catch (NumberFormatException e)
         {
         }
      catch (NullPointerException e)
         {
         }
      return (d);
   }

   public void init ()
   {
      URL docURL = getDocumentBase ();
      if (docURL != null)
         {
         hostname = docURL.getHost ();
         System.out.println ("Got hostname: " + hostname);
         }
      else
         hostname = getParam ("hostname", "localhost");

      port = getParam ("port", 1420);
      viewOrigin = new Point (getParam ("xorigin", 0), getParam ("yorigin", 0));

      
      startTimeMillis = System.currentTimeMillis ();
/*
      stoppedMessage = new Panel ();
      stoppedMessage.setLayout (new FlowLayout (FlowLayout.CENTER, 10, 50));
      stoppedMessage.add (new Label ("Disconnected", Label.CENTER));
      stoppedMessage.add (new Button ("Reconnect"));
*/
      stoppedMessage = new LoginScreen (hostname, port);

      toolbar = new Panel ();
      toolbar.setLayout (new BorderLayout ());
      toolbarText = new Label ("-");
      toolbar.add ("Center", toolbarText);
      
      caughtUpIndicator = new CaughtUpIndicator (true, null);
      netIdleIndicator = new IdleIndicator (false);

      indicators = new Panel ();
      indicators.setLayout (new FlowLayout ());
      netIdleIndicator.resize (15, 15);
      indicators.add (netIdleIndicator);
      caughtUpIndicator.resize (15, 15);
      indicators.add (caughtUpIndicator);

      toolbar.add ("East", indicators);

      navButtons[0] = new Button ("NW");
      navButtons[1] = new Button ("N");
      navButtons[2] = new Button ("NE");
      navButtons[3] = new Button ("W");
      navButtons[4] = new Button ("E");
      navButtons[5] = new Button ("SW");
      navButtons[6] = new Button ("S");
      navButtons[7] = new Button ("SE");

      Container north = new Panel ();
      north.setLayout (new BorderLayout ());
      north.add ("East", navButtons[2]);
      north.add ("Center", navButtons[1]);
      north.add ("West", navButtons[0]);
      north.add ("North", new Label ("Kansas viewer: built " + BuildInfo.buildDate + " on host " + BuildInfo.buildHost));

      Container south = new Panel ();
      south.setLayout (new BorderLayout ());
      south.add ("East", navButtons[7]);
      south.add ("Center", navButtons[6]);
      south.add ("West", navButtons[5]);
      south.add ("South", toolbar);

      setLayout (new BorderLayout ());
      add ("North", north);
      add ("South", south);
      add ("East", navButtons[4]);
      add ("West", navButtons[3]);
      add ("Center", stoppedMessage);
      resize (size ().width, size ().height);

// Do not automatically start the viewer.  Instead, start at the login screen
//      bailin ();
   }

   public void destroy ()
   {
      if (disp != null)
         disp.bailout ();
   }

   public void start ()
   {
   }

   public void bailin ()
   {
      // bail out if we can't init in 10 sec
      BailoutTimer initTimeout = new BailoutTimer ((BailInOut) this, 10000);

      if ((disp == null) && canStart)
         {
         System.out.println ("  starting");

         BrowserPanel browser = null;

         boolean cutout = (getParam ("showCutoutLens", "false").equals ("true"));
         boolean radarViewer = (getParam ("showRadarView", "false").equals ("true"));
         boolean lensRadarViewer = (getParam ("showLensRadarView", "false").equals ("true"));

         if (cutout)
            {
            browser = new CutoutBrowserPanel (null, null, viewOrigin, toolbarText, getParam ("lensInnerRadiusFactor", 0.6));
            BrowserCore insideCore = new ViewerBrowserCore (browser, (BailInOut) this, 
                                                            stoppedMessage.getHostname (), stoppedMessage.getPort (),
                                                            stoppedMessage.getLoginName (), stoppedMessage.getPassword (),
                                                            caughtUpIndicator, netIdleIndicator);
            caughtUpIndicator.setBrowser ((ViewerBrowserCore) insideCore);
            ((CutoutBrowserPanel)browser).setInsideBrowserCore (insideCore);

            BrowserCore outsideCore = new LensRadarViewerBrowserCore (browser, (BailInOut) this, 
                                                                 stoppedMessage.getHostname (), stoppedMessage.getPort (),
                                                                      getParam ("lensInnerRadiusFactor", 0.6));
            ((CutoutBrowserPanel)browser).setOutsideBrowserCore (outsideCore);
            }
         else
            {
            browser = new BrowserPanel (null, viewOrigin, toolbarText);
            BrowserCore core = null;

            if (radarViewer)
               {
               core = new RadarViewerBrowserCore (browser, (BailInOut) this, 
                                                  stoppedMessage.getHostname (), stoppedMessage.getPort (),
                                                  getParam ("radarXScale", 10.0), getParam ("radarYScale", 10.0));   
               caughtUpIndicator.setBrowser (null);
               }
            else if (lensRadarViewer)
               {
               core = new LensRadarViewerBrowserCore (browser, (BailInOut) this, 
                                                      stoppedMessage.getHostname (), stoppedMessage.getPort (),
                                                      getParam ("lensInnerRadiusFactor", 0.6));
               caughtUpIndicator.setBrowser (null);
               }
            else
               {
               core = new ViewerBrowserCore (browser, (BailInOut) this, 
                                             stoppedMessage.getHostname (), stoppedMessage.getPort (),
                                             stoppedMessage.getLoginName (), stoppedMessage.getPassword (), 
                                             caughtUpIndicator, netIdleIndicator);
               caughtUpIndicator.setBrowser ((ViewerBrowserCore) core);
               }

            browser.setBrowserCore (core);
            }

         disp = browser;
         if (stoppedMessage != null)
            remove (stoppedMessage);
         add ("Center", disp);
         resize (size ().width, size ().height);
         validate ();
         repaint ();

         if (disp != null)
            disp.bailin ();

         if (disp != null)      // failure here is an indication of failure to bailin
            {
            for (int i=0; i<8; ++i)
               navButtons[i].enable ();

            caughtUpIndicator.setValue (true);
            netIdleIndicator.setValue (false);
            }
         }

      // If we make it here in time, cancel the timeout
      initTimeout.stop ();
   }

   public void stop ()
   {
   }

   public synchronized void bailout ()
   {
      if ((disp != null) && (stoppedMessage != null))
         {
         System.out.println ("Bailing out applet");
         remove (disp);
         add ("Center", stoppedMessage);
         resize (size ().width, size ().height);
         validate ();
         repaint ();

         BrowserPanel tempDisp = disp;

         disp = null;
         updateToolbarText ();

         for (int i=0; i<8; ++i)
            navButtons[i].disable ();

         System.out.println ("About to bailout display");
         tempDisp.bailout ();
         // May not get past here, since this thread might be monitorThread, which just
         // got killed as the last step of the destroy
         System.out.println ("Back from that");
         }
      else
         System.out.println ("Couldn't bail out");
   }

   public void updateToolbarText ()
   {
      if (disp == null)
         toolbarText.setText ("disconnected.");
      else
         toolbarText.setText ("connected");
/*
         toolbarText.setText ("" + ((int) disp.xViewOrigin + disp.xMouseLoc) + ", " + 
                                   ((int) disp.yViewOrigin + disp.yMouseLoc) + "  " +
                                   disp.selfObjects.size () + " object" + 
                                   ((disp.selfObjects.size () == 1) ? "." : "s."));
*/
   }

   public boolean action (Event evt, Object obj)
   {
      if (evt.target instanceof Button)
         {
         String label = (String) obj;

         if (label.equals ("Reconnect"))
            {
            System.out.println ("Reconnecting...");
            bailin ();
            return (true);
            }

         disp.moveTowards (label);

         return (true);
         }
      return (false);
   }
}

