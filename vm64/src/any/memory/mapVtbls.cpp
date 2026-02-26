/* Sun-$Revision: 30.9 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation "mapVtbls.hh"
# include "_mapVtbls.cpp.incl"

vtbls* Vtbls;

# define INIT_VTBLS_TEMPLATE(m)                                               \
    m CONC(m,_map);                                                           \
    if (CONC(m,_map).vtblMapType() != MAP_TYPE_NAME(m))                       \
      fatal1("mapType %s has wrong vtblMapType()", STR(MAP_TYPE_NAME(m)));    \
    vtbl_values[MAP_TYPE_NAME(m)] = (VtblPtr_t) CONC(m,_map).vtbl_value();

vtbls::vtbls() {
  FOR_ALL_MAP_TYPES(INIT_VTBLS_TEMPLATE);
}

# define READ_SNAPSHOT_VTBLS_TEMPLATE(m)                                      \
    { smi snap_vtbl_size = (Memory->snapshot_oopSize == oopSize)              \
        ? (smi)sizeof(VtblPtr_t) : Memory->snapshot_oopSize;                 \
      old_vtbl_values[MAP_TYPE_NAME(m)] = 0; /* clear upper bytes */         \
      OS::FRead_swap(&old_vtbl_values[MAP_TYPE_NAME(m)], snap_vtbl_size, file); \
    }                                                                         \
    old_are_correct = old_are_correct &&                                      \
    (old_vtbl_values[MAP_TYPE_NAME(m)] == vtbl_values[MAP_TYPE_NAME(m)]);

void vtbls::read_snapshot(FILE* file) {
  old_are_correct = !Memory->is_snapshot_other_endian
                    && (Memory->snapshot_oopSize == oopSize);
  FOR_ALL_MAP_TYPES(READ_SNAPSHOT_VTBLS_TEMPLATE);
}

# define WRITE_SNAPSHOT_VTBLS_TEMPLATE(m)                                     \
    OS::FWrite(&vtbl_values[MAP_TYPE_NAME(m)], sizeof(VtblPtr_t), file);

void vtbls::write_snapshot(FILE* file) {
  FOR_ALL_MAP_TYPES(WRITE_SNAPSHOT_VTBLS_TEMPLATE);
}

# define TRANSLATE_VTBLS_TEMPLATE(m)                                          \
    if (old_vtbl_values[MAP_TYPE_NAME(m)] == old_vtbl_value)                  \
      return vtbl_values[MAP_TYPE_NAME(m)];

VtblPtr_t vtbls::translate(VtblPtr_t old_vtbl_value) {
  if (old_are_correct) return old_vtbl_value;
  FOR_ALL_MAP_TYPES(TRANSLATE_VTBLS_TEMPLATE);
  fatal("cannot find the old map type (please check APPLY_TO_VM_OOPS)");
  return 0;
}

# define FIND_VTBLS_TEMPLATE(m)                                               \
    if (vtbl_values[MAP_TYPE_NAME(m)] == value)                               \
      return true;

bool vtbls::contains(VtblPtr_t value) {
  FOR_ALL_MAP_TYPES(FIND_VTBLS_TEMPLATE);
  return false;
}

void mapVtbls_init() { Vtbls = new vtbls; }
