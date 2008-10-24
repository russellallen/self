/* Sun-$Revision: 30.10 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif



class Token: public ResourceObj {
 public:

  enum TokenType {
    LAST_CHAR = 255,
    INTEGER, FLOAT, STRING, COMMENT,
    SELF_TOKEN, RESEND_TOKEN, 
    NAME, PRIMNAME, OPERATOR, PRIMKEYWORD, KEYWORD, CAPKEYWORD, ARG,
    DELEGATE, 
    ARROW, 
    ANNOTATION_START, ANNOTATION_END,
    ACCEPT, ERROR_TOKEN
  };  
  TokenType type;
  
  union {
    int32 integer;
    float floating;
    String* string;
  };
  fint line;
  fint column;
  char* sourceStart;
  
  Token(TokenType t, fint l, fint c, char* ss) {
    type = t; line = l; column = c; sourceStart = ss; }
  // wierd order to avoid overloading ambiguity
  Token(TokenType t, char* ss, int32 i, fint l, fint c) {
    type = t; integer = i; line = l; column = c; sourceStart = ss; }
  Token(TokenType t, float f, fint l, fint c, char* ss) {
    type = t; floating = f; line = l; column = c; sourceStart = ss; }
  Token(TokenType t, String* s, fint l, fint c, char* ss) {
    type = t; string = s; line = l; column = c; sourceStart = ss; }
  void print();
};

class TokenPushback: public ResourceObj {
 public:
  Token* token;
  TokenPushback* prev;
  
  TokenPushback(Token* t, TokenPushback* p) { token = t; prev = p; }
};

class CharPushback: public ResourceObj {
 public:
  fint c;
  CharPushback* prev;
  
  CharPushback(fint ch, CharPushback* p) { c = ch; prev = p; }
};

class SourceBuffer: public ResourceObj {
  
 protected:
  char *next, *last;
 public:
  int length;
  char *first;

  SourceBuffer(long len) {
    if (len < 0)
      fatal1("bad length %d for SourceBuffer", len);
    first = NEW_RESOURCE_ARRAY( char, len);
    if (!first)
      fatal1("new failed for length %d", len);
    next = first;
    last = first + len;
  }

  SourceBuffer(char *start, long len) {
    if (len < 0)
      fatal1("bad length %d for SourceBuffer", len);
    first= next= start;
    last= first + len;
  }

  SourceBuffer(FILE* source_file);
  // map the contents of the file into virtual memory.

  void nextPut(char c) {
    if (next >= last)
      fatal("source buffer overflow - file has changed while it was read");
    *next++ = c;
  }
  char* where() { return next; }
  fint  current_char() { return next < last ? *next : EOF; }
  void  advance() { next++; }
  void reset() { next = first; }
  void pop() {
    if (next == first)
      fatal("bad pop in source buffer");
    --next;
  }
  char* lastWhiteSpaceBefore(char* start);
};


class Scanner: public StackObj {
 protected:
  SourceBuffer* sourceBuf;
  
  fint          line;
  fint          column;
  fint          depth;

  TokenPushback* tokens;
  CharPushback* chars;
  
  bool suppress;
  
  Scanner();
  Scanner(long fsz);
  Scanner(FILE* source_file);

  void          initialize();

  virtual fint  read_next_char() = 0;
  virtual bool  is_buffer_filled() { SubclassResponsibility(); return false; }
  fint          get_char(); 
  
  Token*        read_numeric_escape(fint base, fint howMany, char& ch);
  Token*        read_char(char*& buf, bool& cannot_be_a_delimeter);
  Token*        read_escaped_char(char*& buf, bool& cannot_be_a_delimeter);
  
  Token*        skip_comment();
  
  Token*        read_name(fint c);
  Token*        read_op(fint c);
  Token*        read_number(fint c);
  Token*        read_string();
  Token*        read_general_string(char delimiter, Token::TokenType t);
  Token*        read_dot();
  
  void          initSourcePos();
  
  Token*        TokenizingError(char* msg);

 public:
  void          push_char(fint c);

  TokenList*    commentList;
  
  virtual char* fileName()                      = 0;
  virtual void  start_line(char* prompt) { Unused(prompt); }
  virtual void  reset()                         {};

  int get_line_number() { return line; }
  int get_column()      { return column; }

  virtual bool  is_interactive()                {return false;}
  virtual bool  is_string_scanner()             {return false;}
  virtual bool  is_file_scanner()               {return false;}
  
  void          SuppressErrors(bool b);

  bool          is_done();
  Scanner*      close();
  
  Token*        get_token();
  void          push_token(Token* t) { tokens = new TokenPushback(t, tokens); }
  char*         sourceAddr() { return sourceBuf->where(); }
  char*         lastWhiteSpaceBefore(char* start) { 
    return sourceBuf->lastWhiteSpaceBefore(start); }
  virtual void  discardInput() {
    SubclassResponsibility(); } // only applies to the interactive scanner
  virtual void ErrorMessage(char* msg, fint l, fint c);
  void          resetTokenList();

 private:
  unsigned int commentsOK;
 public:
  // as long as comment is in SOME (even outer) method it will be kept
  void start_allowing_comments() {++commentsOK;}
  void stop_allowing_comments()  {--commentsOK;}
};

class InteractiveScanner: public Scanner {
 protected:
  void  ErrorMessage(char* msg, fint l, fint c);
  fint  read_next_char();
  bool  is_buffer_filled() { return false; }
 public:
  InteractiveScanner();
  
  char* fileName()    { return "<stdin>"; }
  void  reset()       { depth = 0; initSourcePos(); }
  
  bool  is_interactive() { return true; }
  void  start_line(char* prompt);

  void  discardInput();
};

class FileScanner: public Scanner {
 protected:
  FILE* file;
  char* _fileName;
  char* _fullName;
  fint  read_next_char() {
    return sourceBuf->current_char();
  }
  FILE* openFileAndReturnFile(char* filename);
  bool  is_buffer_filled() { return true; }
 public:
  int32 fileError;

  FileScanner(char* filename);
  
  ~FileScanner();

  char* fileName()       { return _fileName; }
  char* fullName()       { return _fullName; }

  bool is_file_scanner() { return true;       }
};

class StringScanner : public Scanner {
 protected:
  char* _fileName;
  fint  read_next_char()   { return sourceBuf->current_char(); }
  bool  is_buffer_filled() { return true; }
 public:
  StringScanner(char* s, fint len, char* fn = "<a string>", fint l = 1, fint c = 1);
  char* fileName()         { return _fileName; }
  bool is_string_scanner() { return true;      }
};

extern InteractiveScanner *VMScanner;

extern unsigned char c_type[];

#define ctype (c_type+1)

enum Ctype {
  _O = 0,
  _U = 001,     // Upper case
  _L = 002,     // Lower case
  _N = 004,     // Numeral (digit)
  _S = 010,     // Spacing character
  _P = 020,     // Punctuation
  _A = 040,     // Alpha including underscore
  _X = 0200     // heXadecimal digit
  };

inline bool is_id_alpha(fint c)         // a-zA-Z_
  { return ctype[c] & _A; }
inline bool is_alpha(fint c)            // a-zA-Z
  { return ctype[c] & ( _L | _U ); }
inline bool is_upper(fint c)            // A-Z
  { return ctype[c] & _U; }
inline bool is_lower(fint c)            // a-z
  { return ctype[c] & _L; }
inline bool is_digit(fint c)            // 0-9
  { return ctype[c] & _N; }
inline bool is_space(fint c)            // \t\n\f\r' '
  { return ctype[c] & _S; }
inline bool is_punct(fint c)            // not " ' ( ) . : [ ] _ { }
  { return ctype[c] & _P; } 
inline bool is_alphadigit(fint c)       // a-zA-Z0-9
  { return ctype[c] & (_N | _L | _U); }
inline bool is_id_char(fint c)          // a-zA-Z0-9_
  { return ctype[c] & (_A | _N); }


