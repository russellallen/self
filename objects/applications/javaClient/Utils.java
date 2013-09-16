import java.awt.*;
import java.awt.image.*;
import java.applet.Applet;
import java.io.*;
import java.net.*;
import java.util.*;
//-------------------------------------------------------------------------
// Kansas Java interface -- bringing Kansas to the Web
//
//   Utils.java - lots o stuff
//
// $Revision: 30.1 $
//      Andy Collins, Sun Microsystems Laboratories, Summer 1996
//-------------------------------------------------------------------------


//------------------------------------------------------------------
//------------------------------------------------------------------
interface BailInOut 
{
   public void bailin ();     // Start all connections
   public void bailout ();    // Stop all connections and return 
                              // to start state
}

class InstrumentedInputStream extends InputStream
{
   InputStream is;
   int bytesRead;
   long startMillis;

   public InstrumentedInputStream (InputStream is)
   {
      this.is = is;
      bytesRead = 0;
      startMillis = System.currentTimeMillis ();
   }

   public int read () throws IOException
   {
      int charRead;

      ++bytesRead;
      if (bytesRead > 10240)
         {
         System.out.println ("InstrumentedInputStream: " + (bytesRead * 1000) / (System.currentTimeMillis () - startMillis)
                              + "bytes/sec");
         bytesRead = 0;
         startMillis = System.currentTimeMillis ();
         }

      charRead = is.read ();

      return (charRead);
   }
}

class StringImageBadSizeException extends Exception
{
   public StringImageBadSizeException ()
   { 
      super ();
   }
}

class StringImageException extends Exception
{
   public StringImageException ()
   { 
      super ();
   }
}

abstract class StringImageCreator
{
   public static Image createFrom (String colors, String pixels, int width, Component comp)
                                   throws StringImageBadSizeException, StringImageException
   {
      return (createFrom (colors, pixels, width, comp, true));
   }
   public static Image createFrom (String colors, String pixels, int width, Component comp, boolean useColors) 
                                   throws StringImageBadSizeException, StringImageException
   {
      int size = (pixels.length () / 2);
      int height = size / width;
      if ((size != (height * width)) || (size * 2 != pixels.length ()))
         {
         System.out.println ("bad width/data string");
         throw new StringImageBadSizeException ();
         }

      int numColors = (colors.length () / 8);
      if (numColors * 8 != colors.length ())
         {
         System.out.println ("bad color string");
         throw new StringImageBadSizeException ();
         }

      System.out.println ("Image data: " + width + "x" + height + ", " + numColors + " colors.");

      int pixelData[] = new int[size];
      for (int i = 0; i < size; ++i)
         {
         int colorOffset = Integer.parseInt (pixels.substring (i*2, i*2 + 2), 16);
         int rgb = Integer.parseInt (colors.substring (colorOffset*8+2, colorOffset*8 + 6), 16);
         if (useColors)
            pixelData[i] = rgb;
         else
            pixelData[i] = (rgb & 0x7f000000);   // knock off top alpha and all color, make a shadow
         }

      Image retval = comp.createImage (new MemoryImageSource (width, height, pixelData, 0, width));
      MediaTracker tracker = new MediaTracker (comp);
      tracker.addImage (retval, 1);
      try 
         {
         tracker.waitForID (1);
         }
      catch (InterruptedException e)
         {
         System.out.println ("interrupted");
         throw new StringImageException ();
         }

      return (retval);       
   }
}

abstract class FontManager 
{
   public static String resolveXFont (String xFont)
   {
      // This makes the rather simplistic assumption that:
      //    helvetica goes to Helvetica
      //    courier   goes to Courier
      //    symbol    goes to Symbol
      //    all else  goes to TimesRoman
      // Note that most of the other fonts are serif fonts that Java won't let me have.

      if (-1 != xFont.indexOf ("helvetica"))
         return ("Helvetica");
      if (-1 != xFont.indexOf ("courier"))
         return ("Courier");
      if (-1 != xFont.indexOf ("symbol"))
         return ("Symbol");

      return ("TimesRoman");
   }

