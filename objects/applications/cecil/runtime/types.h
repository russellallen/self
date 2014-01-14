/* Sun-$Revision: 9.1 $ */

#ifndef types_h
#define types_h

# include <stdio.h>
# include <stdlib.h>
# include <memory.h>

enum bool {false, true};

# define fatal(msg) 							      \
  (printf("Fatal error: %s\n", msg), fatalHandler(), exit(-1))

# ifdef ASSERT
#   define assert(b,msg) ((b) ? 0 : fatal(msg))
# else
#   define assert(b,msg) 0
# endif

class CecilTaggedPointerClass;
typedef CecilTaggedPointerClass* OOP;    // A tagged pointer
class OOPList;

class CecilBaseObject;
class CecilMemoryObject;
class CecilFloatObject;
class CecilCharObject;
class CecilStringObject;
class CecilImmutableStringObject;
class CecilMutableStringObject;
class CecilArrayObject;
class CecilClosureObject;

class CecilMap;
class FieldEntry;

class CecilMethod;
class CecilNormalMethod;

struct PredDecision;

enum MethodVisibility { PublicMethod, PrivateMethod };

class CecilEnv;

typedef CecilEnv* ReturnCode;
# define NORMAL_RETURN    NULL
typedef ReturnCode (*c_proc) (OOP*, OOPList&);
typedef ReturnCode (*ca_proc)(OOP*, int, OOPList&);

# endif
