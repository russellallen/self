// # Sun-$Revision: 30.1 $
//
// Program used to test the Pep java system.
// May also be useful to test other java systems.
//
//                          Ole Agesen, June, 1996.


class syncTest {
  int x = 5;

  synchronized int syncMethod(int y) {
    x = x + y;
    return x;
  }

  synchronized int syncMethod2(int y) throws java.lang.ArithmeticException {
    x = x + y;
    if (x == 99)
      throw(new java.lang.ArithmeticException("fisk"));
    return x;
  }

  public static void main(String[] args) {
    syncTest sy = new syncTest();
    int xx = sy.syncMethod(4);
    xx = sy.syncMethod2(4);
  }
}

class StringAndInt implements Cloneable {
  String s;
  int    i;
  public java.lang.Object clone() { 
    try {
      return super.clone(); 
    } catch (java.lang.CloneNotSupportedException exc) {
      return null;
    }
  }
}

class superClass implements Cloneable {
  public int val = 1;
  public int getVal() { return val; }
  public String className() { return "superClass"; }

  public int bothVarAndMethod = 7;
  public int bothVarAndMethod()      { return 8; }
  public void bothVarAndMethod(int x) { bothVarAndMethod = x; }
}

class subClass extends superClass {
  public int val = 2;     // This field hides superclass' val field.
  public int subval = 4;
  public int getVal() { return val; }
  public String className() { return "subClass"; }
}

interface SideIntf {}
interface C2intf {}
interface C3intf extends C2intf, SideIntf {}

class C1 {
  int x1;
}

class C2 extends C1 implements C2intf {
  int x2;
}

class C3 extends C2 implements C3intf {
  int x3;
}


class PepTest {
  public int fisk;
  public boolean gotError = false;

  void helloWorld() {
    System.out.println("Hello, coffee world!");
  }

  String testDiv() {
    System.out.print("testDiv:    ");
    int a, b;
    long c, d;
    double e, f;
    a = b = 7;          if ( 1 != a / b) return "failed 1";
    a = -a;             if (-1 != a / b) return "failed 2";
    a = b = 600000000;  if ( 1 != a / b) return "failed 1.1";
    a = -a;             if (-1 != a / b) return "failed 2.1";
    c = d = 8L;         if ( 1 != c / d) return "failed 3";
    c = -c;             if (-1 != c / d) return "failed 4";
    c = d = 600000000L; if ( 1 != c / d) return "failed 3.1";
    c = -c;             if (-1 != c / d) return "failed 4.1";
    b = 0;
    try {
      a = a / b;
      return "failed 5";
    } catch (java.lang.Exception x) {
      // good.
    }
    d = 0;
    try {
      c = c / d;
      return "failed 6";
    } catch (java.lang.Exception x) {
      // good.
    }
    try {
      c = c % d;
      return "failed 6.1";
    } catch (java.lang.Exception x) {
      // good.
    }
    e = f = 7.0;
    if (1.0 != e / f) return "failed 7";
    e = -e;
    if (-1.0 != e / f) return "failed 8";
    f = 0.0;
    try {
      e = e / f;
    } catch (java.lang.Exception x) {
      return "failed 9";
    }
    try {
      e = e % f;    /* -infinity modulo 0.0 */ 
      e = 5.6 % f;  /* 5.6 module 0.0       */
    } catch (java.lang.Exception x) {
      return "failed 9";
    }
    return null;
  }

  String testIf() {
    System.out.print("testIf:     ");
    int a = 3, b, c;
    b = a;
    if(b * b == 9) 
      b = 1;
    else
      return "branched the wrong way";
    if (b != 1)
      return "didn't execute any of the branches";
    a = 0;
    b = 0;
    c = 0;
    if (a == 0)
      if (b == 0)
        c = 1;
      else
        c = 2;
    else
      if (b == 0)
        c = 3;
      else
        c = 4;
    if (c != 1)
      return "nested if failed in true/true case";
    a = 0;
    b = 1;
    c = 0;
        if (a == 0)
      if (b == 0)
        c = 1;
      else
        c = 2;
    else
      if (b == 0)
        c = 3;
      else
        c = 4;
    if (c != 2)
      return "nested if failed in true/false case";
    a = 1;
    b = 0;
    c = 0;
        if (a == 0)
      if (b == 0)
        c = 1;
      else
        c = 2;
    else
      if (b == 0)
        c = 3;
      else
        c = 4;
    if (c != 3)
      return "nested if failed in false/true case";
    a = 1;
    b = 1;
    c = 0;
        if (a == 0)
      if (b == 0)
        c = 1;
      else
        c = 2;
    else
      if (b == 0)
        c = 3;
      else
        c = 4;
    if (c != 4)
      return "nested if failed in false/false case";
    return null;
  }

