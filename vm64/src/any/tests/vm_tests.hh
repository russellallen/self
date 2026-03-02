/* Copyright 2024-2026 AUTHORS.
   See the LICENSE file for license information. */

/* Lightweight built-in test framework for VM unit tests.
   Tests are registered via __attribute__((constructor)) and run
   with --vm-run-tests after init_globals(). */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


struct VMTest {
  const char* suite;
  const char* name;
  void (*fn)();
  VMTest* next;
};

extern VMTest* vm_tests_head;
extern int vm_test_failures;

int run_vm_tests();

// Registration macro: defines a test function and auto-registers it.
# define VM_TEST(suite, name) \
  static void vmtest_##suite##_##name(); \
  static VMTest vmtest_entry_##suite##_##name = \
    {#suite, #name, vmtest_##suite##_##name, nullptr}; \
  __attribute__((constructor)) static void vmtest_reg_##suite##_##name() { \
    vmtest_entry_##suite##_##name.next = vm_tests_head; \
    vm_tests_head = &vmtest_entry_##suite##_##name; } \
  static void vmtest_##suite##_##name()

// Check macros
# define VM_CHECK(expr) do { \
  if (!(expr)) { \
    fprintf(stderr, "  FAIL: %s:%d: %s\n", __FILE__, __LINE__, #expr); \
    vm_test_failures++; \
  } \
} while(0)

# define VM_CHECK_EQ(a, b) do { \
  auto _a = (a); auto _b = (b); \
  if (_a != _b) { \
    fprintf(stderr, "  FAIL: %s:%d: %s != %s\n", __FILE__, __LINE__, #a, #b); \
    vm_test_failures++; \
  } \
} while(0)

# define VM_CHECK_NE(a, b) do { \
  auto _a = (a); auto _b = (b); \
  if (_a == _b) { \
    fprintf(stderr, "  FAIL: %s:%d: %s == %s\n", __FILE__, __LINE__, #a, #b); \
    vm_test_failures++; \
  } \
} while(0)
