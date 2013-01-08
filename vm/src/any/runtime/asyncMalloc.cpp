/* Sun-$Revision: 30.7 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation "asyncMalloc.hh"
# include "_asyncMalloc.cpp.incl"
  
AsyncAllocator::AsyncAllocator(int32 elemSize, int32 bufSize) {
  size = elemSize; capacity = n = bufSize;
  // the buffer has size 2*bufSize, but we try to keep it half-full
  buf = (char**)::selfs_malloc(sizeof(char*) * bufSize * 2);
  for (int32 i = 0; i < bufSize; i++) buf[i] = (char*)::selfs_malloc(size);
}

AsyncAllocator::~AsyncAllocator() {
  for (int32 i = 0; i < n; i++) ::selfs_free(buf[i]);
  ::selfs_free(buf);
}

char* AsyncAllocator::async_malloc_elem() {
  if (MallocInProgress) {
    if (WizardMode && (capacity >> 3) > n)
      warning("AsyncAllocator: buffer nearly empty");
    if (n == 0) fatal("AsyncAllocator: buffer empty");
    return buf[--n];
  } else {
    balanceBuffer(capacity + 1);
    return buf[--n];
  }     
}

void AsyncAllocator::async_free_elem(void* ptr) {
  balanceBuffer(capacity - 1);
  buf[n++] = (char*)ptr;
}

void AsyncAllocator::balanceBuffer(int32 howMany) {
  while (n < howMany) buf[n++] = (char*)::selfs_malloc(size);
  while (n > howMany) selfs_free(buf[--n]);
}