  int shiftAnd(int v, int s) { return (v >>> s) & 0xFF; }

  String testBitOps() {
    /* Simple test of a few bit operations. By no means complete. */
    System.out.print("testBitOps: ");
    int v = 0xcafebabe;
    if (shiftAnd(v, 24) != 0xca) return "bad shift-and 1";
    if (shiftAnd(v, 16) != 0xfe) return "bad shift-and 2";
    if (shiftAnd(v,  8) != 0xba) return "bad shift-and 3";
    if (shiftAnd(v,  0) != 0xbe) return "bad shift-and 4";
    return null;
  }

  String testFor() {
    int s = 0;
    System.out.print("testFor:    ");
    for (int a = 0; a < 100; a++)
      for (int b = a; b >=0; b = b - 2)
        s = a + s + b;
    if (s != 252450)
      return "wrong check sum";
    return null;
  }

  String testTableSwitch() {
    System.out.print("testTableSwitch:  ");
    int s = 2, r;
    s = s * 3;
    switch(s) {
      case 0: 
      case 4: r = 0; break;
      case 1:
      case 2: r = 1; break;
      case 3:
      case 5:
      case 6: r = 3; break;
     default: r = -1;
    }
    if ( r != 3)
      return "took wrong case branch";
    s = s + 100;
    switch(s) {
      case 0: 
      case 4: r = 0; break;
      case 1:
      case 2: r = 1; break;
      case 3:
      case 5:
      case 6: r = 3; break;
     default: r = -1;
    }
    if ( r != -1)
      return "failed to take default branch";
    return null;
  }

  String testLookupSwitch() {
    System.out.print("testLookupSwitch: ");
    int s = 2, r;
    s = s * 3000;
    switch(s) {
      case 0: 
      case 4000: r = 0; break;
      case 1000:
      case 2000: r = 1; break;
      case 3000:
      case 5000:
      case 6000: r = 3; break;
     default: r = -1;
    }
    if ( r != 3)
      return "took wrong case branch";
    s = s + 999999999;
    switch(s) {
      case 0: 
      case 4000: r = 0; break;
      case 1000:
      case 2000: r = 1; break;
      case 3000:
      case 5000:
      case 6000: r = 3; break;
     default: r = -1;
    }
    if ( r != -1)
      return "failed to take default branch";
    return null;
  }

  String testHiddenField() {
    System.out.print("testHiddenField:  ");
    subClass f2 = new subClass();
    superClass f1 = f2;
    if (f1.val != 1) 
      return "direct access to field defined by superclass failed";
    if (f2.val != 2) 
      return "direct access to field defined by subclass failed";
    if (f1.getVal() != 2) 
      return "access through method to field defined by superclass failed";
    if (f2.getVal() != 2) 
      return "access through method to field defined by subclass failed";
    return null;
  }

  void printTime() {
    java.util.Date now = new java.util.Date();
    System.out.print("Time now is ");
    System.out.print(now.toString());
    System.out.print(",   ms: ");
    System.out.println(System.currentTimeMillis());
  }

  void printProperty(String prop) {
    System.out.println("  " + prop + " = " + System.getProperty(prop));
  }

  void printProperties() {
    System.out.println("Properties:");
    printProperty("java.version");
    printProperty("java.vendor");
    printProperty("java.vendor.url");
    printProperty("java.home");
    printProperty("java.class.version");
    printProperty("java.class.path");
    printProperty("os.name");
    printProperty("os.version");
    printProperty("os.arch");
    printProperty("file.separator");
    printProperty("path.separator");
    printProperty("line.separator");
    printProperty("user.name");
    printProperty("user.home");
    printProperty("user.dir");
  }

  String checkInst(superClass x, boolean r1, boolean r2, boolean r3, int c) {
    return checkInst2(x, r1, x instanceof superClass, "superClass") +
           checkInst2(x, r2, x instanceof subClass,   "subClass") + 
           checkInst2(x, r3, x instanceof Cloneable,  "Cloneable");
  }

  String checkInst2(superClass x, boolean expected, boolean got, String cn) {
    if (expected == got) return "";
    return "Failed: 'a " + x.getClass().getName() + "' instanceof " +
           cn + " (returned: " + got + ", should be: " + expected + ")\n";
  }

