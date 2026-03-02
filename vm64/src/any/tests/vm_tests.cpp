/* Copyright 2024-2026 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation "vm_tests.hh"
# include "_vm_tests.cpp.incl"

VMTest* vm_tests_head = nullptr;
int vm_test_failures = 0;

static const int MaxTests = 256;

static int suite_cmp(const void* a, const void* b) {
  VMTest* ta = *(VMTest**)a;
  VMTest* tb = *(VMTest**)b;
  int c = strcmp(ta->suite, tb->suite);
  if (c != 0) return c;
  return strcmp(ta->name, tb->name);
}

int run_vm_tests() {
  VMTest* tests[MaxTests];
  int count = 0;
  for (VMTest* t = vm_tests_head; t && count < MaxTests; t = t->next)
    tests[count++] = t;

  qsort(tests, count, sizeof(VMTest*), suite_cmp);

  int passed = 0, failed = 0, suites = 0;
  const char* current_suite = nullptr;

  for (int i = 0; i < count; i++) {
    VMTest* t = tests[i];
    if (current_suite == nullptr || strcmp(current_suite, t->suite) != 0) {
      if (current_suite != nullptr) fprintf(stderr, "\n");
      fprintf(stderr, "[%s]\n", t->suite);
      current_suite = t->suite;
      suites++;
    }
    vm_test_failures = 0;
    fprintf(stderr, "  %s ... ", t->name);
    t->fn();
    if (vm_test_failures == 0) { fprintf(stderr, "PASS\n"); passed++; }
    else { fprintf(stderr, "FAILED (%d checks)\n", vm_test_failures); failed++; }
  }

  fprintf(stderr, "\n%d suites, %d passed, %d failed\n", suites, passed, failed);
  return failed > 0 ? 1 : 0;
}
