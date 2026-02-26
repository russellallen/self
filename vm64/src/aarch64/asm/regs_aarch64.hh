# if defined(__aarch64__)
/* Copyright 2024-2026 AUTHORS.
   See the LICENSE file for license information. */

/* Minimal register definitions for aarch64 (interpreter-only).
   The JIT compiler is not supported on aarch64, so we only provide
   the Location enum and constants needed by shared headers. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif

  enum Location {
    IllegalLocation = -1,

    StackLocations = 100,
    EndStackLocations = 9999,

    ReceiverReg     = 10000,
    ArgLocations    = 10001,
    EndArgLocations = 19999,

    IReceiverReg       = 20000,
    IArgLocations      = 20001,
    EndIArgLocations   = 29999,

    LReceiverReg       = 30000,
    LArgLocations      = 30001,
    EndLArgLocations   = 39999,

    UnAllocated = -2,
    ResultReg = 0,
  };

  const fint NumRegisters      = 0;
  const fint NumArgRegisters   = 0;
  const fint NumTempRegs       = 0;
  const fint NumCalleeSavedRegs = 0;

  // NonVol register range (empty on aarch64 — no JIT)
  const Location  LowestNonVolReg      = Location(0);
  const Location  HighestNonVolReg     = Location(-1);
  const Location  LowestLocalNonVolReg = Location(0);

  const RegisterString GloballyAllocatedMask = 0;
  const RegisterString AllTrashedMask        = 0;
  const RegisterString LocalMask             = 0;

  extern Location TempRegs[];
  extern fint     RegToTempNo[];
  extern Location CalleeSavedRegs[];

  inline bool  is_IArgLocation(Location r) { return  IArgLocations <= r  &&  r <   EndIArgLocations; }
  inline bool  is_LArgLocation(Location r) { return  LArgLocations <= r  &&  r <   EndLArgLocations; }
  inline bool   is_ArgLocation(Location r) { return   ArgLocations <= r  &&  r <    EndArgLocations; }
  inline bool is_StackLocation(Location r) { return StackLocations <= r  &&  r <  EndStackLocations; }

  inline bool isRegister(Location) { return false; }
  inline bool isStackRegister(Location r) { return is_StackLocation(r); }

  inline Location  IArgLocation(fint i)  {  return Location(  IArgLocations + i); }
  inline Location  LArgLocation(fint i)  {  return Location(  LArgLocations + i); }
  inline Location   ArgLocation(fint i)  {  return Location(   ArgLocations + i); }
  inline Location StackLocation_for_index(fint i)  {  return Location( StackLocations + i); }

  inline fint index_for_IArgLocation( Location x) { return x - IArgLocations; }
  inline fint index_for_LArgLocation( Location x) { return x - LArgLocations; }
  inline fint index_for_ArgLocation(  Location x) { return x - ArgLocations; }
  inline fint index_for_StackLocation(Location x) { return x - StackLocations; }

  inline bool isTempReg(Location) { return false; }
  inline bool isInitializedInFillValues(Location) { return false; }
  inline bool isArgRegister(Location) { return false; }

# endif // defined(__aarch64__)