  String checkInstanceOf() {
    System.out.print("checkInstanceOf: ");

 /* subClass a[] = new subClass[2];
    ((superClass[])a)[1] = new superClass(); */

    if (!((new superClass[2]) instanceof superClass[]))
      return "failed: new superClass[2]) instanceof superClass[]";

    if (!((new subClass[2]) instanceof superClass[]))
      return "failed: new subClass[2]) instanceof superClass[]";

    if ((new superClass[2]) instanceof subClass[])
      return "failed: new superClass[2]) instanceof subClass[]";

    if ((new Object[2]) instanceof subClass[])
      return "failed: new Object[2]) instanceof subClass[]";

    if (!((new subClass[2]) instanceof Cloneable[]))
      return "failed: new subClass[2]) instanceof Cloneable[]";

    return checkInst(null,             false, false, false, 1) + 
           checkInst(new superClass(), true,  false, true,  2)  + 
           checkInst(new subClass(),   true,  true,  true,  3);
  }

  String checkInterfaceInstanceOf() {
    System.out.print("checkInterfaceInstanceOf: ");
    java.lang.Object c1 = new C1();
    java.lang.Object c2 = new C2();
    java.lang.Object c3 = new C3();
    if (!(c1 instanceof C1)) return "checkInterfaceInstanceOf: error-1";
    if ( (c1 instanceof C2)) return "checkInterfaceInstanceOf: error-2";
    if ( (c1 instanceof C3)) return "checkInterfaceInstanceOf: error-3";
    if (!(c2 instanceof C1)) return "checkInterfaceInstanceOf: error-4";
    if (!(c2 instanceof C2)) return "checkInterfaceInstanceOf: error-5";
    if ( (c2 instanceof C3)) return "checkInterfaceInstanceOf: error-6";
    if (!(c3 instanceof C1)) return "checkInterfaceInstanceOf: error-7";
    if (!(c3 instanceof C2)) return "checkInterfaceInstanceOf: error-8";
    if (!(c3 instanceof C3)) return "checkInterfaceInstanceOf: error-9";
    
    if ( (c1 instanceof C2intf))   return "checkInterfaceInstanceOf: error-10";
    if ( (c1 instanceof C3intf))   return "checkInterfaceInstanceOf: error-11";
    if ( (c1 instanceof SideIntf)) return "checkInterfaceInstanceOf: error-12";
    if (!(c2 instanceof C2intf))   return "checkInterfaceInstanceOf: error-13";
    if ( (c2 instanceof C3intf))   return "checkInterfaceInstanceOf: error-14";
    if ( (c2 instanceof SideIntf)) return "checkInterfaceInstanceOf: error-15";
    if (!(c3 instanceof C2intf))   return "checkInterfaceInstanceOf: error-16";
    if (!(c3 instanceof C3intf))   return "checkInterfaceInstanceOf: error-17";
    if (!(c3 instanceof SideIntf)) return "checkInterfaceInstanceOf: error-18";
    return null;
  }

  String testExc1() {
    System.out.print("testExc1(simple throw/catch):  ");
    int x = 0;
    try {
      if (x == 0) x = 1; else x = -1;
      if (x != 47) throw(new java.lang.ArithmeticException("fisk"));
      x = -1;
    } catch (java.lang.ArithmeticException exc) {
      if (x == 1) x = 2; else x = -1;
    }
    if (x == 2) 
      return null;
    else 
      return "failed";
  }

  String testExc2() {
    System.out.print("testExc2(skip catch clauses):  ");
    int x = 0;
    try {
      if (x == 0) x = 1; else x = -1;
      if (x != 47) throw(new java.lang.RuntimeException("fisk"));
      x = -1;
    } catch (java.lang.ArithmeticException exc) {
      x = -1;
    } catch (java.lang.AbstractMethodError exc) {
      x = -1;
    } catch (java.lang.RuntimeException exc) {
      if (x == 1) x = 2; else x = -1;
    }
    if (x == 2) 
      return null;
    else 
      return "failed";
  }

  String testExc3() {
    System.out.print("testExc3(catch in inner):      ");
    int x = 0;
    try {
      if (x == 0) x = 1; else x = -1;
      try {
        if (x != 1) x = -1; else x = 2;
        if (x != 47) 
          throw(new java.lang.ArithmeticException("fisk")); 
        else {
          return "failed-1";
        }
      } catch (java.lang.ArithmeticException exc) {
        if (x != 2) x = -1; else x = 3;
      }
    } catch (java.lang.ArithmeticException exc) {
      x = -1;
    }
    if (x == 3)
      return null;
    else
      return "failed-2";
  }

