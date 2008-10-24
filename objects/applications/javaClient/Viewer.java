import java.awt.*;
import java.applet.Applet;
import java.io.*;
import java.net.*;
import java.util.*;

//-------------------------------------------------------------------------
// Kansas Java interface -- bringing Kansas to the Web
//
//   Viewer.java -- The standard browser core
//
// $Revision: 30.1 $
//      Andy Collins, Sun Microsystems Laboratories, Summer 1996
//-------------------------------------------------------------------------


//----------------------------------------------------------------------------------
//----------------------------------------------------------------------------------
abstract class CanvasObject extends Object
{
   Color color;

   // posn is the position of the owning Self object, and should be treated as
   // an offset (i.e. subtracted when constructing and added when drawing)

   public CanvasObject (SelfObjectState cmd, Point posn)
   {
      try
         {
         color = new Color ((float) cmd.getNumberValue ("c.r"),
                            (float) cmd.getNumberValue ("c.g"),
                            (float) cmd.getNumberValue ("c.b"));
         }
      catch (SelfMissingStateException e)
         {
         color = Color.black;
         }
   }

   public void paintBase (Graphics g, double xOffset, double yOffset)
   {
   }

   public void paint (Graphics g, double xOffset, double yOffset, Point posn, boolean shadowFlag)
   {
      if (shadowFlag)
         g.setColor (SelfMorph.shadowColor);
      else
         g.setColor (color);

      paintBase (g, xOffset + posn.x, yOffset + posn.y);
   }
}

class CanvasImageObject extends CanvasObject
{
   Image image;
   int xLoc;
   int yLoc;
   Component comp;

   public CanvasImageObject (SelfObjectState cmd, Point posn, Component comp)
   {
      super (cmd, posn);

//      System.out.println ("Creating image object");

      this.comp = comp;
      String colors;
      String pixels;
      int width;

      try
         {
         xLoc = (int) cmd.getNumberValue ("x") - posn.x;
         yLoc = (int) cmd.getNumberValue ("y") - posn.y;
         colors = cmd.getStringValue ("c");
         pixels = cmd.getStringValue ("p");
         width = (int) cmd.getNumberValue ("w");
         }
      catch (SelfMissingStateException e)
         {
         xLoc = 0;
         yLoc = 0;

         // 1x1 bitmap of a black dot
         colors = "ff000000";
         pixels = "00";
         width = 1;
         }

      try
         {
         image = StringImageCreator.createFrom (colors, pixels, width, comp);
         }
      catch (Exception e)
         {
         image = null;
         System.out.println ("Exception creating image !!!!!");
         }
   }

   public void paintBase (Graphics g, double xOffset, double yOffset)
   {
      if (image != null)
         g.drawImage (image, (int) (xLoc + xOffset), (int) (yLoc + yOffset), comp);
   }
}

class CanvasTextObject extends CanvasObject
{
   String string;
   Font font;
   int xLoc;
   int yLoc;

   public CanvasTextObject (SelfObjectState cmd, Point posn)
   {
      super (cmd, posn);
      try
         {
         string = cmd.getStringValue ("s");

         xLoc = (int) cmd.getNumberValue ("x") - posn.x;
         yLoc = (int) cmd.getNumberValue ("y") - posn.y;

         font = new Font (FontManager.resolveXFont (cmd.getStringValue ("fn")),
                          FontManager.extractStyle (cmd.getStringValue ("fn")),
                          (int) cmd.getNumberValue ("fs"));
         }
      catch (SelfMissingStateException e)
         {
         string = "";
         xLoc = 0;
         yLoc = 0;
         font = new Font ("TimesRoman", Font.PLAIN, 12);
         }
   }

   public void paintBase (Graphics g, double xOffset, double yOffset)
   {
      g.setFont (font);
      g.drawString (string, (int) (xLoc + xOffset), (int) (yLoc + yOffset));
   }
}

abstract class CanvasWidthObject extends CanvasObject
{
   int width;

   public CanvasWidthObject (SelfObjectState cmd, Point posn)
   {
      super (cmd, posn);
      try
         {
         width = (int) cmd.getNumberValue ("w");
         }
      catch (SelfMissingStateException e)
         {
         width = 1;
         }
   }

}

abstract class CanvasPointListObject extends CanvasWidthObject
{
   int xpoints[];
   int ypoints[];
   int numPoints;

   public CanvasPointListObject (SelfObjectState cmd, Point posn)
   {
      super (cmd, posn);
      try
         {
         StringTokenizer xvals = new StringTokenizer (cmd.getStringValue ("xs"), ",");
         StringTokenizer yvals = new StringTokenizer (cmd.getStringValue ("ys"), ",");

         numPoints = xvals.countTokens ();
         if (yvals.countTokens () < numPoints)
            numPoints = yvals.countTokens ();         // Take the min, rather than raise an error

         xpoints = new int [numPoints + 1];
         ypoints = new int [numPoints + 1];

         for (int i=0; i<numPoints; ++i)
            {
            xpoints[i] = Integer.valueOf (xvals.nextToken ()).intValue () - posn.x;
            ypoints[i] = Integer.valueOf (yvals.nextToken ()).intValue () - posn.y;
            }

         }
      catch (SelfMissingStateException e)
         {
         // This is a safe default, even if Polygon tries to close it
         numPoints = 0;
         xpoints = new int[1];
         ypoints = new int[1];

         xpoints[0] = 0;
         ypoints[0] = 0;
         }
   }

   // At this point, we can put the paint method here, since the only distinction
   // among the subclasses is closing the polygon

   public void paintBase (Graphics g, double xOffset, double yOffset)
   {
      int xlatedXPoints[] = new int[numPoints];
      int xlatedYPoints[] = new int[numPoints];

      for (int i=0; i<numPoints; ++i)
         {
         xlatedXPoints[i] = xpoints[i] + (int) xOffset;
         xlatedYPoints[i] = ypoints[i] + (int) yOffset;
         }

      if (width < 0)
         g.fillPolygon (xlatedXPoints, xlatedYPoints, numPoints);
      else
         g.drawPolygon (xlatedXPoints, xlatedYPoints, numPoints);
   }
}

class CanvasPolygonObject extends CanvasPointListObject
{
   public CanvasPolygonObject (SelfObjectState cmd, Point posn)
   {
      super (cmd, posn);

      // Complete the polygon         
      xpoints[numPoints] = xpoints[0];
      ypoints[numPoints] = ypoints[0];
      ++numPoints;
   }
}

class CanvasLinesObject extends CanvasPointListObject
{
   public CanvasLinesObject (SelfObjectState cmd, Point posn)
   {
      super (cmd, posn);

      // Don't complete the polygon
   }
}

abstract class CanvasBBoxObject extends CanvasWidthObject
{
   Rectangle bbox;

   public CanvasBBoxObject (SelfObjectState cmd, Point posn)
   {
      super (cmd, posn);
      try
         {
         bbox = new Rectangle ((int) (cmd.getNumberValue ("r.l")) - posn.x,
                               (int) (cmd.getNumberValue ("r.t")) - posn.y,
                               (int) (cmd.getNumberValue ("r.r") -
                                      cmd.getNumberValue ("r.l")),
                               (int) (cmd.getNumberValue ("r.b") -
                                      cmd.getNumberValue ("r.t")));
         }
      catch (SelfMissingStateException e)
         {
         bbox = new Rectangle (0,0,0,0);
         }
   }
}

class CanvasArcObject extends CanvasBBoxObject
{
   int startAngle;
   int spanAngle;

   public CanvasArcObject (SelfObjectState cmd, Point posn)
   {
      super (cmd, posn);
      try
         {
         startAngle = (int) cmd.getNumberValue ("st");
         spanAngle = (int) cmd.getNumberValue ("sp");
         }
      catch (SelfMissingStateException e)
         {
         startAngle = 0; 
         spanAngle = 360;
         }
   }

   public void paintBase (Graphics g, double xOffset, double yOffset)
   {
      if (width < 0)
         g.fillArc ((int) (bbox.x + xOffset), (int) (bbox.y + yOffset), bbox.width, bbox.height,
                    startAngle, spanAngle);
      else
         g.drawArc ((int) (bbox.x + xOffset), (int) (bbox.y + yOffset), bbox.width, bbox.height,
                    startAngle, spanAngle);
   }
}

class CanvasRectObject extends CanvasBBoxObject
{
   public CanvasRectObject (SelfObjectState cmd, Point posn)
   {
      super (cmd, posn);
   }

   public void paintBase (Graphics g, double xOffset, double yOffset)
   {
      if (width < 0)
         g.fillRect ((int) (bbox.x + xOffset), (int) (bbox.y + yOffset), bbox.width, bbox.height);
      else
         g.drawRect ((int) (bbox.x + xOffset), (int) (bbox.y + yOffset), bbox.width, bbox.height);
   }
}

//----------------------------------------------------------------------------------
//----------------------------------------------------------------------------------
class SelfMorph extends Object
{
   protected Vector children;
   protected SelfMorph parent;
   public int index;

   Rectangle baseBounds = new Rectangle (0,0,0,0);
   String objectIDString = null;
   String parentIDString = "<none>";
   boolean isWorldMorphFlag = false;
   Color color = Color.black;
   boolean hasCanvasObjects = false;
   Vector canvasObjects = null;
   int childNumber = 2000000000;    // close enough to maxint
   String canvasCmd = "no canvas command";

   Component comp;

   public SelfMorph (SelfObjectState state, Component comp) throws SelfMissingStateException
   {
      children = new Vector ();
      parent = null;
      index = -42;
      overallBounds = new Rectangle (0,0,0,0);

      this.comp = comp;
      setSelfMorphState (state, comp);      
   }

