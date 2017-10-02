#pragma once
/* Sun-$Revision: 30.8 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */
# include "top.hh"



enum MethodKind { OuterMethodType, BlockMethodType };

enum BaseLookupType {
  NormalBaseLookupType, ResendBaseLookupType, DirectedResendBaseLookupType,
  DelegatedBaseLookupType
  };

const int32 BaseLookupTypeMask =
  (NormalBaseLookupType | ResendBaseLookupType |
   DirectedResendBaseLookupType | DelegatedBaseLookupType);

const fint BaseLookupTypeSize = 3;
typedef int32 LookupTypeFlag;

const LookupTypeFlag LookupTypeBitsBase = BaseLookupTypeMask + 1;

const LookupTypeFlag SelectorStaticBit          = LookupTypeBitsBase << 0;
const LookupTypeFlag DelegateeStaticBit         = LookupTypeBitsBase << 1;
const LookupTypeFlag ReceiverStaticBit          = LookupTypeBitsBase << 2;
const LookupTypeFlag ImplicitSelfBit            = LookupTypeBitsBase << 3;

const LookupTypeFlag LastLookupTypeBit          = LookupTypeBitsBase << 3;
const fint LookupTypeSize                       = BaseLookupTypeSize + 4;

const int32 LookupTypeMask                      = (LastLookupTypeBit << 1) - 1;

// LookupType == BaseLookupType | {LookupTypeFlag}*
typedef int32 LookupType;

// shorthands for common cases

// sends know the value of the selector (and delegatee) but nothing else
// by default
const LookupType NormalLookupType = NormalBaseLookupType | SelectorStaticBit;
const LookupType StaticNormalLookupType =
  NormalBaseLookupType | SelectorStaticBit | ReceiverStaticBit;
const LookupType ImplicitSelfLookupType =
  NormalBaseLookupType | ImplicitSelfBit | SelectorStaticBit |
  ReceiverStaticBit;
const LookupType ResendLookupType =
  ResendBaseLookupType | SelectorStaticBit | ReceiverStaticBit;
const LookupType DirectedResendLookupType =
  DirectedResendBaseLookupType | SelectorStaticBit | ReceiverStaticBit |
  DelegateeStaticBit;

// performs don't know the value of the selector (by default)
const LookupType NormalPerformType = NormalBaseLookupType;
const LookupType ResendPerformType = ResendBaseLookupType;
const LookupType DelegatedPerformType = DelegatedBaseLookupType;

inline bool isPerformLookupType(LookupType t) {
  return (t & SelectorStaticBit) == 0;
}

inline BaseLookupType baseLookupType(LookupType lookupType) {
  return BaseLookupType(lookupType & BaseLookupTypeMask);
}

inline bool needsDelegatee(LookupType l) {
  BaseLookupType bl = baseLookupType(l);
  return (bl == DirectedResendBaseLookupType ||
          bl == DelegatedBaseLookupType);
}

inline bool isResendLookupType(LookupType l) {
  BaseLookupType bl = baseLookupType(l);
  return (bl == ResendBaseLookupType ||
          bl == DirectedResendBaseLookupType);
}

inline bool lookupReceiverIsSelf(LookupType l) {
  if (l & ImplicitSelfBit) return true;
  BaseLookupType bl = baseLookupType(l);
  return (bl == ResendBaseLookupType ||
          bl == DirectedResendBaseLookupType);
}

// in inline caches, the lookupType word may be augmented with extra bits
// used mainly by the SIC

enum CountType {
  NonCounting,          // no counting at all
  Counting,             // incrementing a counter
  Comparing             // increment & test for reaching limit (recompilation)
};

const fint CountTypeMask = NonCounting | Counting | Comparing;
const fint CountTypeSize = 2;
const fint CountSendBit  = LookupTypeSize + 1;

// the dirty bit records whether the inline cache has ever made a transition 
// from non-empty to empty (e.g. through flushing)
const fint DirtySendBit  = CountSendBit + CountTypeSize;
const fint DirtySendMask = 1 << DirtySendBit;

// the optimized bit says that if no callee nmethod exists, an optimized
// method should be created immediately rather than going through an
// unoptimized version first
const fint OptimizedSendBit  = DirtySendBit + 1;
const fint OptimizedSendMask = 1 << OptimizedSendBit;

// the uninlinable bit says that the SIC has decided it's not worth inlining this send
// no matter how often it is executed
const fint UninlinableSendBit  = OptimizedSendBit + 1;
const fint UninlinableSendMask = 1 << UninlinableSendBit;


inline LookupType withoutExtraBits(LookupType lookupType) {
  return lookupType & LookupTypeMask;
}

inline LookupType withCountBits(LookupType l, CountType t) {
  return LookupType((fint(l) & ~(CountTypeMask << CountSendBit))
                    | (t << CountSendBit));
}

inline CountType countType(LookupType l) {
  return CountType((fint(l) >> CountSendBit) & CountTypeMask);
}

extern "C" {
  void printLookupType(LookupType lookupType);
  char* lookupTypeName(LookupType lookupType);
}


// Do the lookup types match for the purposes of determining
// the entry point and return address?
inline bool lookupMatch(LookupType l1, LookupType l2) {
  return      needsDelegatee(l1) == needsDelegatee(l2)
    && (l1 & DelegateeStaticBit) == (l2 & DelegateeStaticBit)
    &&   isPerformLookupType(l1) == isPerformLookupType(l2);
}