  String testExc4() {
    System.out.print("testExc4(catch in outer):      ");
    int x = 0;
    try {
      if (x == 0) x = 1; else x = -1;
      try {
        if (x != 1) x = -1; else x = 2;
        if (x != 47) throw(new java.lang.RuntimeException("fisk"));
      } catch (java.lang.ArithmeticException exc) {
        x = -1;
      }
    } catch (java.lang.RuntimeException exc) {
      if (x != 2) x = -1; else x = 3;
    }
    if (x == 3)
      return null;
    else
      return "failed";
  }

  String testExc5() {
    System.out.print("testExc5(rethrow):             ");
    int x = 0;
    try {
      if (x == 0) x = 1; else x = -1;
      try {
        if (x != 1) x = -1; else x = 2;
        if (x != 47) throw(new java.lang.ArithmeticException("fisk"));
      } catch (java.lang.ArithmeticException exc) {
        if (x != 2) x = -1; else x = 3;
        throw exc;
      }
    } catch (java.lang.ArithmeticException exc) {
      if (x != 3) x = -1; else x = 4;
    }
    if (x == 4)
      return null;
    else
      return "failed";
  }

  String testExc6() {
    System.out.print("testExc6(throw accross call):  ");
    int x = 0;
    try {
      x = 1;
      throwArithmeticException(1);
      x = 2;
    } catch (java.lang.ArithmeticException exc) {
      if (x != 1) x = -1; else x = 4;
    }
    if (x == 4)
      return null;
    else
      return "failed";
  }

  String testExc7() {
    System.out.print("testExc7(throw accr. 2 calls): ");
    int x = 0;
    try {
      x = 1;
      x = dontDouble(x);
      x = 2;
    } catch (java.lang.ArithmeticException exc) {
      if (x != 1) x = -1; else x = 4;
    }
    if (x == 4)
      return null;
    else
      return "failed";
  }

  String stringHash(String str, int expected) {
    if (str.hashCode() != expected) 
      return "unexpected string hash value for '" + str + "': " + 
             str.hashCode() + " (expected: " + expected + ")";
    return null;
  }
  

  String testStringHash() {
    System.out.print("testStringHash:  ");
    String res;
    if (null != (res = stringHash("monkey", -817689237)))  return res;
    if (null != (res = stringHash("donkey", -1441784850))) return res;
    if (null != (res = stringHash("Lavazza",  84343969)))  return res;
    if (null != (res = 
          stringHash("and a longer string with many words 123454876*=+-_%$$@",
                     47854477))) return res;
    return null;
  }


  String testObjectHash() {
    System.out.print("testObjectHash:  ");
    java.util.Hashtable ht = new java.util.Hashtable();
    Integer ii;
    for (int i = 0; i < 1000; i++) {
        ii = new Integer(new syncTest().hashCode());
        ht.put(ii, ii);
    }
    if (ht.size() < 700) {
        return "Hash codes not very unique; out of 1000 got only " +
               ht.size() + " unique";
    }
    return null;
  }

  String loopExitContinueInExceptionHandler() {
    System.out.print("loopExitContinueInExceptionHandler: ");
    int i = 0;
    while(i < 10000) {
      i++;
      try {
        if (i % 100 == 0) 
          throw(new java.lang.ArithmeticException("fisk"));
        if (i == 9990) 
          break;
        if (i % 2 == 0)
          continue;
      } catch (java.lang.ArithmeticException e) {
        if (i %2 != 0) 
          return "Should not throw odd exceptions!";
      }
    }
    if (i != 9990)
      return "Seems that break didn't work";
    return null;
  }

  String testClone() {
    System.out.print("testClone:       ");
    int[] w, v = new int[100];   /* Check that we can clone arrays. */
    for (int i = 0; i < v.length; i++) v[i] = i * i;
    w = (int[])v.clone();
    if (v.length != w.length) return "Clone of int array failed (length)";
    for (int i = 0; i < w.length; i++) 
        if (w[i] != i * i) return "Clone of int array failed-" + i;
    java.util.Hashtable ht = new java.util.Hashtable(31);
    if (ht.clone() == ht) return "Clone failed on hash tables";

    boolean caught = false;
    try {
      ht = null;
      ht.clone();
    } catch (java.lang.NullPointerException gotIt) {
      caught = true;
    }
    if (!caught) return "failed to catch exception from null.clone()";

    StringAndInt s1 = new StringAndInt();
    s1.s = "goat";
    s1.i = 5;
    StringAndInt s2 = (StringAndInt)s1.clone();
    if (s1 == s2)             return "clone returned same object";
    if (!s2.s.equals("goat")) return "clone didn't get the goat there";
    if (s2.i != 5)            return "clone didn't get the 5 there";
    if (!s1.s.equals("goat")) return "clone messed up receiver: goat";
    if (s1.i != 5)            return "clone messed up receiver: 5";
    return null;
  }

