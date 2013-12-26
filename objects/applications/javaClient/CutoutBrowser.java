import java.awt.*;
import java.awt.image.*;
import java.applet.Applet;
import java.io.*;
import java.net.*;
import java.util.*;

//-------------------------------------------------------------------------
// Kansas Java interface -- bringing Kansas to the Web
//
//   CutoutBrowser.java the Browser for the fish-eye view browser
//
// $Revision: 30.1 $
//      Andy Collins, Sun Microsystems Laboratories, Summer 1996
//-------------------------------------------------------------------------

class CircleFilter extends RGBImageFilter 
{
   Point center;
   int radius;
   double radiusFactor;

   public CircleFilter (double radiusFactor, Rectangle area)
   {
      this.radiusFactor = radiusFactor;
      setArea (area);
   }

   public void setArea (Rectangle area)
   {
      center = new Point (area.x + area.width / 2, area.y + area.height / 2);

      int xr = area.width / 2;
      int yr = area.height / 2;
      radius = (int) (radiusFactor * Math.sqrt (xr * xr + yr * yr));
      System.out.println ("Filter set up: center (" + center.x + ", " + center.y + ") radius " + radius);

   }

   public int filterRGB (int x, int y, int rgb)
   {
      if ((x - center.x) * (x - center.x) + (y - center.y) * (y - center.y) <= (radius * radius))
         {
         return (0x00000000);    // alpha = 00
         }
      else
         return (rgb);
   }
}

//----------------------------------------------------------------------------------
// A browser panel which keeps two cores, and displays one of them inside a 
// circular region and the other one outside that region
//----------------------------------------------------------------------------------

class CutoutBrowserPanel extends BrowserPanel
{
   CircleFilter imageFilter = null;
   private BrowserCore outsideBrowserCore;

   public CutoutBrowserPanel (BrowserCore insideBrowserCore, BrowserCore outsideBrowserCore,
                              Point viewOrigin, Label messageLabel, double radiusFactor)
   {
      super (insideBrowserCore, viewOrigin, messageLabel);
      imageFilter = new CircleFilter (radiusFactor, getViewArea ());
      this.outsideBrowserCore = outsideBrowserCore;
   }

   public void bailin ()
   {
      super.bailin ();
      if (outsideBrowserCore != null)
         outsideBrowserCore.bailin ();
   }

   public void bailout ()
   {
      super.bailout ();
      if (outsideBrowserCore != null)
         outsideBrowserCore.bailout ();
   }

   public void setOutsideBrowserCore (BrowserCore core)
   {
      outsideBrowserCore = core;
   }
   public void setInsideBrowserCore (BrowserCore core)
   {
      super.setBrowserCore (core);
   }

   public void moveTowards (String direction)
   {
      super.moveTowards (direction);
      outsideBrowserCore.notifyViewChanged ();
   }
   public void reshape (int x, int y, int width, int height)
   {
      super.reshape (x, y, width, height);
      outsideBrowserCore.notifyViewChanged ();
   }

   protected Image outsideOffscreenImage;
   protected Graphics outsideOffscreenGC = null;

   protected Image insideOffscreenImage;
   protected Graphics insideOffscreenGC = null;

   protected void makeDoubleBuffer (int width, int height)
   {
      super.makeDoubleBuffer (width, height);

      if ((width > 0) && (height > 0))
         {
         outsideOffscreenImage = createImage (width, height);
         outsideOffscreenGC = outsideOffscreenImage.getGraphics ();
         outsideOffscreenGC.setColor (new Color (240, 240, 240));
         outsideOffscreenGC.fillRect (0, 0, width, height);
         outsideOffscreenGC.clipRect (0, 0, width, height);

         insideOffscreenImage = createImage (width, height);
         insideOffscreenGC = insideOffscreenImage.getGraphics ();
         insideOffscreenGC.setColor (new Color (240, 240, 240));
         insideOffscreenGC.fillRect (0, 0, width, height);
         }
      else
         {
         insideOffscreenGC = null;
         outsideOffscreenGC = null;
         }
   }

   // Note that the outside core is drawn without any damage rectangles.
   // This is Ok as long as it is a radarviewer

   public void paint (Graphics g)
   {
      // Painting: first paint the outside image.  Then XOR the inside image, then
      // paint a black circle over the cutout, then XOR the insize image again.  The
      // outside area has been painted and double XORed, and the inside area has 
      // been painted black, and then XORed once, which puts the XORed values in

      if (outsideOffscreenGC == null)
         makeDoubleBuffer (size ().width, size ().height);
      if (outsideOffscreenGC == null)
         return;

      Rectangle xlated = new Rectangle (0,0,size ().width, size ().height);

      // Draw the outside image into a buffer

      outsideOffscreenGC.setColor (new Color (240, 240, 240));
      outsideOffscreenGC.fillRect (0, 0, size ().width, size ().height);
      outsideBrowserCore.paint (outsideOffscreenGC, xlated);

      // Draw the inside image into a buffer
//      insideOffscreenGC.setColor (new Color (240, 240, 240));
//      insideOffscreenGC.fillRect (0, 0, size ().width, size ().height);
      super.paint (insideOffscreenGC);

      outsideOffscreenGC.setXORMode (Color.black);
      outsideOffscreenGC.drawImage (insideOffscreenImage, 0, 0, this);
      outsideOffscreenGC.setPaintMode ();
      outsideOffscreenGC.setColor (Color.black);

      int xr = size ().width / 2;
      int yr = size ().height / 2;
      int radius = (int) (0.6 * Math.sqrt (xr * xr + yr * yr));

      int x = size ().width / 2 - radius;
      int y = size ().height / 2 - radius;
      outsideOffscreenGC.fillOval (x, y, radius * 2, radius * 2);

      outsideOffscreenGC.setXORMode (Color.black);
      outsideOffscreenGC.drawImage (insideOffscreenImage, 0, 0, this);
      outsideOffscreenGC.setPaintMode ();

      g.drawImage (outsideOffscreenImage, 0, 0, this);
   }
}