   public void setState (SelfObjectState objectState) throws SelfMissingStateException
   {
      // I really wanted static binding here, just to save code while forcing
      // my desired ordering on the constructor sequence.  Everyone else is
      // now going to do something equally silly here
      setSelfMorphState (objectState, comp);
   }

   public void setSelfMorphState (SelfObjectState objectState, Component comp) throws SelfMissingStateException
   {
      try
         {
         baseBounds = new Rectangle ((int) objectState.getNumberValue ("baseBounds.left"),
                                     (int) objectState.getNumberValue ("baseBounds.top"),
                                     (int) (objectState.getNumberValue ("baseBounds.right") -
                                            objectState.getNumberValue ("baseBounds.left")),
                                     (int) (objectState.getNumberValue ("baseBounds.bottom") -
                                            objectState.getNumberValue ("baseBounds.top"))); 
         }
      catch (SelfMissingStateException e) {}

      try
         {
         int x = (int) objectState.getNumberValue ("p.l");
         int y = (int) objectState.getNumberValue ("p.t");
         baseBounds.x = x;
         baseBounds.y = y;
         }
      catch (SelfMissingStateException e) {}
       
      try { color = new Color ((float) objectState.getNumberValue ("color.red"),
                               (float) objectState.getNumberValue ("color.green"),
                               (float) objectState.getNumberValue ("color.blue")); }
         catch (SelfMissingStateException e) {}

      try { objectIDString = objectState.getStringValue ("objectID"); }
         catch (SelfMissingStateException e) {}
      try { parentIDString = objectState.getStringValue ("owner"); }
         catch (SelfMissingStateException e) {}
      try { isWorldMorphFlag = objectState.getStringValue ("isWorldMorph").equals ("true"); }
         catch (SelfMissingStateException e) {}
      try 
         { 
         int tempChildNumber = (int) objectState.getNumberValue ("childNumber");
         if (tempChildNumber != -1)
            childNumber = tempChildNumber;
         }
      catch (SelfMissingStateException e) {}

      try
         {
         canvasCmd = objectState.getStringValue ("canvasCmd"); 
         canvasObjects = new Vector ();

         String keyName;
         StringTokenizer tokens = new StringTokenizer (canvasCmd, "|");
         SelfObjectState aCmd = new SelfObjectState ();
 
         while (tokens.hasMoreTokens ())
            {
            keyName = tokens.nextToken ();

            if (tokens.hasMoreTokens ())
               aCmd.setValue (keyName, tokens.nextToken ());
            else
               break;

            if (keyName.equals ("item"))
               {
                try
                  {
                  if (aCmd.getStringValue ("item").equals ("arc"))
                     canvasObjects.addElement (new CanvasArcObject (aCmd, getPosition ()));
                  else if (aCmd.getStringValue ("item").equals ("lines"))
                     canvasObjects.addElement (new CanvasLinesObject (aCmd, getPosition ()));
                  else if (aCmd.getStringValue ("item").equals ("polygon"))
                     canvasObjects.addElement (new CanvasLinesObject (aCmd, getPosition ()));
                  else if (aCmd.getStringValue ("item").equals ("rect"))
                     canvasObjects.addElement (new CanvasRectObject (aCmd, getPosition ()));
                  else if (aCmd.getStringValue ("item").equals ("text"))
                     canvasObjects.addElement (new CanvasTextObject (aCmd, getPosition ()));
                  else if (aCmd.getStringValue ("item").equals ("image"))
                     canvasObjects.addElement (new CanvasImageObject (aCmd, getPosition (), comp));
                  }
               catch (SelfMissingStateException e)
                  {
                  }
               aCmd = new SelfObjectState ();
               }
            }
         hasCanvasObjects = true;
         }
      catch (SelfMissingStateException e)
         {
         }

      if ((color == null) || (objectIDString == null) || (parentIDString == null))
         throw new SelfMissingStateException ("unknown");

      computeOverallBounds ();
   }


   public void setSelfMorphStateUsingNulls (SelfObjectState objectState, Component comp)
   {
      // Check for baseBounds, and set if we find what we need
      Double bbLeft = objectState.getNumberValueOrNull ("baseBounds.left");
      Double bbTop = objectState.getNumberValueOrNull ("baseBounds.top");
      Double bbRight = objectState.getNumberValueOrNull ("baseBounds.right");
      Double bbBottom = objectState.getNumberValueOrNull ("baseBounds.bottom");

      if ((bbLeft != null) && (bbTop != null) && (bbRight != null) && (bbBottom != null))
         {
         baseBounds = new Rectangle ((int) bbLeft.doubleValue (),
                                     (int) bbTop.doubleValue (),
                                     (int) (bbRight.doubleValue () - bbLeft.doubleValue ()),
                                     (int) (bbBottom.doubleValue () - bbTop.doubleValue ())); 
         }
       
      Double x = objectState.getNumberValueOrNull ("p.l");
      Double y = objectState.getNumberValueOrNull ("p.t");
      if ((x != null) && (y != null))
         {
         baseBounds.x = (int) x.doubleValue ();
         baseBounds.y = (int) y.doubleValue ();
         }

       
       Double redVal = objectState.getNumberValueOrNull ("color.red");
       Double greenVal = objectState.getNumberValueOrNull ("color.green");
       Double blueVal = objectState.getNumberValueOrNull ("color.blue");

       if ((redVal != null) && (greenVal != null) && (blueVal != null))
         { 
         color = new Color ((float) redVal.doubleValue (),
                            (float) greenVal.doubleValue (),
                            (float) blueVal.doubleValue ());
         }

      String newOID = objectState.getStringValueOrNull ("objectID");
      if (newOID != null)
         objectIDString = newOID;
      String newOwnerOID = objectState.getStringValueOrNull ("owner");
      if (newOwnerOID != null)
         parentIDString = newOwnerOID;
      String isWorldMorph = objectState.getStringValueOrNull ("isWorldMorph");
      if (isWorldMorph != null)
         isWorldMorphFlag = isWorldMorph.equals ("true");

      Double childNum = objectState.getNumberValueOrNull ("childNumber");
      if (childNum != null)
         { 
         int tempChildNumber = (int) childNum.doubleValue ();
         if (tempChildNumber != -1)
            childNumber = tempChildNumber;
         }

      String newCanvasCmd = objectState.getStringValueOrNull ("canvasCmd");
      if (newCanvasCmd != null)
         {
         canvasCmd = newCanvasCmd; 
         canvasObjects = new Vector ();

         String keyName;
         StringTokenizer tokens = new StringTokenizer (canvasCmd, "|");
         SelfObjectState aCmd = new SelfObjectState ();
 
         while (tokens.hasMoreTokens ())
            {
            keyName = tokens.nextToken ();

            if (tokens.hasMoreTokens ())
               aCmd.setValue (keyName, tokens.nextToken ());
            else
               break;

            if (keyName.equals ("item"))
               {
               try
                  {
                  if (aCmd.getStringValue ("item").equals ("arc"))
                     canvasObjects.addElement (new CanvasArcObject (aCmd, getPosition ()));
                  else if (aCmd.getStringValue ("item").equals ("lines"))
                     canvasObjects.addElement (new CanvasLinesObject (aCmd, getPosition ()));
                  else if (aCmd.getStringValue ("item").equals ("polygon"))
                     canvasObjects.addElement (new CanvasLinesObject (aCmd, getPosition ()));
                  else if (aCmd.getStringValue ("item").equals ("rect"))
                     canvasObjects.addElement (new CanvasRectObject (aCmd, getPosition ()));
                  else if (aCmd.getStringValue ("item").equals ("text"))
                     canvasObjects.addElement (new CanvasTextObject (aCmd, getPosition ()));
                  else if (aCmd.getStringValue ("item").equals ("image"))
                     canvasObjects.addElement (new CanvasImageObject (aCmd, getPosition (), comp));
                  }
               catch (SelfMissingStateException e)
                  {
                  }
               aCmd = new SelfObjectState ();
               }
            }
         hasCanvasObjects = true;
         }
/*
      if ((color == null) || (objectIDString == null) || (parentIDString == null))
         throw new SelfMissingStateException ("unknown");
*/
      computeOverallBounds ();
      }

   public Point getPosition ()
   {
      // World morphs are special, but not so special as to deserve another class
      if (isWorldMorph ())
         return (new Point (0,0));

      // Most morphs work this way
      return (new Point (baseBounds.x, baseBounds.y));
   }
   public Point getGlobalPosition ()
   {
      Point myPosition = getPosition ();

      if ((parent != null) && (parent != this))
         {
         Point parentPosition = parent.getGlobalPosition ();
         return (new Point (myPosition.x + parentPosition.x, myPosition.y + parentPosition.y));
         }
      else
         return (new Point (myPosition.x, myPosition.y));
   }

   Rectangle overallBounds;
   public Rectangle getGlobalBounds ()
   {
      Rectangle globalBounds = new Rectangle (overallBounds.x, overallBounds.y, 
                                              overallBounds.width, overallBounds.height);
      if ((parent != null) && (parent != this))
         {
         Point parentPosition = parent.getGlobalPosition ();
         globalBounds.x += parentPosition.x;
         globalBounds.y += parentPosition.y;
         }
      return (globalBounds);
   }
   void computeOverallBounds ()
   {
      int xmin = 0;
      int ymin = 0;
      int xmax = baseBounds.width;
      int ymax = baseBounds.height;
   
      Rectangle childBounds;

      synchronized (children)
         {
         for (int i=0; i<children.size (); ++i)
            {
            childBounds = ((SelfMorph) children.elementAt (i)).overallBounds;

            if (childBounds.x < xmin) 
               xmin = childBounds.x;
            if (childBounds.y < ymin) 
               ymin = childBounds.y;
            if ((childBounds.x + childBounds.width) > xmax) 
               xmax = childBounds.x + childBounds.width;
            if ((childBounds.y + childBounds.height) > ymax) 
               ymax = childBounds.y + childBounds.height;
            }
         }

      Rectangle retval = new Rectangle (xmin, ymin, xmax - xmin, ymax - ymin);
      retval.x += baseBounds.x;
      retval.y += baseBounds.y;

      // If we are about to change our bounds, then be sure to tell our parent 
      // *after* we do it (not before)
      if (!overallBounds.equals (retval))
         {
         overallBounds = retval;
         if (parent != null)
            parent.computeOverallBounds ();
         }
   }