  String checkClassNameOf(String exp, Object obj, String expected) {
    if (expected.equals(obj.getClass().getName())) return null;
    return "Error: className(" + exp + ") = " + obj.getClass().getName() + 
           ", should be = " + expected;
  }

  void printInterfaces(java.lang.Class cl) {
    System.out.print(cl.getName() + ":  ");
    java.lang.Class intf[] = cl.getInterfaces();
    for (int i = 0; i < intf.length; i++) {
      System.out.print(intf[i].getName() + " ");
      if (!intf[i].isInterface())
        System.out.println("Error: should have been an interface!");
    }
    if (0 == intf.length) 
      System.out.print("no interfaces");
    System.out.println();
  }

  String testClass() {
    String r;
    r = checkClassNameOf("double[][]", new double[2][3], "[[D");
    if (r != null) return r;
    r = checkClassNameOf("7", new Integer(7), "java.lang.Integer");
    if (r != null) return r;
    r = checkClassNameOf("horse", this, "PepTest");
    if (r != null) return r;
    r = checkClassNameOf("new PepTest[2]", new PepTest[2], "[LPepTest;");
    if (r != null) return r;
    r = checkClassNameOf("new PepTest[2][2]", new PepTest[2][2], "[[LPepTest;");
    if (r != null) return r;
    r = checkClassNameOf("java.util.Hashtable", new java.util.Hashtable(),
                         "java.util.Hashtable");
    if (r != null) return r;

    PepTest fisk[] = new PepTest[2];
    if (fisk.getClass().getInterfaces().length != 0)
       return "Error: array class should not have interfaces";
    printInterfaces(fisk.getClass());
    int caught = 0;
    try {
      printInterfaces(null);
    } catch (NullPointerException fff) {
      caught = 1;
    }
    if (caught != 1)
      return "Error: null pointer exception not caught";
    Class cl = (new java.util.Hashtable()).getClass();
    while (cl != null) {
      printInterfaces(cl);
      cl = cl.getSuperclass();
    }
    return null;
  }

  String testWaitNull() {
    System.out.print("testWaitNull: ");
    try {
      ((java.lang.Object)null).wait(43);
    } catch (java.lang.Exception e) {
      if(e.getClass().getName().equals("java.lang.NullPointerException")) 
        return null;
      return "error: " + e;
    }
    return "error: missing exception";
  }

  String testVarAndMethodNameClash() {
    System.out.print("testVarAndMethodNameClash: ");
    superClass s = new superClass();
    int x;

    x = s.bothVarAndMethod;
    if (x != 7) 
      return "1: Var has wrong value: " + x;

    x = s.bothVarAndMethod();
    if (x != 8)
      return "1: Method returned wrong value: " + x;

    s.bothVarAndMethod = 9;
    x = s.bothVarAndMethod;
    if (x != 9) 
      return "2: Var has wrong value: " + x;

    x = s.bothVarAndMethod();
    if (x != 8)
      return "2: Method returned wrong value: " + x;

    s.bothVarAndMethod(5);
    x = s.bothVarAndMethod;
    if (x != 5)
      return "3: Var has wrong value: " + x;

    x = s.bothVarAndMethod();
    if (x != 8)
      return "3: Method returned wrong value: " + x;

    return null;
  }

  void timeExceptions() {
    System.out.print("Timing exception handling: ");
    long t1 = System.currentTimeMillis();
    for (int i = 0; i < 10000; i++) {
      try {
        int x = 4;
        x = x + x;
      } catch (java.lang.ClassCastException e) {
        System.out.println("Huh? Exception should not have occurred");
      }
    }
    long t2 = System.currentTimeMillis();
    System.out.println((t2 - t1) + " ms");
  }

  void checkAllNull(java.lang.Object a[]) {
    for (int i = 0; i < a.length; i++) {
      if (a[i] != null) System.out.println("error: should have been null");
    }
  }

