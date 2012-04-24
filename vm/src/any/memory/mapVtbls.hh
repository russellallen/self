/* Sun-$Revision: 30.9 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# pragma once

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


# define MAP_TYPE_NAME(m)  CONC(m,_type)

# define MAP_TYPES_ENUM_TEMPLATE(m)  MAP_TYPE_NAME(m),
  
enum VtblMapType {
  FOR_ALL_MAP_TYPES(MAP_TYPES_ENUM_TEMPLATE)
  last_map_type 
};

class vtbls {
 public:
  VtblPtr_t     vtbl_values[last_map_type];
  VtblPtr_t old_vtbl_values[last_map_type];
  bool old_are_correct;
  
  vtbls();
  void read_snapshot(FILE* file);
  void write_snapshot(FILE* file);
  VtblPtr_t translate(VtblPtr_t old_vtbl_value);
  bool  contains( VtblPtr_t old_vtbl_value);
};

extern vtbls* Vtbls;