   public static final Color shadowColor = Color.black.brighter ();

   public void paintBase (Graphics g, double xOffset, double yOffset, boolean shadowFlag)
   {
      if (hasCanvasObjects)
         {
         for (int i=0; i<canvasObjects.size (); ++i)
            ((CanvasObject) canvasObjects.elementAt (i)).paint (g, xOffset, yOffset, getPosition (), shadowFlag);
         }
      else
         {
         if (shadowFlag)
            g.setColor (shadowColor);
         else
            g.setColor (color);

         g.fillRect ((int) (baseBounds.x + xOffset), (int) (baseBounds.y + yOffset),
                     baseBounds.width, baseBounds.height);
         }
   }

   public String asString ()
   {
      return (objectIDString + " a SelfMorph: " + canvasCmd);
   }

   public void printCoreSample (int x, int y, String prefix)
   {
      Rectangle checkRect = new Rectangle (x, y, 1, 1);
      System.out.println (prefix + asString ());
      synchronized (children)
         {
         for (int i = children.size () - 1; i >= 0; --i)
            {
            SelfMorph m = (SelfMorph) children.elementAt (i);
            if (checkRect.intersects (m.baseBounds))
               m.printCoreSample (x - m.getPosition ().x , y - m.getPosition ().y, prefix + "  ");
            }
         }
   }

   public int paint (Graphics g, double xOffset, double yOffset, String prefix, Rectangle damageRect, boolean shadowFlag)
   {
      Rectangle xlated = new Rectangle (overallBounds.x + (int) xOffset, overallBounds.y + (int) yOffset,
                                        overallBounds.width, overallBounds.height);

      if (xlated.intersects (damageRect))
         {
         paintBase (g, xOffset, yOffset, shadowFlag);

         int count = 1;
         synchronized (children)
            {
            for (int i = children.size () - 1; i >= 0; --i)
               {
               count += ((SelfMorph) children.elementAt (i)).paint (g, xOffset + getPosition ().x, yOffset + getPosition ().y, 
                                                                    prefix + "  ", damageRect, shadowFlag);
               }
            }
         return (count);
         }
      else
         return (0);
   }

   int paintCount = 0;

   public void paint (Graphics g, ViewerBrowserCore browser, double xViewMin, double yViewMin, 
                      double xViewMax, double yViewMax, Rectangle damageRect)
   {
      long startMillis = System.currentTimeMillis ();

      // This is called only from the outside, and only on world morphs.  Step 1 is the vacuum cleaner
      // that gets rid of any top-level objects which no longer intersect the viewing area.

      if ((++paintCount % 20) == 0)
         {
         synchronized (children)
            {
            for (int i=children.size () - 1; i >= 0; --i)
               {
               SelfMorph child = ((SelfMorph) children.elementAt (i));
               if ( !(child.intersects (xViewMin, yViewMin, xViewMax, yViewMax)) && 
                    !(child instanceof SelfMyHandMorph) )
                  {
                  removeChild (child);
                  child.removeFrom (browser);
                  }
               }
            }
         }

      long middleMillis = System.currentTimeMillis ();
      int numObjects = paint (g, -1.0 * xViewMin, -1.0 * yViewMin, "", damageRect, false);
      long endMillis = System.currentTimeMillis ();

      System.out.println ("Painted " + numObjects + " objects in " +
                          (endMillis - middleMillis) + " ms.  (+ " + (middleMillis - startMillis) + " ms for vacuum.)  Thread is: "
                         + Thread.currentThread ().hashCode () + " priority: " + Thread.currentThread ().getPriority ());
   }

   public boolean intersects (double xMin, double yMin, double xMax, double yMax)
   {
      if (isWorldMorph ())
         return (true);

      if ((overallBounds.y + overallBounds.height) < yMin)
         return (false);
      if (overallBounds.y > yMax)
         return (false);
      if (overallBounds.x > xMax)
         return (false);
      if (overallBounds.x + overallBounds.width < xMin)
         return (false);

      return (true);
   }

   public void addChild (SelfMorph child, int index)
   {
 /*
     if (child != null)
         System.out.println ("- " + this.objectID () + ".addChild (" + child.objectID () + ", " + index + ")");
      else
         System.out.println ("- " + this.objectID () + ".addChild (null, " + index + ")");
*/         
      if (this == child)
         {
         System.out.println ("!!!!! Bad dog, trying to create parent loop.");
         return;
         }

      if ((child != null) /*&& (index != -1)*/)
         {
         removeChild (child);

         synchronized (children)
            {
            int i = 0;
            for (i=0; (i < children.size ()) && (((SelfMorph) children.elementAt (i)).index < index); ++i) ;
            
            children.insertElementAt (child, i);
            child.index = index;
            child.parent = this;
            }

         computeOverallBounds ();
         }
   }

   public void removeChild (SelfMorph child)
   {
      if ((child!= null) && children.contains (child))
         {
         synchronized (children)
            {
            children.removeElement (child);
            child.parent = null;
            }

         computeOverallBounds ();
         }
   }

   public String parentID ()
   {
      return (parentIDString);
   }

   public String objectID ()
   {
      return (objectIDString);
   }

   public boolean isWorldMorph ()
   {
      return (isWorldMorphFlag);
   }

   public int getChildNumber ()
   {
      return (childNumber);
   }

   public void removeFrom (ViewerBrowserCore browser)
   {
      synchronized (children)
         {
         Enumeration e = children.elements ();
         while (e.hasMoreElements ())
            ((SelfMorph) e.nextElement ()).removeFrom (browser);
         }

      browser.selfObjects.remove (objectID ());
   }
}

//----------------------------------------------------------------------------------
///----------------------------------------------------------------------------------
class SelfHandMorph extends SelfMorph
{
   SelfHandMorph (SelfObjectState objectState, Component comp) throws SelfMissingStateException
   {
      super (objectState, comp);
   }

   public String asString ()
   {
      return (objectID () + " a SelfHandMorph, position = " + getPosition ());
   }

   public int paint (Graphics g, double xOffset, double yOffset, String prefix, Rectangle damageRect, boolean shadowFlag)
   {
      Rectangle xlated = new Rectangle (overallBounds.x + (int) xOffset, overallBounds.y + (int) yOffset,
                                        overallBounds.width, overallBounds.height);

      if (xlated.intersects (damageRect))
         {
         // Draw all my children's shadows
         for (int i = children.size () - 1; i >= 0; --i)
            {
            ((SelfMorph) children.elementAt (i)).paint (g, xOffset + getPosition ().x + 5.0, yOffset + getPosition ().y + 5.0, 
                                                        prefix + "- ", damageRect, true);
            }

         // Draw all my children
         int count = 1;
         for (int i = children.size () - 1; i >= 0; --i)
            {
            count += ((SelfMorph) children.elementAt (i)).paint (g, xOffset + getPosition ().x, yOffset + getPosition ().y, 
                                                                 prefix + "  ", damageRect, shadowFlag);
            }

         // HandMorphs are backwards from the other morphs, and draw themselves on top of their children
         paintBase (g, xOffset, yOffset, shadowFlag);

         return (count);
         }
      else
         return (0);
   }
}


//----------------------------------------------------------------------------------
// SelfMyHandMorph is a very special morph.  It represents my hand object, which
// is in the world on the self side but is never updated to me.  It's position is
// maintained locally, and serves as a base for the position of any objects it owns
// (the process of gaining and losing children happens automatically as I pick up
// and drop things, and this object is in the list of normal objects for that reason)
//
// This object is special-cased to ensure that it is never vacuum cleaned.
//----------------------------------------------------------------------------------
class SelfMyHandMorph extends SelfHandMorph
{
   SelfMyHandMorph (SelfObjectState objectState, Component comp) throws SelfMissingStateException
   {
      super (objectState, comp);
   }

   public String asString ()
   {
      return (objectID () + " my pointer, a SelfMyHandMorph, position = " + getPosition ());
   }

   public void paintBase (Graphics g, double xOffset, double yOffset, boolean shadowFlag)
   {
      // This space intentionally left blank :)
   }

   public void moveTo (double x, double y, BrowserCore browser)
   {
      Rectangle oldGlobalBounds = null;

      if (children.size () > 0)
         oldGlobalBounds = getGlobalBounds ();

      baseBounds.x = (int) x;
      baseBounds.y = (int) y;

      if (parent != null)
         parent.addChild (this, 0);
 
      computeOverallBounds ();

      if (children.size () > 0)
         {
         browser.redrawRect (oldGlobalBounds);
         browser.redrawRect (getGlobalBounds ());
         browser.issueRepaint ();
         }
   }
}

//----------------------------------------------------------------------------------
//----------------------------------------------------------------------------------
class SelfFrameMorph extends SelfMorph
{
   public static final int SELF_BEZEL_STYLE = 0;
   public static final int SELF_FLAT_STYLE = 2;
   public static final int SELF_INSET_BEZEL_STYLE = 1;

   int borderWidth = 0;
   boolean filled = false;
   int frameStyle = SELF_FLAT_STYLE;

   public String asString ()
   {
      return (objectID () + " a SelfFrameMorph, baseBounds = " + baseBounds);
   }

