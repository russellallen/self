//-------------------------------------------------------------------------
// Kansas Java interface -- bringing Kansas to the Web
//
//   Structure.java
//
// $Revision: 30.1 $
//      Andy Collins, Sun Microsystems Laboratories, Summer 1996
//-------------------------------------------------------------------------


//------------------------------------------------------------------
// Structure.java - general structural interfaces and classes for
//                  the Java Self browsers
// Andy Collins, 8/5/96
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// Interfaces:
//
//   BailInOut             requires bailin () and bailout () methods to
//                         connect or disconnect itself and all children.
//                         All components in the browser will implement this
//                         so that the top-level applet can be used as a 
//                         total browser bailout point to disconnect and
//                         put the program in a state from which it can
//                         reconnect.
//
//   Browser               a generalized view into some logical rectangular
//                         areas, supporting management both of the view
//                         area and damage-list style redraws.  A browser
//                         is presumed to use a BrowserCore to do the actual
//                         drawing.
//
// Classes:
//
//   BrowserPanel          is a Panel which can contain a browser core
//   BrowserMorph          is a Morph which can contain a browser core
//
//     see Viewer.java and RadarViewer.java for browser core
//     implementations.  The interface used is BailInOut down and
//     Browser up
//------------------------------------------------------------------
import java.awt.*;
import java.applet.Applet;
import java.io.*;
import java.net.*;
import java.util.*;

//------------------------------------------------------------------
//------------------------------------------------------------------
interface Browser extends BailInOut
{
   public void setBrowserCore (BrowserCore core);

   // view area management
   public Point getViewOrigin ();
   public void setViewOrigin (Point p);
   public Dimension getViewSize ();
   public Rectangle getViewArea ();
   public void moveTowards (String direction);
   public void moveTowards (String direction, float fraction);

   // coordinate xforms
   public Rectangle screenToLogical (Rectangle screen);
   public Rectangle logicalToScreen (Rectangle logical);

   // painting management
   public void redrawRect (Rectangle r);
   public void issueRepaint ();

   // misc
   public void setMessage (String msg);   
   public Point getGlobalMouseLoc ();
   public Component getComponent ();
}

//------------------------------------------------------------------
//------------------------------------------------------------------
class BrowserCore implements BailInOut
{
   Browser ownerBrowser;
   BailInOut bailoutPoint;

   BrowserCore (BrowserPanel browser, BailInOut bailoutPt)
   {
      ownerBrowser = browser;
      bailoutPoint = bailoutPt;
   }

   public void bailin ()
   {
   }

   public synchronized void bailout ()
   {
   }

   public void paint (Graphics g, Rectangle region)
   {
   }

   public void notifyViewChanged ()
   {
   }

   public void notifyShouldDisable (int numPaintsPending)
   {
   }
   public void notifyShouldEnable ()
   {
   }

   public boolean uiEvent (Event evt, int x, int y, int key)
   {
      return (false);
   }

   // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
   // passback stuff

   void redrawRect (Rectangle r)
   {
      ownerBrowser.redrawRect (r);
   }
   void issueRepaint ()
   {
      ownerBrowser.issueRepaint ();
   }

   public Component getComponent ()
   {
      return (ownerBrowser.getComponent ());
   }
}

//------------------------------------------------------------------
//------------------------------------------------------------------
class BrowserPanel extends Panel implements Browser
{
   protected Point logicalViewOrigin = null;
   protected BrowserCore browserCore = null;
   protected Label messageLabel;

   public BrowserPanel (BrowserCore core, Point viewOrigin, Label messageLabel)
   {
      logicalViewOrigin = viewOrigin;
      browserCore = core;
      this.messageLabel = messageLabel;
   }

   public void setMessage (String msg)
   {
      messageLabel.setText (msg);
   }

   public Component getComponent ()
   {
      return ((Component) this);
   }

   // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
   // BailInOut support
   public void bailin ()
   {
      if (browserCore != null)
         browserCore.bailin ();
   }
   public synchronized void bailout ()
   {
      if (browserCore != null)
         browserCore.bailout ();
   }

   // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
   // Structure management
   public void setBrowserCore (BrowserCore core)
   {
      browserCore = core;
//      browserCores.addElement (core);
   }

   // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
   // Get/Set the viewing area in logical coordinates:

   public Point getViewOrigin ()
   {
      return (logicalViewOrigin);
   }
   public void setViewOrigin (Point p)
   {
      logicalViewOrigin.x = p.x;
      logicalViewOrigin.y = p.y;
   }

   // No sets because changing the logical to physical ratio is not allowed
   public Dimension getViewSize ()    
   {
      return (new Dimension (size ().width, size ().height));
   }
   public Rectangle getViewArea ()
   {
      return (new Rectangle (logicalViewOrigin.x, logicalViewOrigin.y,
                             size ().width, size ().height));
   }

   // Move towards one of ("N", "E", "S", "W", "NE", "NW", "SW", "SE")
   // by either an 1/2 or by a fraction of the current view
   // size in that dimension

   public void moveTowards (String direction)
   {
      moveTowards (direction, (float) 0.25);
   }
   public void moveTowards (String direction, float fraction)
   {
      Point viewOrigin = getViewOrigin ();
      Dimension viewSize = getViewSize ();

      if (direction.equals ("NW") || direction.equals ("N") || direction.equals ("NE"))
         viewOrigin.y -= viewSize.height * fraction;
      if (direction.equals ("SW") || direction.equals ("S") || direction.equals ("SE"))
         viewOrigin.y += viewSize.height * fraction;

      if (direction.equals ("NW") || direction.equals ("W") || direction.equals ("SW"))
         viewOrigin.x -= viewSize.width * fraction;
      if (direction.equals ("NE") || direction.equals ("E") || direction.equals ("SE"))
         viewOrigin.x += viewSize.width * fraction;

      Rectangle oldViewArea = getViewArea ();
      setViewOrigin (viewOrigin);
      redrawRect (oldViewArea);
      redrawRect (getViewArea ());
      issueRepaint ();

      browserCore.notifyViewChanged ();
   }

   public void reshape (int x, int y, int width, int height)
   {
      super.reshape (x, y, width, height);
      makeDoubleBuffer (width, height);

      browserCore.notifyViewChanged ();
   }

   // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
   // Coordinte transforms, to coords relative to this Panel
   public Rectangle screenToLogical (Rectangle screen)
   {
      // *****
      return (new Rectangle (0,0,0,0));
   }
   public Rectangle logicalToScreen (Rectangle logical)
   {
      // *****
      return (new Rectangle (0,0,0,0));
   }

   // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
   // Painting management

   public void update (Graphics g)
   {
      paint (g);
   }

   protected Dimension offscreenSize;
   protected Image offscreenImage;
   protected Graphics offscreenGC = null;

   protected void makeDoubleBuffer (int width, int height)
   {
      if ((width > 0) && (height > 0))
         {
         offscreenSize = new Dimension (width, height);
         offscreenImage = createImage (width, height);
         offscreenGC = offscreenImage.getGraphics ();
         offscreenGC.setColor (new Color (240, 240, 240));
         offscreenGC.fillRect (0, 0, width, height);
         }
      else
         offscreenGC = null;
   }

   private Vector damageRects = new Vector ();

   public void redrawRect (Rectangle passedRect)
   {
      boolean foundOne = false;
      Rectangle rect = new Rectangle (passedRect.x - 20, passedRect.y - 20, 
                                      passedRect.width + 40, passedRect.height + 40);

      synchronized (damageRects)
         {
         for (int i=0; i<damageRects.size (); ++i)
            if (rect.intersects ((Rectangle) damageRects.elementAt (i)))
               {
               foundOne = true;
               damageRects.setElementAt (((Rectangle) damageRects.elementAt (i)).union (rect), i);
               }
         if (!foundOne)
            damageRects.addElement (rect);
         }
   }

