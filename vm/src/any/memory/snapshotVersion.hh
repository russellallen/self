/* Copyright 2026 AUTHORS.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


// The version lines at the start of a snapshot, shared by the 32-bit and
// 64-bit VMs so that the two cannot drift apart.

// What the first lines of a snapshot say about the VM that saved it.
struct SnapshotVersionInfo {
  int major_version;
  int minor_version;
  int word_size;        // 32 or 64; 0 if no snapshot was read
  int format;
};

enum SnapshotVersionVerdict {
  snapshotLoads,
  snapshotLoadsWithWarning,   // an older format this VM still reads
  snapshotRefused
};

// Reads the version lines of a snapshot header and decides whether this VM
// can load the snapshot.  If not, *why says why not.
SnapshotVersionVerdict read_snapshot_version(FILE*                file,
                                             SnapshotVersionInfo* info,
                                             const char**         why);