   public SelfFrameMorph (SelfObjectState objectState, Component comp) throws SelfMissingStateException
   {
      super (objectState, comp);
      setSelfFrameMorphState (objectState);
   }
   public void setState (SelfObjectState objectState) throws SelfMissingStateException
   {
      super.setState (objectState);
      setSelfFrameMorphState (objectState);
   }
   public void setSelfFrameMorphState (SelfObjectState objectState) throws SelfMissingStateException
   {
//      System.out.println ("SelfFrameMorph.setState () -- " + objectState.getNumberValue ("borderWidth") +
//                          "; " + objectState.getStringValue ("filled") + "; " + objectState.getNumberValue ("frameStyle"));
  
      try { borderWidth = (int) objectState.getNumberValue ("borderWidth"); }
         catch (SelfMissingStateException e) {}
      try { filled = (0 == objectState.getStringValue ("filled").compareTo ("true"));  }
        catch (SelfMissingStateException e) {}
      try { frameStyle = (int) objectState.getNumberValue ("frameStyle"); }
        catch (SelfMissingStateException e) {}
   }

   public void paintBase (Graphics g, double xOffset, double yOffset, boolean shadowFlag)
   {
      Color base = color;
      Color dark = base.darker ();
      Color light = base.brighter ();

      if (shadowFlag && filled)
         {
         g.setColor (shadowColor);
         g.fillRect ((int) (baseBounds.x + xOffset), (int) (baseBounds.y + yOffset),
                     baseBounds.width, baseBounds.height);
         return;
         }
      else if (shadowFlag)
         {
         base = shadowColor;
         dark = shadowColor;
         light = shadowColor;
         }

      if (filled)
         {
         g.setColor (base);
         g.fillRect ((int) (baseBounds.x + xOffset), (int) (baseBounds.y + yOffset),
                     baseBounds.width, baseBounds.height);
         }

      switch (frameStyle)
         {
         case SELF_BEZEL_STYLE: g.setColor (light); break;
         case SELF_INSET_BEZEL_STYLE: g.setColor (dark); break;
         default: g.setColor (base); break;
         }

      g.fillRect ((int) (baseBounds.x + xOffset), (int) (baseBounds.y + yOffset),
                  baseBounds.width, borderWidth);
      g.fillRect ((int) (baseBounds.x + xOffset), (int) (baseBounds.y + yOffset),
                  borderWidth, baseBounds.height);

      switch (frameStyle)
         {
         case SELF_BEZEL_STYLE: g.setColor (dark); break;
         case SELF_INSET_BEZEL_STYLE: g.setColor (light); break;
         default: g.setColor (base); break;
         }

      int X[] = new int[4];
      int Y[] = new int[4];
      X[0] = (int) (baseBounds.x + xOffset);
      Y[0] = (int) (baseBounds.y + baseBounds.height + yOffset);
      X[1] = (int) (baseBounds.x + borderWidth + xOffset);
      Y[1] = (int) (baseBounds.y + baseBounds.height - borderWidth+ yOffset);
      X[2] = (int) (baseBounds.x + baseBounds.width - borderWidth + xOffset);
      Y[2] = (int) (baseBounds.y + baseBounds.height - borderWidth + yOffset);
      X[3] = (int) (baseBounds.x + baseBounds.width + xOffset);
      Y[3] = (int) (baseBounds.y + baseBounds.height + yOffset);
      g.fillPolygon (X, Y, 4);
//      System.out.println ("Drew polygon 1: " + X[0] +"," + Y[0] + " " + X[1] +"," + Y[1] + " " +
//                                               X[2] +"," + Y[2] + " " + X[3] +"," + Y[3] + " ");
     
      X[0] = (int) (baseBounds.x + baseBounds.width + xOffset);
      Y[0] = (int) (baseBounds.y + baseBounds.height + yOffset);
      X[1] = (int) (baseBounds.x + baseBounds.width - borderWidth + xOffset);
      Y[1] = (int) (baseBounds.y + baseBounds.height - borderWidth + yOffset);
      X[2] = (int) (baseBounds.x + baseBounds.width - borderWidth + xOffset);
      Y[2] = (int) (baseBounds.y + borderWidth + yOffset);
      X[3] = (int) (baseBounds.x + baseBounds.width + xOffset);
      Y[3] = (int) (baseBounds.y + yOffset);
      g.fillPolygon (X, Y, 4);

//      System.out.println ("Drew polygon2 : " + X[0] +"," + Y[0] + " " + X[1] +"," + Y[1] + " " +
//                                               X[2] +"," + Y[2] + " " + X[3] +"," + Y[3] + " ");

   }   
}

//----------------------------------------------------------------------------------
//----------------------------------------------------------------------------------
class SelfUI2Button extends SelfFrameMorph
{
   SelfUI2Button (SelfObjectState objectState, Component comp) throws SelfMissingStateException
   {
      super (objectState, comp);
      setSelfUI2ButtonState (objectState);
   }
   public void setState (SelfObjectState objectState) throws SelfMissingStateException
   {
      super.setState (objectState);
      setSelfUI2ButtonState (objectState);
   }
   public void setSelfUI2ButtonState (SelfObjectState state) throws SelfMissingStateException
   {
      filled = true;
   }

   public String asString ()
   {
      return (objectID () + " a SelfUI2Button, baseBounds = " + baseBounds);
   }

}

//----------------------------------------------------------------------------------
//----------------------------------------------------------------------------------
class SelfLabelMorph extends SelfMorph
{
   Font font = new Font ("TimesRoman", Font.PLAIN, 12);
   String label = "";

   SelfLabelMorph (SelfObjectState objectState, Component comp) throws SelfMissingStateException
   {
      super (objectState, comp);
      setSelfLabelMorphState (objectState);
   }
   public void setState (SelfObjectState objectState) throws SelfMissingStateException
   {
      super.setState (objectState);
      setSelfLabelMorphState (objectState);
   }
   public void setSelfLabelMorphState (SelfObjectState objectState) throws SelfMissingStateException
   {
      try { font = new Font (FontManager.resolveXFont (objectState.getStringValue ("fontName")),
                             FontManager.extractStyle (objectState.getStringValue ("fontName")),
                             (int) objectState.getNumberValue ("fontSize")); }
         catch (SelfMissingStateException e) {}
      try { label = objectState.getStringValue ("label"); }
         catch (SelfMissingStateException e) {}
   }

   public void paintBase (Graphics g, double xOffset, double yOffset, boolean shadowFlag)
   {
      FontMetrics fm = g.getFontMetrics (font);

      Graphics g2 = g.create ((int) (baseBounds.x + xOffset), (int) (baseBounds.y + yOffset),
                              baseBounds.width, baseBounds.height);

      if (shadowFlag)
         g2.setColor (shadowColor);
      else
         g2.setColor (color);
      g2.setFont (font);
      g2.drawString (label, 0, baseBounds.height - fm.getDescent ());
   }

   public String asString ()
   {
      return (objectID () + " a SelfLabelMorph, '" + label + "'");
   }
}
 
//----------------------------------------------------------------------------------
//----------------------------------------------------------------------------------
class SelfCircleMorph extends SelfMorph
{
   SelfCircleMorph (SelfObjectState objectState, Component comp) throws SelfMissingStateException
   {
      super (objectState, comp);
   }

   public void paintBase (Graphics g, double xOffset, double yOffset, boolean shadowFlag)
   {
      if (shadowFlag)
         g.setColor (shadowColor);
      else
         g.setColor (color);

      g.fillOval ((int) (baseBounds.x + xOffset), (int) (baseBounds.y + yOffset),
                  baseBounds.width, baseBounds.height);
   }

   public Point getPosition ()
   {
      return (new Point (baseBounds.x + (baseBounds.width / 2),
                         baseBounds.y + (baseBounds.height / 2 )));
   }

   public String asString ()
   {
      return (objectID () + " a SelfCircleMorph, position = " + getPosition ());
   }
}
 
//----------------------------------------------------------------------------------
//----------------------------------------------------------------------------------
class SelfJavaUserMorph extends SelfMorph
{
   SelfJavaUserMorph (SelfObjectState objectState, Component comp) throws SelfMissingStateException
   {
      super (objectState, comp);
   }

   public void paintBase (Graphics g, double xOffset, double yOffset, boolean shadowFlag)
   {
      if (shadowFlag)
         g.setColor (shadowColor);
      else
         g.setColor (color);

      g.drawRect ((int) (baseBounds.x + xOffset), (int) (baseBounds.y + yOffset),
                  baseBounds.width, baseBounds.height);
   }

   public String asString ()
   {
      return (objectID () + " a SelfJavaUserMorph, baseBounds = " + baseBounds);
   }

}

//----------------------------------------------------------------------------------
//----------------------------------------------------------------------------------
class SelfUI2TextField extends SelfMorph
{
   int numLines = 0;
   String text[] = new String[0];
   Point cursor = new Point (0,0);
   int offset = 0;
   boolean isFocus = false;

   int fontHeight = 0;
   int fontWidth = 0;
   int lineHeight = 0;
   Point cornerOffset = new Point (0,0);
   
   boolean hasSelection = false;
   Point selectionEnd = new Point (0,0);

   Color fontColor = Color.black;
   Color backgroundColor = Color.white;
   Color selectionColor = Color.red;
   Color cursorColor = Color.black;

