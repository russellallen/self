/* Copyright 2024-2026 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation "vm_tests.hh"
# include "_vm_tests.cpp.incl"

VMTest* vm_tests_head = nullptr;
int vm_test_failures = 0;

int run_vm_tests() {
  int passed = 0, failed = 0;
  for (VMTest* t = vm_tests_head; t; t = t->next) {
    vm_test_failures = 0;
    fprintf(stderr, "[test] %s::%s ... ", t->suite, t->name);
    t->fn();
    if (vm_test_failures == 0) { fprintf(stderr, "PASS\n"); passed++; }
    else { fprintf(stderr, "FAILED (%d checks)\n", vm_test_failures); failed++; }
  }
  fprintf(stderr, "\n%d passed, %d failed\n", passed, failed);
  return failed > 0 ? 1 : 0;
}
