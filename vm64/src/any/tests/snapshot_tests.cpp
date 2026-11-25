/* Copyright 2026 AUTHORS.
   See the LICENSE file for license information. */

# include "_snapshot_tests.cpp.incl"

// Tests for the version lines at the start of a snapshot header.

struct SnapshotHeaderResult {
  SnapshotVersionVerdict verdict;
  SnapshotVersionInfo    info;
  const char*            why;
  long                   next;   // the number on the following Timestamp line, or -1
};

static SnapshotHeaderResult read_header(const char* text) {
  SnapshotHeaderResult r;
  r.next = -1;
  r.why  = "";
  FILE* f = tmpfile();
  if (f == NULL) {
    fprintf(stderr, "  FAIL: could not make a temporary file\n");
    vm_test_failures++;
    r.verdict = snapshotRefused;
    return r;
  }
  fputs(text, f);
  rewind(f);
  r.verdict = read_snapshot_version(f, &r.info, &r.why);
  long t;
  if (fscanf(f, "Timestamp: %ld", &t) == 1)  r.next = t;
  fclose(f);
  return r;
}

static const char* new_header(int word_size, int format, const char* eol = "\n") {
  static char buf[256];
  snprintf(buf, sizeof(buf),
           "Version: 2026.1%sWord size: %d%sSnapshot format: %d%sTimestamp: 7%s",
           eol, word_size, eol, format, eol, eol);
  return buf;
}

VM_TEST(snapshot, old_header_format_13_loads) {
  SnapshotHeaderResult r = read_header("Version: 2023.1.13\nTimestamp: 5\n");
  VM_CHECK_EQ(r.verdict, snapshotLoads);
  VM_CHECK_EQ(r.info.major_version, 2023);
  VM_CHECK_EQ(r.info.minor_version, 1);
  VM_CHECK_EQ(r.info.word_size, 32);
  VM_CHECK_EQ(r.info.format, 13);
  VM_CHECK_EQ(r.next, 5L);
}

VM_TEST(snapshot, old_header_format_12_loads_with_warning) {
  SnapshotHeaderResult r = read_header("Version: 4.1.12\nTimestamp: 5\n");
  VM_CHECK_EQ(r.verdict, snapshotLoadsWithWarning);
  VM_CHECK_EQ(r.info.format, 12);
  VM_CHECK_EQ(r.next, 5L);
}

VM_TEST(snapshot, old_header_format_11_refused) {
  SnapshotHeaderResult r = read_header("Version: 4.1.11\nTimestamp: 5\n");
  VM_CHECK_EQ(r.verdict, snapshotRefused);
  VM_CHECK(r.why[0] != '\0');
}

VM_TEST(snapshot, old_header_cannot_claim_new_format) {
  SnapshotHeaderResult r = read_header("Version: 2026.1.14\nTimestamp: 5\n");
  VM_CHECK_EQ(r.verdict, snapshotRefused);
}

VM_TEST(snapshot, new_header_64_bit_loads) {
  SnapshotHeaderResult r = read_header(new_header(64, int(VM_snapshot_version)));
  VM_CHECK_EQ(r.verdict, snapshotLoads);
  VM_CHECK_EQ(r.info.major_version, 2026);
  VM_CHECK_EQ(r.info.minor_version, 1);
  VM_CHECK_EQ(r.info.word_size, 64);
  VM_CHECK_EQ(r.info.format, int(VM_snapshot_version));
  VM_CHECK_EQ(r.next, 7L);
}

VM_TEST(snapshot, development_version) {
  char text[128];
  snprintf(text, sizeof(text),
           "Version: 2026.2-dev\nWord size: 64\nSnapshot format: %d\nTimestamp: 7\n",
           int(VM_snapshot_version));
  SnapshotHeaderResult r = read_header(text);
  VM_CHECK_EQ(r.verdict, snapshotLoads);
  VM_CHECK_EQ(r.info.major_version, 2026);
  VM_CHECK_EQ(r.info.minor_version, 2);
  VM_CHECK(r.info.development);
  VM_CHECK_EQ(r.next, 7L);
  VM_CHECK(!read_header(new_header(64, int(VM_snapshot_version))).info.development);
}

VM_TEST(snapshot, new_header_carriage_returns) {
  SnapshotHeaderResult r = read_header(new_header(64, int(VM_snapshot_version), "\r"));
  VM_CHECK_EQ(r.verdict, snapshotLoads);
  VM_CHECK_EQ(r.next, 7L);
  r = read_header(new_header(64, int(VM_snapshot_version), "\r\n"));
  VM_CHECK_EQ(r.verdict, snapshotLoads);
  VM_CHECK_EQ(r.next, 7L);
}

VM_TEST(snapshot, new_header_64_bit_other_format_refused) {
  SnapshotHeaderResult r = read_header(new_header(64, int(VM_snapshot_version) + 1));
  VM_CHECK_EQ(r.verdict, snapshotRefused);
  r = read_header(new_header(64, int(VM_snapshot_version) - 1));
  VM_CHECK_EQ(r.verdict, snapshotRefused);
}

VM_TEST(snapshot, new_header_32_bit) {
  SnapshotHeaderResult r = read_header(new_header(32, 14));
  VM_CHECK_EQ(r.verdict, snapshotLoads);
  VM_CHECK_EQ(r.info.word_size, 32);
  VM_CHECK_EQ(r.info.format, 14);
  VM_CHECK_EQ(r.next, 7L);
  // formats up to 13 never had this header; 15 does not exist yet
  VM_CHECK_EQ(read_header(new_header(32, 13)).verdict, snapshotRefused);
  VM_CHECK_EQ(read_header(new_header(32, 15)).verdict, snapshotRefused);
}

VM_TEST(snapshot, odd_word_size_refused) {
  VM_CHECK_EQ(read_header(new_header(16, 1)).verdict, snapshotRefused);
  VM_CHECK_EQ(read_header(new_header(128, 1)).verdict, snapshotRefused);
}

VM_TEST(snapshot, development_snap64_refused_with_rebuild_message) {
  // what 64-bit VMs wrote before the word size line was added
  SnapshotHeaderResult r = read_header("Version: 64.0\nSnapshot format: 0\nTimestamp: 5\n");
  VM_CHECK_EQ(r.verdict, snapshotRefused);
  VM_CHECK(strstr(r.why, "rebuild") != NULL);
}

VM_TEST(snapshot, unparsable_refused) {
  VM_CHECK_EQ(read_header("").verdict, snapshotRefused);
  VM_CHECK_EQ(read_header("Timestamp: 5\n").verdict, snapshotRefused);
  VM_CHECK_EQ(read_header("Version: banana\n").verdict, snapshotRefused);
  VM_CHECK_EQ(read_header("Version: 2026.1\n").verdict, snapshotRefused);
  VM_CHECK_EQ(read_header("Version: 2026.1\nWord size: 64\n").verdict, snapshotRefused);
}