   SelfUI2TextField (SelfObjectState objectState, Component comp) throws SelfMissingStateException
   {
      super (objectState, comp);
      setSelfUI2TextFieldState (objectState);
   }
   public void setState (SelfObjectState objectState) throws SelfMissingStateException
   {
      super.setState (objectState);
      setSelfUI2TextFieldState (objectState);
   }
   public void setSelfUI2TextFieldState (SelfObjectState objectState) throws SelfMissingStateException
   {
      try { fontHeight = (int) objectState.getNumberValue ("fontHeight");              } catch (SelfMissingStateException e) {}
      try { lineHeight = (int) objectState.getNumberValue ("lineHeight");              } catch (SelfMissingStateException e) {}
      try 
         { 
         fontWidth  = (int) objectState.getNumberValue ("fontWidth");
         }
      catch (SelfMissingStateException e) {}
      try
         {
         cornerOffset = new Point ((int) objectState.getNumberValue ("cornerOffset.x"), 
                                   (int) objectState.getNumberValue ("cornerOffset.y"));
         }
      catch (SelfMissingStateException e) {}

      try { offset  = (int) objectState.getNumberValue ("off");             } catch (SelfMissingStateException e) {}
      try { isFocus = objectState.getStringValue ("focus").equals ("true"); } catch (SelfMissingStateException e) {}

      try { hasSelection = objectState.getStringValue ("hasSelection").equals ("true"); } catch (SelfMissingStateException e) {}

      try { fontColor = new Color ((float) objectState.getNumberValue ("fontColor.red"),
                                   (float) objectState.getNumberValue ("fontColor.green"),
                                   (float) objectState.getNumberValue ("fontColor.blue")); }
         catch (SelfMissingStateException e) {}

      try { backgroundColor = new Color ((float) objectState.getNumberValue ("backgroundColor.red"),
                                         (float) objectState.getNumberValue ("backgroundColor.green"),
                                         (float) objectState.getNumberValue ("backgroundColor.blue")); }
         catch (SelfMissingStateException e) {}

      try { cursorColor = new Color ((float) objectState.getNumberValue ("cursorColor.red"),
                                     (float) objectState.getNumberValue ("cursorColor.green"),
                                     (float) objectState.getNumberValue ("cursorColor.blue")); }
         catch (SelfMissingStateException e) {}

      try { selectionColor = new Color ((float) objectState.getNumberValue ("selectionColor.red"),
                                        (float) objectState.getNumberValue ("selectionColor.green"),
                                        (float) objectState.getNumberValue ("selectionColor.blue")); }
         catch (SelfMissingStateException e) {}

      try 
         { 
         numLines = (int) objectState.getNumberValue ("numLines");
         text = new String[numLines];
         for (int i=0; i<numLines; ++i)
            text[i] = "-";
         }
      catch (SelfMissingStateException e) {}

      try
         {
         cursor = new Point ((int) objectState.getNumberValue ("cursorx"), 
                             (int) objectState.getNumberValue ("cursory"));
         }
      catch (SelfMissingStateException e) {}

      try
         {
         selectionEnd = new Point ((int) objectState.getNumberValue ("selectionx"), 
                                   (int) objectState.getNumberValue ("selectiony"));
         }
      catch (SelfMissingStateException e) {}

      Enumeration e = objectState.getKeys ();
      while (e.hasMoreElements ())
         {
         String s = (String) e.nextElement ();
         if (s.startsWith ("line"))
            {
            try 
               {
               int i = Integer.parseInt (s.substring (4));
               if ((i >= 0) && (i < numLines))
                  text[i] = objectState.getStringValue (s);
               }
            catch (NumberFormatException ex)
               {
               }
            }
         }
   }

   Point selectionUL ()
   {
      Point retval;
      if (cursor.y < selectionEnd.y)
         retval = new Point (cursor.x, cursor.y);
      else if (cursor.x < selectionEnd.x)
         retval = new Point (cursor.x, cursor.y);
      else
         retval = new Point (selectionEnd.x, selectionEnd.y);

      if (retval.y < 0)
         retval.y = 0;
      if (retval.x < 0) 
         retval.x = 0;
      if (retval.y >= numLines)
         retval.y = (numLines - 1);
      if (retval.x > text[retval.y].length ())
         retval.x = text[retval.y].length () - 1;

      return (retval);
   }
   Point selectionLR ()
   {
      Point retval;
      if (cursor.y < selectionEnd.y)
         retval = new Point (selectionEnd.x, selectionEnd.y);
      else if (cursor.x < selectionEnd.x)
         retval = new Point (selectionEnd.x, selectionEnd.y);
      else
         retval = new Point (cursor.x, cursor.y);

      if (retval.y < 0)
         retval.y = 0;
      if (retval.x < 0) 
         retval.x = 0;
      if (retval.y >= numLines)
         retval.y = (numLines-1);
      if (retval.x > text[retval.y].length ())
         retval.x = text[retval.y].length ();

      return (retval);
   }

   Font font = null;
   int actualFontWidth = 0;

   public void paintBase (Graphics g, double xOffset, double yOffset, boolean shadowFlag)
   {
      if (shadowFlag)
         return;

      if ((font == null) || (actualFontWidth != fontWidth))
         {
         int guessSize = 12;
         Font guessFont = new Font ("courier", Font.PLAIN, guessSize);
         int width = g.getFontMetrics (guessFont).stringWidth ("M");    // monospaced font, letter is arbitrary
         while (width > fontWidth)
            {
            --guessSize;
            guessFont = new Font ("courier", Font.PLAIN, guessSize);
            width = g.getFontMetrics (guessFont).stringWidth ("M");
            }
         while (width < fontWidth)
            {
            ++guessSize;
            guessFont = new Font ("courier", Font.PLAIN, guessSize);
            width = g.getFontMetrics (guessFont).stringWidth ("M");
            }
       
         font = guessFont;
         actualFontWidth = width;
         System.out.println ("Font matcher: target was " + fontWidth + "; got " + actualFontWidth + " by using " + guessSize + " points");
         }

      Graphics clipped = g.create ();
      clipped.clipRect ((int) (baseBounds.x + xOffset), (int) (baseBounds.y + yOffset), baseBounds.width, baseBounds.height);
      clipped.setColor (backgroundColor);
      clipped.fillRect ((int) (baseBounds.x + xOffset), (int) (baseBounds.y + yOffset), baseBounds.width, baseBounds.height);
      
      int incr = lineHeight;

      clipped.setFont (font);
      clipped.setColor (fontColor);

      int baseLine = (int) (baseBounds.y + yOffset) - clipped.getFontMetrics (font).getDescent () + cornerOffset.y;
      for (int i = offset; (i < numLines) && (baseLine <= (int) (baseBounds.y + baseBounds.height + yOffset)); ++i)
         {
         baseLine += incr;

         if (hasSelection)
            {
            g.setColor (selectionColor);
            if ((selectionUL ().y < i) && (selectionLR ().y > i))
               g.fillRect ((int) (baseBounds.x + xOffset), baseLine - incr + clipped.getFontMetrics (font).getDescent (), 
                           baseBounds.width, incr);
 
            else if ((selectionUL ().y == i) && (selectionLR ().y == i))
               g.fillRect ((int) (baseBounds.x + xOffset + 
                                  clipped.getFontMetrics (font).stringWidth (text[i].substring (0, selectionUL ().x))) + (cornerOffset.x + 1),
                           baseLine - incr + clipped.getFontMetrics (font).getDescent (),
                           clipped.getFontMetrics (font).stringWidth (text[i].substring (selectionUL ().x, selectionLR ().x)),
                           incr);

            else if (selectionUL ().y == i)
               g.fillRect ((int) (baseBounds.x + xOffset + 
                                  clipped.getFontMetrics (font).stringWidth (text[i].substring (0, selectionUL ().x))) + (cornerOffset.x + 1),
                           baseLine - incr + clipped.getFontMetrics (font).getDescent (),
                           baseBounds.width - clipped.getFontMetrics (font).stringWidth (text[i].substring (0, selectionUL ().x)) - (cornerOffset.x + 1),
                           incr);

            else if (selectionLR ().y == i)
               g.fillRect ((int) (baseBounds.x + xOffset), baseLine - incr + clipped.getFontMetrics (font).getDescent (),
                           clipped.getFontMetrics (font).stringWidth (text[i].substring (0, selectionLR ().x)) + (cornerOffset.x + 1),
                           incr);
            }

         g.setColor (fontColor);
         clipped.drawString (text[i], (int) (baseBounds.x + xOffset) + (cornerOffset.x + 1), baseLine);

         if (!hasSelection && (cursor.y == i))
            {
            int xoff = clipped.getFontMetrics (font).stringWidth (text[i].substring (0, cursor.x));
            g.setColor (cursorColor);
            g.drawLine ((int) (baseBounds.x + xoff + xOffset) + (cornerOffset.x + 1), baseLine + clipped.getFontMetrics (font).getDescent (), 
                        (int) (baseBounds.x + xoff + xOffset) + (cornerOffset.x + 1), baseLine - incr + clipped.getFontMetrics (font).getDescent ());
            }
         }
   }

   public String asString ()
   {
      return (objectID () + " a SelfUI2TextField");
   }
}


//----------------------------------------------------------------------------------
//----------------------------------------------------------------------------------
class SelfImageMorph extends SelfMorph
{
   Image image;
   Image shadowImage;
   Component comp;

   SelfImageMorph (SelfObjectState objectState, Component comp) throws SelfMissingStateException
   {
      super (objectState, comp);
      this.comp = comp;
      setSelfImageMorphState (objectState);
   }
   public void setState (SelfObjectState objectState) throws SelfMissingStateException
   {
      super.setState (objectState);
      setSelfImageMorphState (objectState);
   }
   public void setSelfImageMorphState (SelfObjectState objectState) throws SelfMissingStateException
   {
      String colors;
      String pixels;
      int width;

      try
         {
         colors = objectState.getStringValue ("imageColormap");
         pixels = objectState.getStringValue ("imagePixels");
         width = (int) objectState.getNumberValue ("imageWidth");

         image = StringImageCreator.createFrom (colors, pixels, width, comp);
         shadowImage = StringImageCreator.createFrom (colors, pixels, width, comp, false);
         }
      catch (SelfMissingStateException e)
         {
         }
      catch (StringImageBadSizeException e)
         {
         image = null;
         System.out.println ("bad size Exception creating image !!!!!");
         }
      catch (StringImageException e)
         {
         image = null;
         System.out.println ("generic Exception creating image !!!!!");
         }
   }

