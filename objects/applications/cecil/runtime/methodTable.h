/* Sun-$Revision: 9.1 $ */

# ifndef methodTable_h
# define methodTable_h

# pragma interface
  
  // The MethodTable is a hash table containing all methods. When you access 
  // the table with getMatchingSet, you get back all of the methods with the
  // same name and number of arguments.
  
  class TableElement {
   protected:
    CecilMethodArray* methods;
    TableElement* next;

   public:
    TableElement(CecilMethodArray* ms, TableElement* n = NULL) {
      methods = ms; next = n; }

    friend class MethodTable;
  };


# define TABLE_SIZE 211
  
  class MethodTable: public Printable {
   protected:
    TableElement* buckets[TABLE_SIZE];

    int hash(int selector, int argc) { return (selector + argc) % TABLE_SIZE; }
    
   public:
    MethodTable();
    
    CecilMethodArray* getMatchingSet(int selector, int argc);

    void add(CecilMethod* method);
    
    void print();
    void printShort();
  };
  
  // declare one global method table
  extern MethodTable theMethodTable;
  
# endif
