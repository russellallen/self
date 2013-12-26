//-------------------------------------------------------------------------
// Kansas Java interface -- bringing Kansas to the Web
//
//   SelfDisconnectButton.java
//
// $Revision: 30.1 $
//      Andy Collins, Sun Microsystems Laboratories, Summer 1996
//-------------------------------------------------------------------------

//-------------------------------------------------------------------------
// a simple class that displays a button to order any/all SelfViewers in
// the AppletContext to disconnect (using the bailout () method).
//
// Andy Collins, 7/16/96
//-------------------------------------------------------------------------

import java.awt.*;
import java.applet.Applet;
import java.io.*;
import java.net.*;
import java.util.*;
//import SelfViewer;

public class SelfDisconnectButton extends Applet
{
   public void init ()   
   {
   setLayout (new BorderLayout ());
   add ("Center", new Button ("Disconnect"));
   }

   public void destroy ()
   {
   }

   public void start ()
   {
   }

   public void stop ()
   {
   }
 
   public boolean action (Event evt, Object obj)
   {
      if (evt.target instanceof Button)
         {
         String label = (String) obj;

         if (label.equals ("Disconnect"))
            {
            Enumeration e = getAppletContext ().getApplets ();
            while (e.hasMoreElements ())
               {
               Applet app = (Applet) e.nextElement ();
               if (app instanceof BailInOut)
                  ((BailInOut)app).bailout ();
               }
            return (true);
            }

         return (true);
         }
      return (false);
   }

}