   public void paintBase (Graphics g, double xOffset, double yOffset, boolean shadowFlag)
   {
      if (shadowFlag)
         {
         if (shadowImage != null)
            g.drawImage (shadowImage, (int) (getPosition ().x + xOffset), (int) (getPosition ().y + yOffset), comp);
         }
      else
         {
         if (image != null)
            g.drawImage (image, (int) (getPosition ().x + xOffset), (int) (getPosition ().y + yOffset), comp);
         }
   }

   public String asString ()
   {
      return (objectID () + " a SelfImageMorph");
   }
}

//----------------------------------------------------------------------------------
//----------------------------------------------------------------------------------
class SelfTemplateMorph extends SelfMorph
{
   SelfTemplateMorph (SelfObjectState objectState, Component comp) throws SelfMissingStateException
   {
      super (objectState, comp);
   }

   public void paintBase (Graphics g, double xOffset, double yOffset, boolean shadowFlag)
   {
   }

   public String asString ()
   {
      return (objectID () + " a SelfTemplateMorph");
   }
}

//----------------------------------------------------------------------------------
//----------------------------------------------------------------------------------

class MonitorThread extends Thread
{
   BailInOut bailoutPoint;
   ViewerBrowserCore browser;
//   SelfMorph secondChanceMorph;
   SecondChanceList secondChanceList;

   public MonitorThread (ViewerBrowserCore viewer, BailInOut bailoutPt)
   {
      bailoutPoint = bailoutPt;
      browser = viewer;
//      secondChanceMorph = null;
      secondChanceList = new SecondChanceList (10);
   }

   public void run ()
   {
      String keyName;
      SelfObjectState objectState = new SelfObjectState ();

      for (;;)
         {
            try
               {
               browser.downlinkStream.nextToken ();

               if (browser.downlinkStream.ttype == StreamTokenizer.TT_WORD)
                  {
                  keyName = browser.downlinkStream.sval;
                  browser.downlinkStream.nextToken ();

                  if (browser.downlinkStream.ttype == StreamTokenizer.TT_NUMBER)
                     {
                     objectState.setValue (keyName, browser.downlinkStream.nval);
                     }
                  else if ((browser.downlinkStream.ttype == StreamTokenizer.TT_WORD) ||
                           (browser.downlinkStream.ttype == '\"'))
                     {
                     objectState.setValue (keyName, browser.downlinkStream.sval);
                     }
                  else
                     {
                     System.out.println ("Unexpected second token following " + keyName + 
                                         ": type is " + browser.downlinkStream.ttype);
                     bailoutPoint.bailout ();
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

                  // Is this a complete object update, if so, it will end with "objectID"
                  if (0 == keyName.compareTo ("objectID"))
                     {
/*
                     try 
                        {
                        System.out.println ("--- object " + objectState.getStringValue ("objectID") + " downlinked --- ");
                        }
                     catch (Exception e)  
                        {
                        }
*/
                     SelfMorph changedMorph = null;
                     SelfMorph existingParent = null;
                     SelfMorph newParent = null;

                     try
                        {
                        boolean thisIsDownloadObject = false;
                        String dlString = objectState.getStringValueOrNull ("isADownloadObject");
                        if (dlString != null)
                           thisIsDownloadObject = dlString.equals ("true");

                        changedMorph = ((SelfMorph) browser.selfObjects.get (objectState.getStringValue ("objectID")));
                        if (changedMorph != null)
                           existingParent = ((SelfMorph) browser.selfObjects.get (changedMorph.parentID ()));

                        String newOwnerOID = objectState.getStringValueOrNull ("owner");
                        if (newOwnerOID != null)
                           newParent = ((SelfMorph) browser.selfObjects.get (newOwnerOID));

                        // Ok, first thing to check is whether we want to handle this now or go ahead and call
                        // in the reinforcements in the form of requesting a complete download of the substructure
                        // of this morph.  This is done if we know this morph's owner, but not it.  In this case,
                        // odds are this is a small update and not enough information to instantiate this morph
                        // now, so if we are going to download anyway, that will send a complete update, so why
                        // bother instantiating now?
                        if ((changedMorph == null) && (newParent != null) && !thisIsDownloadObject)
                           {
                           // Request more information
//                           System.out.println ("  requesting download from " + objectState.getStringValue ("objectID"));
                           synchronized (browser.uplinkStream)
                              {
//                              browser.netIdleIndicator.setValue (false);

                              browser.uplinkStream.writeBytes ("Download " + objectState.getStringValue ("objectID") + "\r\n");
                              }
                           }
                        else
                           {
                           if (changedMorph == null)
                              {
                              if (0 == objectState.getStringValue ("javaClass").compareTo ("SelfUI2Button"))
                                 changedMorph = new SelfUI2Button (objectState, browser.getComponent ());
                              else if (0 == objectState.getStringValue ("javaClass").compareTo ("SelfFrameMorph"))
                                 changedMorph = new SelfFrameMorph (objectState, browser.getComponent ());
                              else if (0 == objectState.getStringValue ("javaClass").compareTo ("SelfLabelMorph"))
                                 changedMorph = new SelfLabelMorph (objectState, browser.getComponent ());
                              else if (0 == objectState.getStringValue ("javaClass").compareTo ("SelfCircleMorph"))
                                 changedMorph = new SelfCircleMorph (objectState, browser.getComponent ());
                              else if (0 == objectState.getStringValue ("javaClass").compareTo ("SelfJavaUserMorph"))
                                 changedMorph = new SelfJavaUserMorph (objectState, browser.getComponent ());
                              else if (0 == objectState.getStringValue ("javaClass").compareTo ("SelfHandMorph"))
                                 changedMorph = new SelfHandMorph (objectState, browser.getComponent ());
                              else if (0 == objectState.getStringValue ("javaClass").compareTo ("SelfUI2TextField"))
                                 changedMorph = new SelfUI2TextField (objectState, browser.getComponent ());
                              else if (0 == objectState.getStringValue ("javaClass").compareTo ("SelfImageMorph"))
                                 changedMorph = new SelfImageMorph (objectState, browser.getComponent ());
                              else 
                                 changedMorph = new SelfMorph (objectState, browser.getComponent ());

                              // This might get ripped right back out, see below
                              browser.selfObjects.put (objectState.getStringValue ("objectID"), changedMorph);

                              // Now that the world is here, make my hand a child of it and be done with it.
                              if (changedMorph.isWorldMorph ())
                                 {
                                 System.out.println ("Putting myHandMorph into world");
                                 changedMorph.addChild (browser.myHandMorph, 0);
                                 }
                              }                        
                           else
                              {
/*
                              if (changedMorph == secondChanceMorph)
                                 {
                                 secondChanceMorph = null;
                                 }
*/
                              secondChanceList.findAndRemove (changedMorph);

                              Rectangle oldGlobalBounds = changedMorph.getGlobalBounds ();
                              changedMorph.setState (objectState);
                              browser.redrawRect (oldGlobalBounds);
//                              System.out.println ("Object (either found or recovered): " + changedMorph.objectID () + " parent is " + 
//                                                  changedMorph.parentID ());
                              }

//                           System.out.println ("Morph update: objectID " + changedMorph.objectID () + "; parentID: " +
//                                                changedMorph.parentID ());

                           // If we don't know the owner, and this isn't a worldMorph, then it is just
                           // a lost child, and we can drop it.  It will never be drawn.

                           if ((browser.selfObjects.get (changedMorph.parentID ()) != null) || changedMorph.isWorldMorph ())
                              {                             
                              newParent = ((SelfMorph) browser.selfObjects.get (changedMorph.parentID ()));
                              if (newParent != null)
                                 {
//                                 System.out.println ("We have a newParent (" + newParent.objectID () + " for " + changedMorph.objectID () + ")");
                                 if (existingParent != null)
                                    {
//                                    System.out.println ("We have an existingParent (" + 
//                                                        newParent.objectID () + " for " + changedMorph.objectID () + ")");
                                    if (0 != existingParent.objectID ().compareTo (newParent.objectID ()))
                                       {
                                       existingParent.removeChild (changedMorph);
                                       newParent.addChild (changedMorph, changedMorph.getChildNumber ());
                                       }
                                    else
                                       existingParent.addChild (changedMorph, changedMorph.getChildNumber ());
                                    }
                                 else
                                    {
                                    newParent.addChild (changedMorph, changedMorph.getChildNumber ());
                                    }
                                 }
 
                                 browser.redrawRect (changedMorph.getGlobalBounds ());
                              }
                           else
                              {
                              // Whoops - remember to check and see if the orphan object is currently in the 
                              // hash table.  If so, then that object was just deleted, and needs to be
                              // removed here as well

//                              System.out.println ("   Deleting object " + changedMorph.objectID ());
                              if (existingParent != null)
                                 existingParent.removeChild (changedMorph);
                           
                              // New deletion system: delete the object in secondChanceOID, and put myself there
/*
                              if (secondChanceMorph != null)
                                 {
                                 secondChanceMorph.removeFrom (browser);
                                 }
                              secondChanceMorph = changedMorph;
*/
                              SelfMorph victim = (SelfMorph) secondChanceList.insertGetVictim (changedMorph);
                              if (victim != null)
                                 victim.removeFrom (browser);
                              }
 
                           browser.issueRepaint ();
                           browser.updateToolbarText ();
/* This is broken in netscape, so use the disable/enable method
                           if (!thisIsDownloadObject)
                              currentThread ().yield ();
*/
                           }
                        }
                     catch (SelfMissingStateException e)
                        {
//                        System.out.println ("SelfMissingStateException in DL, clearing object: " + e.missingKey );
                        }

//                     objectState = new SelfObjectState ();
                     objectState.clear ();
                     }

                  // Is this a complete object action, if so, it will end with "javaAction"
                  else if (0 == keyName.compareTo ("javaAction"))
                     {
                     try
                        {
//                        objectState = new SelfObjectState ();
                        objectState.clear ();
                        }
                     catch (Exception e)
                        {
                        System.out.println ("EXCEPTION 4");
                        bailoutPoint.bailout ();
                        }
                     }

                  // Is this a simple message ack?  If so, deal with it, but don't clear objectState
                  else if (0 == keyName.compareTo ("javaMessageAck"))
                     {
                     objectState.removeKey ("javaMessageAck");
                     browser.caughtUpIndicator.setValue (true);
                     }

                  // Is this the end of a download, if so yield and let draw
                  else if (0 == keyName.compareTo ("adviseEndOfDownload"))
                     {
                     objectState.removeKey ("adviseEndOfDownload");
//                     browser.netIdleIndicator.setValue (true);
                     currentThread ().yield ();
                     }
                  }
               else
                  {
                  if (browser.downlinkStream.ttype == StreamTokenizer.TT_EOF)
                     {
                     System.out.println ("EOF, closing down");
                     bailoutPoint.bailout ();
                     }
                  }
               }
            catch (IOException e)
               {
               System.out.println ("IOException, closing down");
               bailoutPoint.bailout ();
               }
         }
   }
}

//----------------------------------------------------------------------------------
//----------------------------------------------------------------------------------

class ViewerBrowserCore extends BrowserCore
{
   Socket downlinkSocket;
   public StreamTokenizer downlinkStream;
   Socket uplinkSocket;
   public DataOutputStream uplinkStream;