  String testObjectArray() {
    System.out.print("testObjectArray: ");
    subClass   a[] = new   subClass[10];
    superClass b[] = new superClass[10];

    if (!(a instanceof subClass[]))         return "array instanceof-1 failed";
    if (!(a instanceof superClass[]))       return "array instanceof-2 failed";
    if (!(a instanceof java.lang.Object[])) return "array instanceof-3 failed";

    if ( (b instanceof subClass[]))         return "array instanceof-4 failed";
    if (!(b instanceof superClass[]))       return "array instanceof-5 failed";
    if (!(b instanceof java.lang.Object[])) return "array instanceof-6 failed";

    for (int i = 0; i < 10; i++) {
      a[i] = new   subClass();
      b[i] = new superClass();
    }
    b[4] = a[1];
    b[5] = null;
    a[2] = (subClass)b[4];
    a[2] = (subClass)b[5];
    try {
      a[2] = (subClass)b[7];
    } catch (java.lang.ClassCastException e) {
      if (!e.getMessage().equals("superClass"))
        return "unexpected exception: " + e;
    }
    java.lang.System.arraycopy(a,0,b,0,10);
    for (int i = 0; i < 10; i++)
      a[i] = null;
    java.lang.System.arraycopy(a,0,b,0,10);
    checkAllNull(b);
    java.lang.System.arraycopy(b,0,a,0,10);
    checkAllNull(a);
    checkAllNull(b);

    a[4] = new subClass();
    java.lang.System.arraycopy(b,0,a,0,10);
    checkAllNull(a);
    checkAllNull(b);

    boolean caught;

    caught = false;
    try {
      java.lang.System.arraycopy(null,0,a,0,10);
    } catch(java.lang.NullPointerException e) {
      caught = true;
    }
    if (!caught) return "error: should have caught exception-1";

    caught = false;
    try {
      java.lang.System.arraycopy(b,0,null,0,10);
    } catch(java.lang.NullPointerException e) {
      caught = true;
    }
    if (!caught) return "error: should have caught exception-2";

    caught = false;
    try {
      java.lang.System.arraycopy(b,0,a,0,11);
    } catch(java.lang.ArrayIndexOutOfBoundsException e) {
      caught = true;
    }
    if (!caught) return "error: should have caught exception-3";

    caught = false;
    try {
      java.lang.System.arraycopy(b,1,a,0,10);
    } catch(java.lang.ArrayIndexOutOfBoundsException e) {
      caught = true;
    }
    if (!caught) return "error: should have caught exception-4";

    caught = false;
    try {
      java.lang.System.arraycopy(b,-1,null,100,100);
    } catch(java.lang.NullPointerException e) {
      caught = true;
    }
    if (!caught) return "error: should have caught exception-5";

    b[5] = new superClass();
    caught = false;
    try {
      java.lang.System.arraycopy(b,0,a,0,10);
    } catch(java.lang.ArrayStoreException e) {
      caught = true;
    }
    if (!caught) return "error: should have caught exception-6";

    return null;
  }

  int dontDouble(int a) {
    throwArithmeticException(a);
    return 2 * a;
  }

  void throwArithmeticException(int a) {
    if (a == 1)
      throw(new java.lang.ArithmeticException("fisk"));
    if (a == 1)
      System.out.println("should not print this");
    else
      System.out.println("should print this");
  }

  int testDup() {
    int a, b;
    a = b = 7;
    return a;
  }

  int testForLoop(int x, int y) {
     int a = 0;
     for (int i=x; i < y; i++)
       a += i*i;
     return a;
  }


  static subClass staticSubArray[][] = {{null,null}, {null,null}};
  static int      staticIntArray[][] = {{1,2,3}, {4,5,6}};

  String testArray() {
    System.out.print("testArray:  ");
    int x[];
    x = new int[6];
    x[4] = 3;
    x[3] = x[4];
    if (x[3] != 3) return "got bad array value-";

    double y[][];
    y = new double[5][6];
    y[1][2] = 3.0;
    if (y[1][2] != 3.0) return "got bad array value-2";

    java.util.Stack fisk[][][] = new java.util.Stack[4][][];
    if (fisk[2] != null)
      return "bad array initialization";
    return null;
  }

  boolean isPrime(int i) {
    if (i == 2) 
      return true;
    if (i % 2 == 0) 
      return false;
    int j = 3;
    while (j * j <= i) {
      if (i % j == 0)
        return false;
      j = j + 2;
    }
    return true;
  }

  void printPrimes() {
    System.out.print("Primes less than 50: ");
    for (int i = 2; i < 50; i++) {
      if (isPrime(i)) {
        System.out.print(i);
        System.out.print(" ");
      }
    }
    System.out.println("");
  }

