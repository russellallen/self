#pragma once
/* Sun-$Revision: 30.9 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */
# include "stringOop.hh"



// The map table is used to canonicalize maps (i.e. all objects having the
// same structure have the same map, independently of how they arrived at
// the current structure.)

const int32 mapTableSize = 20011;

class mapTable : public CHeapObj {
protected:

  bool   maps_are_canonical_in_snapshot;
  nmln   buckets[mapTableSize];

  int32           hash(int32 length, VtblPtr_t vtbl_value, slotDesc* slot);
  nmln*           bucketFor(slotsMapDeps* m);
  void            add(slotsMapDeps* m);
  slotsMapDeps*   equivalent_map(slotsMapDeps* m);
  bool            verify_chain(nmln* head);
  void            print_bucket(int32 bucket_num);
  void            print_histogram();

  public:
  
  mapTable();

  bool get_maps_are_canonical() {return CanonicalizeMaps;};
  bool set_maps_are_canonical(bool f);
  bool get_maps_are_canonical_in_snapshot() {
           return maps_are_canonical_in_snapshot; }
  void set_maps_are_canonical_in_snapshot(bool f);

  slotsMapDeps*  canonical_map(slotsMapDeps* m);
  // to speed reading in snapshots, avoid probe
  void add_map_from_snapshot(slotsMapDeps* m);
  bool verify();
  bool verify_map(slotsMapDeps* m);
  bool contains(nmln* p) { // used by nmln for verification
    return (p >= buckets) && (p < (buckets + mapTableSize));
  }
};