   public Hashtable selfObjects;
   MonitorThread monitorThread;

   String hostname = "localhost";
   int port = 1420;
   String userName = "java user";
   String userPassword = "";

   public SelfMorph myHandMorph;            // I need to hang on to this from the time I create it
                                            // until the worldMorph arrives.

   public CaughtUpIndicator caughtUpIndicator;
   public IdleIndicator netIdleIndicator;

   ViewerBrowserCore (BrowserPanel browser, BailInOut bailoutPt, String hostname, int port,
                      String userName, String userPassword,
                      CaughtUpIndicator caughtUp, IdleIndicator idle)
   {
      super (browser, bailoutPt);
      caughtUpIndicator = caughtUp;
      netIdleIndicator = idle;

      this.hostname = hostname;
      this.port = port;
      this.userName = userName;
      this.userPassword = userPassword;
   }

   public void updateToolbarText ()
   {
      Point mouse = ownerBrowser.getGlobalMouseLoc ();
      ownerBrowser.setMessage ("" + mouse.x + ", " + mouse.y + "   " + selfObjects.size () + " objects.");
   }

   public void bailin ()
   {
      System.out.println ("initing display...");

      // General initialization stuff
      selfObjects = new Hashtable ();

      try 
         {
         // open the downlink socket (and follow the Self server . protocol)
         downlinkSocket = new Socket (hostname, port);
         System.out.println ("Opened downlink socket");

         DataOutputStream downlinkBackStream = 
                        new DataOutputStream (downlinkSocket.getOutputStream ());
         downlinkBackStream.writeBytes (userName + "&" + userPassword + "\r\n");
         downlinkBackStream.flush ();
         System.out.println ("  wrote my name");

         downlinkStream = new StreamTokenizer (new InstrumentedInputStream (downlinkSocket.getInputStream ()));
//         downlinkStream = new StreamTokenizer (downlinkSocket.getInputStream ());

         downlinkStream.ordinaryChar (39);
         downlinkStream.wordChars (60, 62);
         downlinkStream.eolIsSignificant (false);
         downlinkStream.parseNumbers ();
         if (downlinkStream.nextToken () == StreamTokenizer.TT_WORD)
            {
            System.out.println ("  got my OID");
            // open the uplink socket
            uplinkSocket = new Socket (hostname, port);
            uplinkStream = new DataOutputStream (uplinkSocket.getOutputStream ());
            uplinkStream.writeBytes (downlinkStream.sval + "\r\n");
            
            uplinkStream.writeBytes ("View " + ownerBrowser.getViewOrigin ().x + " " 
                                             + (ownerBrowser.getViewOrigin ().y + ownerBrowser.getViewSize ().height) + " " 
                                             + (ownerBrowser.getViewOrigin ().x + ownerBrowser.getViewSize ().width) + " " 
                                             + ownerBrowser.getViewOrigin ().y+ "\r\n");
            System.out.println ("View " + ownerBrowser.getViewOrigin ().x + " " 
                                        + (ownerBrowser.getViewOrigin ().y + ownerBrowser.getViewSize ().height) + " " 
                                        + (ownerBrowser.getViewOrigin ().x + ownerBrowser.getViewSize ().width) + " "
                                        + ownerBrowser.getViewOrigin ().y);

            // This is the added twiddle of the ! protocol, read the objectID of my hand out of the 
            // stream and set up the object for it
            SelfObjectState objectState = new SelfObjectState ();
            objectState.setValue ("owner", downlinkStream.sval);

            if (downlinkStream.nextToken () == StreamTokenizer.TT_WORD)
               {
               System.out.println ("  got my hands OID");
               if (downlinkStream.sval == null)
                  {
                  System.out.println ("!!!! TT_WORD, but sval is null !!!!");
                  bailoutPoint.bailout ();
                  }

               objectState.setValue ("objectID", downlinkStream.sval);
               objectState.setValue ("owner", "<none>");
               objectState.setValue ("baseBounds.left", ownerBrowser.getViewOrigin ().x);
               objectState.setValue ("baseBounds.right", ownerBrowser.getViewOrigin ().x);
               objectState.setValue ("baseBounds.top", ownerBrowser.getViewOrigin ().y);
               objectState.setValue ("baseBounds.bottom", ownerBrowser.getViewOrigin ().y);
               objectState.setValue ("color.red", 0.0);
               objectState.setValue ("color.green", 0.0);
               objectState.setValue ("color.blue", 0.0);
               objectState.setValue ("isWorldMorph", "false");
       
               try
                  {
                  myHandMorph = new SelfMyHandMorph (objectState, getComponent ());

                  if (downlinkStream.sval == null)
                     {
                     System.out.println ("!!!!!!!! TT_WORD, but sval is null !!!!!!!!");
                     bailoutPoint.bailout ();
                     }

                  selfObjects.put (downlinkStream.sval, myHandMorph);
                  }
               catch (SelfMissingStateException e)
                  {
                  System.out.println ("!!!! This better not happen !!!!");
                  bailoutPoint.bailout ();
                  }
               }
            else
               {
               System.out.println ("!!! no hand morph ID found");
               bailoutPoint.bailout ();
               }

            // Make damn sure that we don't start this thread until *after* we're done with
            // the downlinkStream, 'cause it's gonna start reading it !!!!!
            monitorThread = new MonitorThread (this, bailoutPoint);
            monitorThread.setPriority (Thread.NORM_PRIORITY + 2);
            monitorThread.start ();
            }
         else
            {
            System.out.println ("!!! no user morph ID found");
            bailoutPoint.bailout ();
            }
         } 
      catch (IOException e) 
         {
         System.out.println ("!!! IOException thrown during connect");
         bailoutPoint.bailout ();
         }
   }

   public void bailout ()
   {
      System.out.println ("SelfWorldDisplay.destroy ()");
      try
         {
         if (uplinkStream != null)
            uplinkStream.writeBytes ("Disconnect\r\n");
         }
      catch (IOException e)
         {
         }

      try
         {
         if (uplinkSocket != null)
            uplinkSocket.close ();
         if (downlinkSocket != null)
            downlinkSocket.close ();
         }
      catch (IOException e)
         {
         }

      if (monitorThread != null)
         {
         monitorThread.stop ();
         monitorThread = null;
         }
   }

   public void notifyViewChanged ()
   {
      if (uplinkStream != null)
         {
         try
            {
            uplinkStream.writeBytes ("View " + ownerBrowser.getViewOrigin ().x + " "
                                             + (ownerBrowser.getViewOrigin ().y + ownerBrowser.getViewSize ().height) + " " 
                                             + (ownerBrowser.getViewOrigin ().x + ownerBrowser.getViewSize ().width) + " " 
                                             + ownerBrowser.getViewOrigin ().y+ "\r\n");
            System.out.println ("View " + ownerBrowser.getViewOrigin ().x + " " 
                                        + (ownerBrowser.getViewOrigin ().y + ownerBrowser.getViewSize ().height) + " " 
                                        + (ownerBrowser.getViewOrigin ().x + ownerBrowser.getViewSize ().width) + " " 
                                        + ownerBrowser.getViewOrigin ().y);
            }
         catch (IOException e)
            {
               System.out.println ("IOException on uplink (2), closing down");
               bailoutPoint.bailout ();
            }
         }
   }

   public void notifyShouldDisable (int numPaintsPending)
   {
      if (numPaintsPending > 1)
         {
         try
            {
            synchronized (uplinkStream)
               {
               uplinkStream.writeBytes ("Disable\r\n");
               netIdleIndicator.setValue (false);
               }         
            }
         catch (IOException e)
            {
            }
         }
   }
   public void notifyShouldEnable ()
   {
      try
         {
         synchronized (uplinkStream)
            {
            netIdleIndicator.setValue (true);
            uplinkStream.writeBytes ("Enable\r\n");
            }         
         }
      catch (IOException e)
         {
         }
   }

