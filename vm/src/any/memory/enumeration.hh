/* Sun-$Revision: 30.10 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


const fint enumeration_list_capacity = 16;

// I hold enumerated oops in the resource area space-efficiently
class enumeration;

class enumeration_list: public ResourceObj {
 protected:
  oop  contents[enumeration_list_capacity];
  fint count;
  enumeration_list* next;
  enumeration* my_enumeration;
  
  void add_more(oop obj, enumeration_list*& head, fint& totalCount);
  
 public:
  enumeration_list(enumeration* e) {count = 0; next = NULL; my_enumeration = e; }
  
  void add(oop obj, enumeration_list*& head, fint& totalCount) {
    if (obj->is_objectMarked()) {
    }
    else if  (count < enumeration_list_capacity) {
      contents[count++] = obj; obj->markThisObject();
      ++totalCount;
    } else add_more(obj, head, totalCount);
  }
  void oops_do(oopsDoFn f);
};


class enumeration: public ResourceObj {
  
  friend void package_enumeration_result(oop* p);
  friend void package_enumeration_maps(oop* p);
  
  protected:
  oop*              targetp;
  smi               num_targets;
  smi               num_live_vframes;
  bool              has_assignments;
  unsigned long     limit;
  
  
  enumeration_list* objs;
  int32             obj_count;
  
  enumeration_list* maps;
  int32             map_count;
  
  oop*              maps_array;
  oop*              maps_p;
  
  oop*              resultp;
  
  enumeration(unsigned long lmt) {
    limit = lmt;
    
    error_code = 0;
    
    objs      = new enumeration_list(this);
    obj_count = 0;
    
    maps      = new enumeration_list(this);
    map_count = 0;
  }
  
  void          pack_result();
  void          pack_maps();
  
  public:
  markOop           error_code;
  objVectorOop      resultVector;
  
  void          set_error(markOop m);
  
  bool          is_ok() {return !error_code;}
  bool          stop()   {return !is_ok()  ||  obj_count >= limit;}
  
  virtual void  add_obj(oop obj)  {
    assert(slotsOop(obj) != Memory->errorObj,
           "shouldn't ever expose errorObj");
    if (!stop()) objs->add(obj, objs, obj_count);}
  
  void          add_map(Map* m) {
    if (!stop()) maps->add(m->enclosing_mapOop(), maps, map_count);}
  
  void          add_families(oop* bottom, oop* top);
  
  
  oop*          get_targets()             { return targetp;          }
  smi           get_num_targets()         { return num_targets;      }
  int           get_num_live_vframes()    { return num_live_vframes; }
  bool          targets_has_assignments() { return has_assignments;  }
  bool          is_target(oop t);
  
  oop*          get_maps()                { return maps_array;       }
  smi           get_num_maps()            { return map_count;        }
  
  virtual void  enumerate() = 0;
  virtual void  filter_match(oopsOop obj, oop* matching_cell, smi targetNo) = 0;
  virtual void  filter_map(mapOop obj) = 0;
};

class referencesEnumeration: public enumeration {
  
  referencesEnumeration(oop* targetp_arg,  
                        smi  num_targets_arg,
                        smi  num_live_vframes_arg,
                        bool has_assignments_arg,
                        smi  limit_arg)
    : enumeration(limit_arg) {
      
      targetp          = targetp_arg;
      num_targets      = num_live_vframes_arg + num_targets_arg; 
      num_live_vframes = num_live_vframes_arg;
      has_assignments  = has_assignments_arg;
    }
  
  void  enumerate();
  void  filter_match(oopsOop obj, oop* matching_cell, smi targetNo);
  void  filter_map(mapOop obj);
  
 protected:
  void consider_vframe(oopsOop obj, oop* matching_cell, smi targetNo);
  void consider_obj(   oopsOop obj, oop* matching_cell, smi targetNo);
 public:
  static oop enumerate_vector_references(objVectorOop vector, oop limit);

};


class implementorsEnumeration: public enumeration {  
  smi poss_assignments_index;

  implementorsEnumeration(oop* targetp_arg, smi num_targets_arg,
                          smi num_poss_ass, smi limit_arg)
    : enumeration(limit_arg) { 
      targetp= targetp_arg;
      num_targets= num_targets_arg; 
      poss_assignments_index= num_poss_ass;
    }
  
  void  enumerate();
  void  filter_match(oopsOop obj, oop* matching_cell, smi targetNo);
  void  filter_map(mapOop obj) { Unused(obj); ShouldNotCallThis(); }
 public:  
  static oop enumerate_vector_implementors(objVectorOop vector, oop limit);
};

class allObjEnumeration: public enumeration {
  
  allObjEnumeration(smi lim)
    : enumeration(lim) {
    }
  
  void  enumerate();
  void  filter_match(oopsOop obj, oop* matching_cell, smi targetNo) {
    Unused(obj); Unused(matching_cell); Unused(targetNo);
    ShouldNotCallThis(); }
  void  filter_map(mapOop obj) { Unused(obj); ShouldNotCallThis(); }

 public:
  static oop enumerate_all_objs(oop limit);
};