  public void Verify(String str) {
    if (null == str || str.equals(""))
      System.out.println("OK");
    else {
      gotError = true;
      System.out.println();
      System.out.println("******************************************");
      System.out.println("******************************************");
      System.out.println(str);
      System.out.println("******************************************");
      System.out.println("******************************************");
    }
  }

  boolean checkRemL(long a, long b, long res) {
    boolean ok = (res == a % b);
    if (!ok) {
      System.out.print("Failed: " + a + " % " + b + " = " + (a % b));
      System.out.println("   (should be: " + res);
    }
    return ok;
  }

  boolean checkRemD(double a, double b, double res) {
    boolean ok = (res == a % b);
    if (!ok) {
      System.out.print("Failed: " + a + " % " + b + " = " + (a % b));
      System.out.println("   (should be: " + res);
    }
    return ok;
  }


  void printRemD(double a, double b) {
    System.out.print(a + " % " + b + " = " + (a % b));
  }

  String checkRemainders() {
    System.out.print("checkRemainders: ");
    boolean ok = true;
    System.out.print(" long ");
    if (!checkRemL( 10L,  7L, 3L))  ok = false;
    if (!checkRemL( 10L, -7L, 3L))  ok = false;
    if (!checkRemL(-10L,  7L, -3L)) ok = false;
    if (!checkRemL(-10L, -7L, -3L)) ok = false;

    if (!checkRemD( 10.5,  7.0, 3.5))  ok = false;
    if (!checkRemD( 10.5, -7.0, 3.5))  ok = false;
    if (!checkRemD(-10.5,  7.0, -3.5)) ok = false;
    if (!checkRemD(-10.5, -7.0, -3.5)) ok = false;
    if (!ok) return "remainders failed";
    System.out.print("double ");
    return null; 
  }

  boolean checkClose(String exprStr, double v, double r) {
    double m, av = v, ar = r;
    if (av < 0.0) av = -av;
    if (ar < 0.0) ar = -ar;
    if (av > ar) 
      m = av; 
    else 
      m = ar;
    if (m == 0.0) m = 1.0;
    if ((v - r) / m > 0.0001) {
      System.out.println(exprStr + " evaluated to: " + v + ", expected: " + r);
      return false;
    }
    return true;
  }
    
  String checkMathFcts() {
    System.out.print("checkMathFcts: ");
    boolean ok = true; 
    if (!checkClose("log(0.7)",  Math.log(0.7),  -0.356675)) ok = false;
    if (!checkClose("sin(0.7)",  Math.sin(0.7),   0.644218)) ok = false;
    if (!checkClose("cos(0.7)",  Math.cos(0.7),   0.764842)) ok = false;
    if (!checkClose("tan(0.7)",  Math.tan(0.7),   0.842288)) ok = false;
    if (!checkClose("asin(0.7)", Math.asin(0.7),  0.775397)) ok = false;
    if (!checkClose("acos(0.7)", Math.acos(0.7),  0.795399)) ok = false;
    if (!checkClose("atan(0.7)", Math.atan(0.7),  0.610726)) ok = false;
    if (!ok) return "Some math function failed";
    return null;
  }

  void doIntWhileLoop() {
    int a = 0;
    while (a != 100000) {
      a++;
    }
  }

  void doLongWhileLoop() {
    long a = 0;
    while (a != 100000) {
      a++;
    }
  }

  void timeWhileLoops() {
    long t1, t2;
    System.out.print("Time for 100,000 iterations of " +
                     "while loop: int: ");
    t1 = System.currentTimeMillis();
    doIntWhileLoop();
    t2 = System.currentTimeMillis();
    System.out.print((t2 - t1) + " ms, long: ");

    t1 = System.currentTimeMillis();
    doLongWhileLoop();
    t2 = System.currentTimeMillis();
    System.out.println((t2 - t1) + " ms");
  }

  String fiskString() {
    return "fisk";
  }

  int deepRecursion(int n, int sum) {
    int s;
    if (n == 0) return sum;
    return deepRecursion(n - 1, n + sum);  /* Hopefully javac won't elim.
                                              tail recursion. */
  }
   
  String testDeepStack() {
    System.out.print("testDeepStack: ");
    if (deepRecursion(5555, 0) != (5555 * 5555 + 5555) / 2) return "failed";
    return null;
  }