   public void paint (Graphics g, Rectangle region) 
   {
      Enumeration objects = selfObjects.elements ();
      while (objects.hasMoreElements ())
         {
         SelfMorph currMorph = ((SelfMorph) objects.nextElement ());
         if (currMorph.isWorldMorph ())
            {
            currMorph.paint (g, this, ownerBrowser.getViewOrigin ().x, ownerBrowser.getViewOrigin ().y, 
                             ownerBrowser.getViewOrigin ().x + ownerBrowser.getViewSize ().width, 
                             ownerBrowser.getViewOrigin ().y + ownerBrowser.getViewSize ().height, region);
            }
         }
//      netIdleIndicator.setValue (true);
   }

   public void printCoreSample (int x, int y)
   {
      Enumeration objects = selfObjects.elements ();
      while (objects.hasMoreElements ())
         {
         SelfMorph currMorph = ((SelfMorph) objects.nextElement ());
         if (currMorph.isWorldMorph ())
            {
            currMorph.printCoreSample (x + ownerBrowser.getViewOrigin ().x, y + ownerBrowser.getViewOrigin ().y, "");
            }
         }
   }

   public static final int SELF_BUTTON1_MASK = 256;
   public static final int SELF_BUTTON2_MASK = 512;
   public static final int SELF_BUTTON3_MASK = 1024;
   public static final int SELF_CONTROL_MASK = 4;
   public static final int SELF_SHIFT_MASK = 1;

   int getSelfState (Event evt)
   {
      int retval = 0;
      if ((evt.id == Event.MOUSE_DOWN) || (evt.id == Event.MOUSE_DRAG))
         {
         if ((evt.modifiers & Event.META_MASK) != 0)
            retval |= SELF_BUTTON3_MASK;
         else if ((evt.modifiers & Event.ALT_MASK) != 0)
            retval |= SELF_BUTTON2_MASK;
         else
            retval |= SELF_BUTTON1_MASK;            // No way to generate buttons 4 or 5
         }

/*
      if ((evt.modifiers & Event.CTRL_MASK) != 0)
         retval |= SELF_CONTROL_MASK;
      if ((evt.modifiers & Event.SHIFT_MASK) != 0)
         retval |= SELF_SHIFT_MASK;                 // No way to get logMask or mod[1-6]Mask
*/

      return (retval);
   }

   String getSelfEventType (Event evt, boolean doubleClick)
   {
      int selfState = getSelfState (evt);
      String whichButton;
      
      if ((evt.id == Event.MOUSE_MOVE) || (evt.id == Event.MOUSE_DRAG))
         return ("mouseMotion");

      if ((evt.modifiers & Event.SHIFT_MASK) != 0)      // Should be META_MASK to be normal
         whichButton = "right";
      else if ((evt.modifiers & Event.CTRL_MASK) != 0)  // Should be ALT_MASK to be normal
         whichButton = "middle";
      else
         whichButton = "left";

      if (doubleClick)
         return (whichButton + "DoubleClick");

      switch (evt.id)
         {
         case Event.MOUSE_DOWN:
            return (whichButton + "MouseDown");
         case Event.MOUSE_UP:
            return (whichButton + "MouseUp");

         case Event.KEY_PRESS:
         case Event.KEY_ACTION:
            return ("keyDown");
         case Event.KEY_RELEASE:
         case Event.KEY_ACTION_RELEASE:
            return ("keyUp");
         default:
            return ("ignore");
         }
   }

   long lastDownTime = 0;
   final static long DOUBLE_CLICK_TIME = 500;

   public boolean uiEvent (Event evt, int x, int y, int key)
   {
      if ((x < 0) || (y <0) ||
          (x > ownerBrowser.getViewSize ().width) ||
          (y > ownerBrowser.getViewSize ().height))
         return (false);

      if ((evt.id == Event.MOUSE_MOVE) || (evt.id == Event.MOUSE_DRAG))
         {
         if (myHandMorph != null)
            ((SelfMyHandMorph)myHandMorph).moveTo (ownerBrowser.getViewOrigin ().x + x, ownerBrowser.getViewOrigin ().y + y, this);
         }
 
      boolean doubleClick = false;
      if (evt.id == Event.MOUSE_DOWN) 
         {
         if ((evt.when - lastDownTime) < DOUBLE_CLICK_TIME)
            doubleClick = true;
         lastDownTime = evt.when;
         }
/*
      if (getSelfEventType (evt, doubleClick).equals ("middleMouseDown") && ((evt.modifiers & Event.ALT_MASK) != 0))
         {
         printCoreSample (x, y);
         return (true);
         }
*/
      try
         {
         if (caughtUpIndicator.getValue () || !getSelfEventType (evt, doubleClick).equals ("mouseMotion"))
            {
            synchronized (uplinkStream)
               {
               uplinkStream.writeBytes ("Event " + getSelfEventType (evt, doubleClick) + " " + 
                                        (int)(x + ownerBrowser.getViewOrigin ().x) + " " + 
                                        (int)(y + ownerBrowser.getViewOrigin ().y) + " " +
                                        getSelfState (evt) + " " + key + "\r\n"); 
               }

            System.out.println ("Event " + getSelfEventType (evt, doubleClick) + " " + 
                                     (int)(x + ownerBrowser.getViewOrigin ().x) + " " + 
                                     (int)(y + ownerBrowser.getViewOrigin ().y) + " " +
                                     getSelfState (evt) + " " + key + "   --- Thread priority: " + Thread.currentThread ().getPriority ());

//            System.out.println ("           ^^^^^                                            TS: " +
//                                 (System.currentTimeMillis () - app.startTimeMillis));

            if (getSelfEventType (evt, doubleClick).equals ("mouseMotion"))
               {
               caughtUpIndicator.setValue (false);
               }

            lastUnsentMouseMove = null;
            }
         else
            {
               // this message is being skipped
               lastUnsentMouseMove = evt;
            }
         }
      catch (IOException e)
         {
            System.out.println ("IOException on uplink (3), closing down");
            bailoutPoint.bailout ();
         }

      updateToolbarText ();
      return (true);
   }

   public Event lastUnsentMouseMove = null;


   void redrawRect (Rectangle r)
   {
//     netIdleIndicator.setValue (false);
      super.redrawRect (r);
   }
}

class CaughtUpIndicator extends IdleIndicator
{
   ViewerBrowserCore browser;

   CaughtUpIndicator (boolean initVal, ViewerBrowserCore browser)
   {
      super (initVal);
      this.browser = browser;
   }

   public void setBrowser (ViewerBrowserCore browser)
   {
      this.browser = browser;
   }

   public void setValue (boolean newVal)
   {
      super.setValue (newVal);
      if (browser == null)
         return;

      if ((value == true) && (browser.lastUnsentMouseMove != null))
         {
         browser.uiEvent (browser.lastUnsentMouseMove, 
                          browser.lastUnsentMouseMove.x,
                          browser.lastUnsentMouseMove.y, -1);
         }
   }
}

//----------------------------------------------------------------------------------
//----------------------------------------------------------------------------------

class SecondChanceItem extends Object
{
   public SecondChanceItem (SelfMorph o, SecondChanceItem n)
   {
      item = o;
      next = n;
   }
   public SelfMorph item;
   public SecondChanceItem next;
}

class SecondChanceList extends Object
{
   protected SecondChanceItem head;
   protected SecondChanceItem tail;
   int size;
   int numItems;

   //----------------------------------------------------------------
   // Create a second chance list to hold size items
   //----------------------------------------------------------------
   public SecondChanceList (int size)
   {
      head = null;
      tail = null;

      this.size = size;
      numItems = 0;
   }

   //----------------------------------------------------------------
   // Insert o at the back of the queue, and, if the queue is full,
   // remove the item from the front and return it for the application
   // to deal with.  Return null if the queue is not yet full
   //----------------------------------------------------------------
   public synchronized SelfMorph insertGetVictim (SelfMorph o)
   {
      SelfMorph retval = null;

      if (head == null)
         {
         head = new SecondChanceItem (o, null);
         tail = head;
         numItems = 1;
         }
      else
         {
         // Add the new item
         tail.next = new SecondChanceItem (o, null);
         tail = tail.next;

         // Either bump numItems or remove one to make it up
         if (numItems >= size)
            {
            retval = head.item;
            head = head.next;
//            System.out.println ("SecondChanceList.insertGetVictim - inserted and victimized - size is still: " + numItems);
            }
         else
            {
            ++numItems;
//            System.out.println ("SecondChanceList.insertGetVictim - did not victimize - size is now: " + numItems);
            }
         }
      return (retval);
   }

   //----------------------------------------------------------------
   // Search out o and remove it if found.  Return true if found,
   // false otherwise
   //----------------------------------------------------------------
   public synchronized boolean findAndRemove (SelfMorph o)
   {
      SecondChanceItem trailerItem = null;
      SecondChanceItem tempItem = head;
      while (tempItem != null)
         {
         if (tempItem.item == o)
            {
            if (trailerItem == null)
               {
               head = tempItem.next;     // Found the first item, special case
               if (head == null)         // Found the only item
                  tail = null;
               }
            else
               {
               trailerItem.next = tempItem.next;
               if (trailerItem.next == null)
                  tail = trailerItem;         // Found the last item
               }
//            System.out.println ("SecondChanceList.findAndRemove - found and removed - size is: " + numItems);
            --numItems;
            return (true);
            }
         tempItem = tempItem.next;
         }
//      System.out.println ("SecondChanceList.findAndRemove - did not find - size is still: " + numItems);
      return (false);
   }
}
