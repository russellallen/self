/* Copyright 2026 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation "snapshotVersion.hh"
# include "_snapshotVersion.cpp.incl"


// Snapshot formats.  A snapshot's format number says how its contents are
// laid out; it is counted separately for 32-bit and 64-bit snapshots.
//
// 32-bit snapshots up to format 13 start with the old one-line header,
//     Version: 2023.1.13
// where the third number is the format.  Later ones, and all 64-bit
// snapshots, start with
//     Version: 2026.1
//     Word size: 64
//     Snapshot format: 1
static const int current_32bit_snapshot_format          = 14;
static const int last_old_header_32bit_snapshot_format  = 13;
static const int oldest_loadable_32bit_snapshot_format  = 12;


// Read one line of the header, without its line ending.  Blank lines after
// it are skipped.  Answers false at end of file.
static bool read_snapshot_header_line(FILE* file, char* buf, int len)
{
  int i = 0, c;
  while ((c = fgetc(file)) != EOF  &&  c != '\n'  &&  c != '\r')
    if (i < len - 1)  buf[i++] = char(c);
  buf[i] = '\0';
  if (c == EOF  &&  i == 0)
    return false;
  while ((c = fgetc(file)) == '\n'  ||  c == '\r')
    ;
  if (c != EOF)
    ungetc(c, file);
  return true;
}


SnapshotVersionVerdict read_snapshot_version(FILE*                file,
                                             SnapshotVersionInfo* info,
                                             const char**         why)
{
  char line[128];
  int  vm_word_size = int(oopSize) * 8;

  info->major_version = info->minor_version = 0;
  info->word_size     = 0;
  info->format        = -1;
  *why = "";

  if (!read_snapshot_header_line(file, line, sizeof(line))) {
    *why = "The \"Version:\" line in the snapshot is missing.";
    return snapshotRefused;
  }
  int n = sscanf(line, "Version: %d.%d.%d",
                 &info->major_version, &info->minor_version, &info->format);
  if (n == 3) {
    // old one-line header: a 32-bit snapshot
    info->word_size = 32;
    if (info->format > last_old_header_32bit_snapshot_format) {
      *why = "The \"Version:\" line in the snapshot is not one this VM understands.";
      return snapshotRefused;
    }
  }
  else if (n == 2) {
    if (!read_snapshot_header_line(file, line, sizeof(line))
    ||  sscanf(line, "Word size: %d", &info->word_size) != 1) {
      // 64-bit VMs before 2026.1 wrote "Version: 64.0" and no word size
      *why = strncmp(line, "Snapshot format:", 16) == 0
        ? "This snapshot was saved by a development version of the 64-bit VM\n"
          "\tand cannot be read by this one.  Please rebuild the world from source."
        : "The \"Word size:\" line in the snapshot could not be parsed.";
      return snapshotRefused;
    }
    if (!read_snapshot_header_line(file, line, sizeof(line))
    ||  sscanf(line, "Snapshot format: %d", &info->format) != 1) {
      *why = "The \"Snapshot format:\" line in the snapshot could not be parsed.";
      return snapshotRefused;
    }
  }
  else {
    *why = "The \"Version:\" line in the snapshot could not be parsed.";
    return snapshotRefused;
  }

  if (info->word_size != 32  &&  info->word_size != 64) {
    *why = "The snapshot's word size is neither 32 nor 64.";
    return snapshotRefused;
  }
  if (info->word_size > vm_word_size) {
    *why = "This is a 64-bit snapshot, and this is the 32-bit VM.\n"
           "\tPlease use the 64-bit VM.";
    return snapshotRefused;
  }

  if (info->word_size == 64) {
    if (info->format == VM_snapshot_version)
      return snapshotLoads;
    *why = "The format of this 64-bit snapshot is not the one this VM reads.";
    return snapshotRefused;
  }

  // a 32-bit snapshot
  if (n == 2  &&  info->format <= last_old_header_32bit_snapshot_format) {
    *why = "The snapshot's header does not match its format.";
    return snapshotRefused;
  }
  if (info->format < oldest_loadable_32bit_snapshot_format) {
    *why = "This snapshot was saved by a version of the VM that is too old.";
    return snapshotRefused;
  }
  if (info->format > current_32bit_snapshot_format) {
    *why = "This snapshot was saved by a newer version of the VM.";
    return snapshotRefused;
  }
  // Format 12 differs from 13 in what the world may expect of the VM;
  // 13 and 14 differ only in the header.
  return info->format == oldest_loadable_32bit_snapshot_format
           ? snapshotLoadsWithWarning
           : snapshotLoads;
}