  String testMisk() {
    System.out.print("testMisk: ");
    String right = "-9223372036854775808";
    if (!right.equals("" + ((long)1 << 63)))
      return "(long)1 << 63 failed, returned: " + ((long)1 << 63) +
             ", should be: " + right;
    if (-1L != (-1L & -1L))
      return "Logical and failed for longs";
    if (getClass().getName() == (new PepTest()).getClass().getName())
      return "Error(1): strings should not be identical!";
    String str1, str2;
    str1 = "fisk";
    str2 = "fisk";
    if (str1 != str2)
      return "Error(2): strings should be identical!";
    if (fiskString() != fiskString())
      return "Error(3): strings should be identical!";
    try {
      str1 = "java.lang.Thread";
      if (!str1.equals(java.lang.Class.forName(str1).getName())) 
        return "Error(4): strings should be equal!";
      if (str1 == java.lang.Class.forName(str1).getName()) 
        return "Error(5): strings should not be identical!";
    } catch(java.lang.Exception gotIt) {}
    return null;
  }

  String testGC() {
    System.out.print("testGC: ");
    byte[][] bytesArrays = new byte[1000][];
    bytesArrays[0] = new byte[1000];  /* See if GC eats this array! */
    Runtime.getRuntime().gc();
    if (!bytesArrays[0].getClass().getName().equals("[B"))
      return "GC swallowed a live object!";    /* Will fail here then. */
    String cn = getClass().getName(); /* Force construction of class object. */
    Runtime.getRuntime().gc();
    /* See if the GC spoled the class object. */
    if (!cn.equals(getClass().getName())) return "got different class name";
    java.lang.System.getProperty("file.encoding");  /* Fails if GC swallowed
                                                       props; it did happen! */
    return null;
  }

  void timeIO() {
    try {
      System.out.print("Timing IO. ");
      long t1, t2;
      byte b[] = {0};
      System.out.print("write(1 byte): ");
      t1 = System.currentTimeMillis();
      java.io.FileOutputStream out = new java.io.FileOutputStream("/dev/null");
      for (int i = 0; i < 10000; i++)
        out.write(b);
      out.close();
      t2 = System.currentTimeMillis();
      System.out.print("" + (t2 - t1) + " ms");

      System.out.print(", read(1 byte): ");
      t1 = System.currentTimeMillis();
      java.io.FileInputStream in = new java.io.FileInputStream("/etc/termcap");
      for (int i = 0; i < 10000; i++)
        in.read(b);
      in.close();
      t2 = System.currentTimeMillis();
      System.out.print("" + (t2 - t1) + " ms");
      System.out.println();
    } catch (java.io.IOException e) {}
  }

  void timeDateToString() {
    System.out.print("Timing java.util.Date::toString: ");
    long t1 = System.currentTimeMillis();
    java.util.Date now = new java.util.Date();
    for (int i = 0; i < 50; i++) {
      String s = now.toString();
    }
    long t2 = System.currentTimeMillis();
    System.out.println("" + (t2 - t1) + " ms");
  }

  public void instanceMain(String[] args) {
    // System.out.println(Math.random());  Fails -- our floats are too small.
    java.util.Random rnd = new java.util.Random();
    System.out.println(rnd.nextFloat());
    System.out.println(rnd.nextFloat());
    System.out.println(rnd.nextFloat());
    // Runtime.getRuntime().traceMethodCalls(true);
    helloWorld();
    printTime();
    printProperties();
    Verify(testIf());
    Verify(testArray());
    Verify(testBitOps());
    Verify(testFor());
    Verify(testDiv());   // breaks jit; comment out for jit's sake!
    Verify(testTableSwitch());
    Verify(testLookupSwitch());
    Verify(testHiddenField());
    Verify(checkRemainders());
    Verify(checkMathFcts());
    printPrimes();
    timeWhileLoops();
    Verify(testExc1());
    Verify(testExc2());
    Verify(testExc3());
    Verify(testExc4());
    Verify(testExc5());
    Verify(testExc6());
    Verify(testExc7());
    Verify(loopExitContinueInExceptionHandler());
    Verify(testStringHash());
    Verify(testObjectHash());
    Verify(testClone());
    Verify(testObjectArray());
    testClass();
    Verify(checkInstanceOf());
    Verify(checkInterfaceInstanceOf());
    Verify(testWaitNull());
    Verify(testVarAndMethodNameClash());
    Verify(testDeepStack());
    Verify(testMisk());
    Verify(testGC());
    timeExceptions();
    timeIO();
    timeDateToString();
    if (gotError)
      System.out.println("****** PepTest found an error ******");
    else
      System.out.println("****** PepTest completed successfully ******");
  }

  public static void main(String[] args) {
    PepTest horse = new PepTest();
    horse.instanceMain(args);
    if (horse.gotError) System.exit(1);
  }
}