   public static int extractStyle (String xFont)
   {
      int retval = Font.PLAIN;

      if (-1 != xFont.indexOf ("bold"))
         retval |= Font.BOLD;

      if (-1 != xFont.indexOf ("-i-"))
         retval |= Font.ITALIC;
      if (-1 != xFont.indexOf ("-o-"))
         retval |= Font.ITALIC;

      return (retval);
   }
}

//----------------------------------------------------------------------------------

class BailoutTimer extends Thread
{
   BailInOut app;
   long millis;

   BailoutTimer (BailInOut app, long millis)
   {
      this.app = app;
      this.millis = millis;
      start ();
   }

   public void run ()
   {
      try 
         {
         sleep (millis);
         System.out.println ("Timed out, closing down");
         app.bailout ();
         }
      catch (InterruptedException e)
         {
         }
   }
}
//----------------------------------------------------------------------------------
//----------------------------------------------------------------------------------
class SelfMissingStateException extends Exception
{
   String missingKey;
   public SelfMissingStateException ()
   {
      super ();
      missingKey = "<unknown>";
   }

   public SelfMissingStateException (String s)
   {
      super ();
      missingKey = new String (s);
   }
}

//----------------------------------------------------------------------------------
//----------------------------------------------------------------------------------
class SelfObjectState
{
   private Hashtable hash;

   public final static int TT_STRING = '\"';
   public final static int TT_NUMBER = -2;

   public SelfObjectState ()
   {
      hash = new Hashtable ();
   }

   public void clear ()
   {
      hash.clear ();
   }
  
   public Enumeration getKeys ()
   {
      return (hash.keys ());
   }

   public String getStringValueOrNull (String key)
   {
      return ((String) hash.get (key));
   }
   public String getStringValue (String key) throws SelfMissingStateException
   {
      String retval = getStringValueOrNull (key);
      if (retval == null)
         throw new SelfMissingStateException (key);
      return (retval);
   }

   public Double getNumberValueOrNull (String key)
   {
      String str = getStringValueOrNull (key);
      if (str == null)
         return (null);

      Double d;

      try
         {
         d = Double.valueOf (str);
         }
      catch (NumberFormatException e)
         {
         d = new Double (0.0);
         }

      return (d);
   }
   public double getNumberValue (String key) throws SelfMissingStateException
   {
      double d;

      try
         {
         d = Double.valueOf (getStringValue (key)).doubleValue ();
         }
      catch (NumberFormatException e)
         {
         d = 0.0;
         }

      return (d);
   }

   public void setValue (String key, String value)
   {
      if (key == null)
         System.out.println ("SelfObjectState.setValue: key is null, about to fail");
      if (value == null)
         System.out.println ("SelfObjectState.setValue: value is null, about to fail");
         
      hash.put (key, value);
   }

   public void setValue (String key, double value)
   {
      setValue (key, String.valueOf (value));
   }

   public void removeKey (String key)
   {
      hash.remove (key);
   }
}

//----------------------------------------------------------------------------------
//----------------------------------------------------------------------------------

class IdleIndicator extends Panel
{
   boolean value;
   long notIdleSinceMillis;

   IdleIndicator (boolean initVal)
   {
      value = initVal;
      if (value == false)
         notIdleSinceMillis = System.currentTimeMillis ();
      else
         notIdleSinceMillis = 0;
   }

   public void paint (Graphics g)
   {
      g.setColor (Color.black);
      g.fillRect (0, 0, size ().width, size ().height);

      if (value)
         g.setColor (Color.green.darker ());
      else
         g.setColor (Color.red.darker ());
      g.fillRect (1, 1, size ().width - 2, size ().height - 2);
   }

   public void setValue (boolean newVal)
   {
      if ((value == true) && (newVal == false))
         notIdleSinceMillis = System.currentTimeMillis ();
      else if ((value == false) && (newVal == true))
         notIdleSinceMillis = 0;

      value = newVal;
      repaint ();
   }

   public boolean getValue ()
   {
      return (value);
   }

   public long getNotIdleTimeMillis ()
   {
      if (value == false)
         return (System.currentTimeMillis () - notIdleSinceMillis);
      else
         return (0);
   }

   public boolean mouseDown (Event evt, int x, int y) 
   { 
      value = true;
      repaint ();
      return (true); 
   }
}