   protected int numPaintsPending = 0;
   protected boolean paintsPending = false;
   public void issueRepaint ()
   {
      synchronized (damageRects)
         {
         if (!paintsPending)
            repaint ();
         paintsPending = true;
         ++numPaintsPending;
         if ((numPaintsPending % 10) == 0)
            System.out.println ("!!! now have " + numPaintsPending + " paints pending.");
         browserCore.notifyShouldDisable (numPaintsPending);
         }
   }

   public void paint (Graphics g)
   {
      if (offscreenGC == null)
         makeDoubleBuffer (size ().width, size ().height);
      if (offscreenGC == null)
         return;

      synchronized (damageRects)
         {
         for (int i=0; i < damageRects.size (); ++i)
            {
            Point viewOrigin = getViewOrigin ();
            Rectangle rect = (Rectangle) damageRects.elementAt (i);
            Rectangle xlated = new Rectangle (rect.x - viewOrigin.x, rect.y - viewOrigin.y,
                                              rect.width, rect.height);

            Graphics drawOnGC = offscreenGC.create ();
            drawOnGC.setColor (new Color (240, 240, 240));
            drawOnGC.fillRect (xlated.x, xlated.y, xlated.width, xlated.height);
            drawOnGC.clipRect (xlated.x, xlated.y, xlated.width, xlated.height);

            browserCore.paint (drawOnGC, xlated);
            }
         damageRects = new Vector (); 

         paintsPending = false;
         numPaintsPending = 0;
         browserCore.notifyShouldEnable ();
         }

      g.drawImage (offscreenImage, 0, 0, this);
   }  

   // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
   // event and focus management

   Boolean haveFocus = Boolean.FALSE;
   public boolean gotFocus (Event evt, Object what)
   {
      synchronized (haveFocus)
         {
         haveFocus = Boolean.TRUE;
         }
      return (true);
   }
   public boolean lostFocus (Event evt, Object what)
   {
      synchronized (haveFocus)
         {
         haveFocus = Boolean.FALSE;
         }
      return (true);
   }

   private boolean uiEvent (Event evt, int x, int y, int key)
   {
      boolean needToGetFocus;
      synchronized (haveFocus)
         {
         needToGetFocus = !haveFocus.booleanValue ();
         }
      if (needToGetFocus)
         requestFocus ();

      if ((evt.id == Event.MOUSE_MOVE) || (evt.id == Event.MOUSE_DRAG))
         {
         xMouseLoc = x;
         yMouseLoc = y;
         }
 
      return (browserCore.uiEvent (evt, x, y, key));
   }

   int xMouseLoc;
   int yMouseLoc;

   public Point getGlobalMouseLoc ()
   {
      return (new Point (xMouseLoc + getViewOrigin ().x, yMouseLoc + getViewOrigin ().y));
   }

   public boolean mouseMove (Event evt, int x, int y) { xMouseLoc = x; yMouseLoc = y; return (uiEvent (evt, x, y, -1)); }
   public boolean mouseDrag (Event evt, int x, int y) { xMouseLoc = x; yMouseLoc = y; return (uiEvent (evt, x, y, -1)); }
   public boolean mouseUp   (Event evt, int x, int y) { xMouseLoc = x; yMouseLoc = y; return (uiEvent (evt, x, y, -1)); }
   public boolean mouseDown (Event evt, int x, int y) { xMouseLoc = x; yMouseLoc = y; return (uiEvent (evt, x, y, -1)); }

   public boolean keyUp     (Event evt, int key)      { return (uiEvent (evt, xMouseLoc, yMouseLoc, key)); }
   public boolean keyDown   (Event evt, int key)      { return (uiEvent (evt, xMouseLoc, yMouseLoc, key)); }

}


