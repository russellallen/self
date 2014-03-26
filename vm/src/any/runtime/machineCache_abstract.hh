#pragma once
/* Sun-$Revision: 30.8 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */



// Handle "self-modifying" code on processors with separate I-caches.
// To minimize the performance penalty of the flushes, the VM always
// does a sequence of selective flushes followed by a flushICache().
// On the SPARC, the selective flushes are more efficient; on the 68K, the
// global flush.

// For processors with a small I-cache / without selective cache invalidation,
// define flushICache to flush the entire I-cache.  Otherwise, make it a no-op.

// For processors with selective cache invalidation, 
// define flushCacheWord and flushCacheRange
