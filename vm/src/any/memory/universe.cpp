/* Sun-$Revision: 30.18 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation  "universe.hh"
# pragma implementation  "universe_inline.hh"

# include "_universe.cpp.incl"


// increment VM_snapshot_version whenever old snapshots will break; reset
// it to zero when changing the minor or major version
smi VM_major_version    = 2017;
smi VM_minor_version    = 1;
smi VM_snapshot_version = 13;


universe* Memory;

bool NeedScavenge     = false;
bool bootstrapping    = true;
bool postReadSnapshot = true;
char *WorldName       = NULL;
bool compressed_snapshot;
char decompression_filter[80];
bool page_aligned;

mapOop universe:: true_mapOop() { return  true_map()->enclosing_mapOop(); }
mapOop universe::false_mapOop() { return false_map()->enclosing_mapOop(); }


universe::universe() {
  // must set Memory here because other methods refer to it
  Memory= this;

  major_version= VM_major_version;
  minor_version= VM_minor_version;
  snapshot_version= VM_snapshot_version;
  is_snapshot_other_endian= false;

  default_sizes.set_from_defaults();
  scavengeCount= 0;
  Desired_Surv_Size= 400 * K;
  

  FILE *snap;
  if (WorldName) {
    snap= Files->openSnapshotFile(WorldName, "r");
    if (!snap) {
      fatalNoMenu1("Can't read initial world from %s!\n\n", WorldName);
    }
    read_snapshot_header(snap);
  } else
    current_sizes= default_sizes;

  current_sizes.cleanup();

  map_table= new mapTable;
  
  string_table = new stringTable;

  code= new zone(current_sizes.code_size,
                 current_sizes.pic_size,
                 current_sizes.deps_size,
                 current_sizes.debug_size);
  age_table = new ageTable;

  object_table = NULL;

  verify_opts= OS::strdup("nozprSvOmNMi");

  if (WorldName)
    read_snapshot(snap);
  else
    genesis();
}

// Create the world (should take less than 6 days)
void universe::genesis()
{
  ResourceMark rm;

  programming_timestamp = smiOop_zero;

  new_gen= new newGeneration(current_sizes.eden_size,
                             current_sizes.surv_size);

  old_gen= new oldGeneration(current_sizes.old_size, new_gen->capacity());

  assert(new_gen->high_boundary <= old_gen->low_boundary,
         "old space allocated lower than new space!");

  remembered_set = new rSet; // uses _boundary's
  
  // create map_map
  objectAnnotationObj = smiOop_zero; // so mapMap.annotation is a vaild oop
  map_map = mapMap::create_mapMap();
  
  // create annotation objects; works cause these have no slots
    slotAnnotationObj= create_slots((slotList*)NULL);
  objectAnnotationObj= create_slots((slotList*)NULL);

  // they have the wrong object annotation; fix it
  objectAnnotationObj =
    objectAnnotationObj->mirror_copy_set_annotation(objectAnnotationObj, true);
  slotAnnotationObj = 
    slotAnnotationObj->mirror_copy_set_annotation(objectAnnotationObj, true);
  
  // create lobby
  lobbyObj= create_slots((slotList*)NULL);
  
  // create initial strings, string canonicalization table, and vm string array
  slotsOop stringParent= create_slots((slotList*)NULL);
  create_initial_strings(stringParent);
  stringParent = (slotsOop)
    stringParent->copy_add_slot(VMString[PARENT],
                                parent_map_slotType, 
                                lobbyObj,
                                Memory->slotAnnotationObj,
                                true);

  assert(stringParent->is_slots(), "add_slot failed");

  // slot list for empty objects that are children of the root
  slotList* slots = new slotList(VMString[PARENT],
                                 parent_map_slotType,
                                 lobbyObj);
  
  // create vectors
   objVectorObj = create_objVector (create_slots(slots));
  byteVectorObj = create_byteVector(create_slots(slots));
  
  // create nil object
  nilObj = create_slots(slots);
  
  // create boolean objects
  trueObj = create_slots(slots);
  falseObj = create_slots(slots);
  
  // create maps
    smi_map  =   smiMap::create_smiMap  (create_slots(slots));
  float_map  = floatMap::create_floatMap(create_slots(slots));
   mark_map  =  markMap::create_markMap();
  
  // create block traits
  blockTraitsObj = create_slots(slots);

  // create literalsObj
  literalsObj = Memory->objVectorObj->clone();

  // create dead block (for initialization of memoized blocks)
  ByteCode db(true);
  db.GenLiteralByteCode(0, 0, new_string("internal error: memoized block"));
  db.GenSendByteCode(0, 0, new_string("error:"), true, false, NULL);
  bool ok = db.Finish("<internal>", " \"prototype dead block method (internal)\" ");
  assert(ok, "just checkin");
  slotsOop deadBlockMethod = create_blockMethod(NULL, &db);
  deadBlockObj = create_block(deadBlockMethod);

  // create vframe prototypes
  ByteCode b(true);
  b.GenSelfByteCode(0, 0);
  ok = b.Finish("<predefined>", " \"prototype method\" self ");
  assert(ok, "just checkin");
  slotsOop outerMethod = create_outerMethod(NULL, &b);
  slotsOop blockMethod = create_blockMethod(NULL, &b);
  outerActivationObj = create_vframeOop(outerMethod);
  blockActivationObj = create_vframeOop(blockMethod);
  
  // create process object
  processObj = create_process(0);

  // create profiler object
  profilerObj = profilerMap::create_profiler();

  // create proxy objects
     proxyObj  =    proxyMap::create_proxy();
  fctProxyObj  = fctProxyMap::create_fctProxy();
  
  // create assignment object
  assignmentObj = assignmentMap::create_assignment();

  // create dummy error object
  errorObj= create_slots(slots);

  // create mirror objects and associated objects
       assignmentMirrorObj = mirrorMap::create_mirror(assignmentObj);
            blockMirrorObj = mirrorMap::create_mirror(create_block(blockMethod));
       byteVectorMirrorObj = mirrorMap::create_mirror(byteVectorObj);
      outerMethodMirrorObj = mirrorMap::create_mirror(outerMethod);
      blockMethodMirrorObj = mirrorMap::create_mirror(blockMethod);
            floatMirrorObj = mirrorMap::create_mirror(as_floatOop(0.0));
        objVectorMirrorObj = mirrorMap::create_mirror(objVectorObj);
            slotsMirrorObj = mirrorMap::create_mirror();
              smiMirrorObj = mirrorMap::create_mirror(as_smiOop(0));
          processMirrorObj = mirrorMap::create_mirror(processObj);
  outerActivationMirrorObj = mirrorMap::create_mirror(outerActivationObj);
  blockActivationMirrorObj = mirrorMap::create_mirror(blockActivationObj);
           stringMirrorObj = mirrorMap::create_mirror(stringObj);
            proxyMirrorObj = mirrorMap::create_mirror(proxyObj);
         fctProxyMirrorObj = mirrorMap::create_mirror(fctProxyObj);
         profilerMirrorObj = mirrorMap::create_mirror(profilerObj);
           mirrorMirrorObj = mirrorMap::create_mirror(slotsMirrorObj);
  
  // create systemObjects
  slots = new slotList(new_string("nil"), map_slotType, nilObj);
  slots = slots->add(new_string("true"), map_slotType, trueObj);
  slots = slots->add(new_string("false"), map_slotType, falseObj);
  slots = slots->add(new_string("vector"), map_slotType, objVectorObj);
  slots = slots->add(new_string("byteVector"), map_slotType, byteVectorObj);
  slots = slots->add(new_string("proxy"), map_slotType, proxyObj);
  slots = slots->add(new_string("fctProxy"), map_slotType, fctProxyObj);
  slots = slots->add(new_string("methodActivationMirror"), 
                     map_slotType,
                     outerActivationMirrorObj);
  slots = slots->add(new_string("blockMethodActivationMirror"), 
                     map_slotType,
                     blockActivationMirrorObj);
  slots = slots->add(new_string("assignmentMirror"), 
                     map_slotType,
                     assignmentMirrorObj);
  slots = slots->add(new_string("blockMirror"), map_slotType, blockMirrorObj);
  slots = slots->add(new_string("byteVectorMirror"),
                     map_slotType,
                     byteVectorMirrorObj);
  slots = slots->add(new_string("methodMirror"),
                     map_slotType,
                     outerMethodMirrorObj);
  slots = slots->add(new_string("blockMethodMirror"),
                     map_slotType, blockMethodMirrorObj);
  slots = slots->add(new_string("floatMirror"), map_slotType, floatMirrorObj);
  slots = slots->add(new_string("vectorMirror"),
                     map_slotType,
                     objVectorMirrorObj);
  slots = slots->add(new_string("mirrorMirror"),
                     map_slotType,
                     mirrorMirrorObj);
  slots = slots->add(new_string("slotsMirror"), map_slotType, slotsMirrorObj);
  slots = slots->add(new_string("proxyMirror"), map_slotType, proxyMirrorObj);
  slots = slots->add(new_string("fctProxyMirror"), 
                     map_slotType,
                     fctProxyMirrorObj);
  slots = slots->add(new_string("smiMirror"), map_slotType, smiMirrorObj);
  slots = slots->add(new_string("stringMirror"),
                     map_slotType,
                     stringMirrorObj);
  slots = slots->add(new_string("processMirror"),
                     map_slotType,
                     processMirrorObj);
  slots = slots->add(new_string("profiler"), map_slotType, profilerObj);
  slots = slots->add(new_string("profilerMirror"),
                     map_slotType,
                     profilerMirrorObj);
  slots = slots->add(new_string("slotAnnotation"),
                     map_slotType,
                     slotAnnotationObj);
  slots = slots->add(new_string("objectAnnotation"),
                     map_slotType,
                     objectAnnotationObj);
  slotsOop systemObjects = create_slots(slots);
  
  slots = new slotList(new_string("postRead"), map_slotType, nilObj);
  slotsOop snapshotAction = create_slots(slots);

  // Create the shell object with parent slot lobbyObj.
  // This object should be used as the receiver object for the prompt.
  slots = new slotList(VMString[PARENT], parent_map_slotType, lobbyObj);
  slotsOop shellObj = create_slots(slots);

  // create object ID array for stack dumps etc
  objectIDArray= objVectorObj->cloneSize(NumObjectIDs);
  
  // add slots to lobby
  oop lob = lobbyObj;
  lob = lob->copy_add_slot(new_string("systemObjects"),
                           parent_map_slotType,
                           systemObjects, 
                           Memory->slotAnnotationObj,
                           true);
  lob = lob->copy_add_slot(new_string("snapshotAction"),
                           map_slotType,
                           snapshotAction,
                           Memory->slotAnnotationObj,
                           true);
  lob = lob->copy_add_slot(new_string("shell"),
                           map_slotType,
                           shellObj,
                           Memory->slotAnnotationObj,
                           true);
  lob = lob->copy_add_slot(new_string("help"),
                           map_slotType,
                           new_string("\n"
   "\tTo begin using Self, you must read in the world of Self objects.\n"
   "\tTo read in the world, type:\n\n"
   "\t\t'worldBuilder.self' _RunScript\n\n"
   "\tWhen this process is complete, you will be at the Self prompt.\n"
   "\tAt the Self prompt, you can start the user interface by typing:\n\n"
   "\t\tdesktop open\n\n\n"),
                           Memory->slotAnnotationObj,
                           true);

  lobbyObj->define(lob); // assigns to the lobbyObj global var

  tenuring_threshold = age_table_size;  // don't tenure anything at first
  
  postReadSnapshot= false;

  lprintf("Self Virtual Machine Version %d.%d/%d, %s\n", 
         major_version, minor_version, snapshot_version, vmDate);
  lprintf("Copyright 1989-2016 AUTHORS (type _Credits for credits)\n\n");
}


void universe::switch_pointers(oop from, oop to) {
  assert(from->is_mem() && to->is_mem(),
         "unexpected kind of pointer switching");
  assert(!from->is_old() || to->is_old(),
         "shouldn't be switching an old oop to a new oop");
  APPLY_TO_VM_OOPS(SWITCH_POINTERS_TEMPLATE);
  new_gen->switch_pointers(from, to);
  old_gen->switch_pointers(from, to);
  code->switch_pointers(from, to);
  hprofiler->switch_pointers(from, to);
  profilers->switch_pointers(from, to);
  processes->switch_pointers(from, to);
  string_table->switch_pointers(from, to);
  VMStrings_switch_pointers(from, to);
  slotIterator_switch_pointers(from, to);
  APPLY_TO_VM_MAPS(MAP_SWITCH_POINTERS_TEMPLATE);
}


#define SPACE_SIZE_READ_TEMPLATE(s)                             \
        if (fscanf(file, STR(s) ": %d\n", &(current_sizes.s)) != 1)   \
          fatal1("Snapshot format error: %s", STR(s));

// leave a space for a - between the $0 and $@
static const char SNAPSHOT_HEADER[] = "exec Self -s $0   $@\n";
#define HEADER_PREFIX_LEN 9

bool okToUseCodeFromSnapshot= true;
bool SnapshotCode;
bool noCodeWarnings= true;

void noCodeWarning(const char *msg)
{
  okToUseCodeFromSnapshot= false;
  if (noCodeWarnings) return;
  warning("Optimized code saved in this snapshot cannot be used,");
  lprintf("\t%s.\n", msg);
  lprintf("\tUntil more optimized code is automatically generated,\n"
          "\tthis snapshot will run more slowly than it did at the\n"
          "\ttime it was saved.\n");
}


void universe::read_first_line_in_snapshot_header(FILE *file)
{
  char header[sizeof(SNAPSHOT_HEADER)];
  // cannot use fgets anymore because \n and \r are switched on Mac
  // if (fgets(header, sizeof(header), file) == NULL)
  //  fatalNoMenu("Could not read snapshot file header");
  for (fint i = 0;  i  <  sizeof(header) - 1; ++i ) {
    if (fread(header + i, 1, 1, file) != 1)
      break;
    if ( header[i] == '\n' || header[i] == '\r' ) {
      header[i+1] = '\0';
      break;
    }
  }
  // Compare only the start so that the line can be edited to ignore 
  // command-line VM flags (ie exec Self -s $0 - $@) --miw
  if (strncmp(SNAPSHOT_HEADER, header, HEADER_PREFIX_LEN))
    fatalNoMenu2("Not a valid Self snapshot; header should be %s but was %s",
                 SNAPSHOT_HEADER, header);
}


void universe::read_versions_in_snapshot_header(FILE *file)
{
  // check versions
  smi read_major_version, read_minor_version;
  if (fscanf(file, "Version: %d.%d.%d%*[\r\n]",
             &read_major_version,
             &read_minor_version,
             &snapshot_version)    != 3 )
    fatalNoMenu("\n\tThe \"Version:\" line in the snapshot could not be parsed.\n");
      
  // return for snapshots whose version matches the current snapshot version
  if (snapshot_version == VM_snapshot_version)
    return;

  // Between snapshot versions 10 and 11, a new primitive was added: CompileWithSICNames.
  // To maintain compatibility, and since there's only a minor addition, we also read
  // snapshot whose version is 10. -mabdelmalek 11/02

  bool can_read_snapshot_with_mismatched_version =
        (snapshot_version == 10  &&  VM_snapshot_version == 11)
    || ((snapshot_version == 10 || snapshot_version == 11)  &&  VM_snapshot_version == 12)
    || ((snapshot_version == 12) && VM_snapshot_version == 13);
    
  if (can_read_snapshot_with_mismatched_version)
  	warning6("\n\tThis snapshot was saved using a different version\n"
                 "\tof the Self Virtual Machine (%d.%d.%d) and may behave unexpectedly\n"
                 "\tor not work correctly with this version (%d.%d.%d).\n", 
                 read_major_version,
                 read_minor_version,
                 snapshot_version,
                 VM_major_version,
                 VM_minor_version,
                 VM_snapshot_version);

  if (!can_read_snapshot_with_mismatched_version)
    fatalNoMenu6("\n\tThis snapshot was saved using a different version\n"
                 "\tof the Self Virtual Machine (%d.%d.%d) and will not\n"
                 "\twork with this version (%d.%d.%d).\n", 
                 read_major_version,
                 read_minor_version,
                 snapshot_version,
                 VM_major_version,
                 VM_minor_version,
                 VM_snapshot_version);

}


void universe::read_timestamp_in_snapshot_header(FILE *file)
{
  if (fscanf(file, "Timestamp: %d%*[\r\n]", (int*)&programming_timestamp) != 1)
    fatal("Error in snapshot format (timestamp)");
}


void universe::read_snapshot_code_flag_in_snapshot_header(FILE *file)
{
  char c;
  if ((fscanf(file, "Snapshot code: %c%*[\r\n]", &c) != 1)
   || (c != 'y' && c != 'n'))
    fatal("Error in snapshot format (snapshot code)");
  SnapshotCode= c == 'y';

#   if defined(FAST_COMPILER) || defined(SIC_COMPILER)
  if (!SnapshotCode && !noCodeWarnings)
    warning("This snapshot does not contain any object code;\n"
            "it will run more slowly at first while code is generated.");
  okToUseCodeFromSnapshot= okToUseCodeFromSnapshot && SnapshotCode;
#   else
  if (SnapshotCode)
    fatal("Sorry, but this version of Self cannot read snapshots with code");
  okToUseCodeFromSnapshot= false;
#   endif
}


void universe::read_vm_date_in_snapshot_header(FILE *file)
{
  // check for newer VM than that used with snapshot
  char vm_date[128];
  if (fscanf(file, "VM date: %128[^\n\r] ", vm_date) != 1)
    fatal("could not find the VM date in snapshot file--\n"
          "invalid snapshot file format");

  if (okToUseCodeFromSnapshot && strcmp(vm_date, vmDate) != 0) {
    noCodeWarning("because the VM used to write the snapshot is not the same as this one");
    if (!noCodeWarnings)
      warning2("\n\tThis VM:\t\t\t%s,\n\tVM used to make snapshot:\t%s",
               vmDate, vm_date);
  }
}


void universe::read_compression_flag_in_snapshot_header(FILE *file)
{
  char c;
  if ((fscanf(file, "Compressed: %c%*[\r\n]", &c) != 1)
   || (c != 'y' && c != 'n'))
    fatal("Error in snapshot format (compression)");
  compressed_snapshot= c == 'y';
  if (compressed_snapshot) {
    if ((fscanf(file, "Compression filter: %*s%*[\r\n]") != 0)
     || (fscanf(file, "Decompression filter: %80s%*[\r\n]", decompression_filter) != 1))
      fatal("Error in snapshot format (compression filters)");
  }
}


void universe::read_page_aligned_flag_in_snapshot_header(FILE *file)
{
  char c;
  if ((fscanf(file, "Page aligned: %c%*[\r\n]", &c) != 1)
   || (c != 'y' && c != 'n'))
    fatal("Error in snapshot format (page alignment)");
  page_aligned= c == 'y';
}


void universe::read_snapshot_header(FILE *file)
{
  ResourceMark rm;

  read_first_line_in_snapshot_header(file);
  read_versions_in_snapshot_header(file);
  read_timestamp_in_snapshot_header(file);
  read_snapshot_code_flag_in_snapshot_header(file);
  read_vm_date_in_snapshot_header(file);

  APPLY_TO_SPACE_SIZES(SPACE_SIZE_READ_TEMPLATE);

  read_compression_flag_in_snapshot_header(file);
  read_page_aligned_flag_in_snapshot_header(file);

  while (fgetc(file) != '\f' && !feof(file))
    ;
  fgetc(file);

  if (feof(file))
    fatalNoMenu("Truncated snapshot");
}



// in the compressed version, delimit the parts of the snapshots with
// these strings as a check on the compression/decompression
static char    misc_data_delim[] = "\n\f\nMisc data\n\f\n!%n";
static char      new_gen_delim[] = "\n\f\nNew generation\n\f\n!%n";
static char      old_gen_delim[] = "\n\f\nOld generation\n\f\n!%n";
static char string_table_delim[] = "\n\f\nString table\n\f\n!%n";
static char   VM_strings_delim[] = "\n\f\nVM strings\n\f\n!%n";
static char        vtbls_delim[] = "\n\f\nvtbls\n\f\n!%n";
static char         code_delim[] = "\n\f\nCode\n\f\n!%n";
static char    processes_delim[] = "\n\f\nProcesses\n\f\n!%n";
static char          end_delim[] = "\n\f\nEnd of snapshot\n\f\n!%n";


void check_delim(FILE *file, char *expected) {
  if (!page_aligned) {
    int nChars= -1;
    if (fscanf(file, expected, &nChars) != 0
        || nChars != strlen(expected) - 2)
      fatal3("Snapshot is corrupt near: %.*s, file position: 0x%x", 
             strlen(expected) - 8,
             expected+3,
             ftell(file));
  }
}


static bool check_endianness_of_vm_oops() {
  # define check_endianness_template(o) \
    if ((*o)->is_mem())  ++as_is_mem; \
    else if (*o != NULL) ++as_is_not_mem; \
    x = (oop)*o; \
    swap_bytes((int32*)&x); \
    if (x->is_mem())    ++swapped_is_mem; \
    else if (x != NULL) ++swapped_is_not_mem; 
    
  oop x;
  fint  as_is_mem = 0, as_is_not_mem = 0, swapped_is_mem = 0, swapped_is_not_mem = 0;
  APPLY_TO_VM_OOPS(check_endianness_template);
  
  if ( as_is_not_mem == 0  &&  swapped_is_not_mem != 0)  return false;
  if ( as_is_not_mem != 0  &&  swapped_is_not_mem == 0)  return true;
  if ( as_is_not_mem == 0  &&  swapped_is_not_mem == 0)  {
    warning("cannot tell for sure about byte-order; guessing OK");
    return false;
  }
  fatal("neither byte-ordering seems to work");
  return false;
}


// read snapshot from an open file and close it
void universe::read_snapshot(FILE* file) {
  ResourceMark rm;

  if (compressed_snapshot)
    file= OS::start_decompressing_snapshot(file, decompression_filter);

  check_delim(file, misc_data_delim);

  { unsigned char canChar;
    OS::FRead(&canChar, sizeof(canChar), file);
    bool canonicalized= canChar != '\0';
    map_table->set_maps_are_canonical_in_snapshot(canonicalized);
  }

  long start_of_oops = ftell(file);
  
  APPLY_TO_VM_OOPS(READ_SNAPSHOT_TEMPLATE);
  is_snapshot_other_endian = check_endianness_of_vm_oops();
  if (is_snapshot_other_endian) {
    fseek(file, start_of_oops, SEEK_SET);
    APPLY_TO_VM_OOPS(READ_SNAPSHOT_TEMPLATE);
  }
    
  READ_SNAPSHOT_TEMPLATE(&tenuring_threshold);

  APPLY_TO_VM_MAPS(MAP_READ_SNAPSHOT_TEMPLATE);
  
  check_delim(file, new_gen_delim);
  new_gen= new newGeneration(current_sizes.eden_size,
                             current_sizes.surv_size,
                             file);
  check_delim(file, old_gen_delim);
  old_gen= new oldGeneration(file, current_sizes.old_size, new_gen->capacity());

  remembered_set= new rSet; // uses generation boundaries

  check_delim(file, string_table_delim);
  string_table->read_snapshot(file);

  check_delim(file, VM_strings_delim);
  VMStrings_read_snapshot(file);
  
  check_delim(file, vtbls_delim);
  Vtbls->read_snapshot(file);
  
  bool need_to_relocate= false;
  bool need_to_relocate_objs= false;
  APPLY_TO_SPACES(SPACE_NEED_TO_RELOCATE_TEMPLATE);
  
  if (need_to_relocate) {
    APPLY_TO_VM_OOPS(RELOCATE_TEMPLATE);
    APPLY_TO_VM_MAPS(MAP_RELOCATE_TEMPLATE);
    APPLY_TO_SPACES(SPACE_RELOCATE_TEMPLATE);
    string_table->relocate();
    VMStrings_relocate();
    
    // cannot read in code if need to move other addresses around
    // (e.g. nmlns in code pointing to memory spaces)
    if (okToUseCodeFromSnapshot && need_to_relocate_objs)
      noCodeWarning(old_gen->nSpaces > 1
                    ? "because the snapshot contains a segmented heap"
                    : "because relocation is required");
  }
  
  old_gen->record_new_pointers();

  check_delim(file, code_delim);
  
  code->read_snapshot(file);

  APPLY_TO_SPACES(SPACE_FIXUP_MAPS_TEMPLATE);
  APPLY_TO_SPACES(SPACE_FIXUP_KILLABLES_TEMPLATE);
  
  if (okToUseCodeFromSnapshot) code->fixup();
  
  check_delim(file, processes_delim);
  processes->read_snapshot(file);
  
  if (need_to_relocate) {
    APPLY_TO_SPACES(SPACE_RELOCATE_BYTES_TEMPLATE);
  }
  old_gen->coalesce_spaces();
  
  NeedScavenge = false;
  
  check_delim(file, end_delim);
  fclose(file);
    
  if (compressed_snapshot) {
    OS::end_decompressing_snapshot();
  }

  // must canonicalize each object's map 
  // Since garbage maps can exist that would be redundant with canonicalized
  // maps, we cannot just add every map to the map table.
  // Instead, an extra pass is needed (sigh) to find every map actually used
  // in an object. Given the extra pass, we might as well recanonicalize them
  // instead of just adding them in.
  // (If we could guarantee a GC before every writeSnapshot, this would not be
  // necessary).
  // must gc to eliminate all redundant, uncanonical maps to restore
  // canonicalization invariants

  if (CanonicalizeMaps) {
    // add these first to ensure that they are the canonical ones
    APPLY_TO_VM_MAPS(MAP_CANONICALIZATION_TEMPLATE);
    APPLY_TO_SPACES(SPACE_CANONICALIZE_MAPS_TEMPLATE);
  }

  CurrentObjectID = 0;
}


void write_delim(FILE *file, char *delim)
{
  if (!page_aligned) {
    char buf[80];
    strcpy(buf, delim);
    buf[strlen(delim)-2]= '\0'; // chop off %n
    fputs(buf, file);
  }
}

memOop universe::relocate(memOop p) {
  APPLY_TO_SPACES(SPACE_OOP_RELOCATE_TEMPLATE);
  ShouldNotReachHere(); // oop not in any old space
  return NULL;
}

#define WRITE_SPACE_SIZES_TEMPLATE(s) \
        fprintf(snapFile, STR(s) ": %d\n", snap_sizes->s);

// these are used during write_snapshot
static FILE *snapFile;
static SignalBlocker* sb;
static void *SFH;

void universe::snapshot_failed() {
  perror("Error while writing snapshot");
  OS::snapshot_failed(snapFile, compressed_snapshot, sb);
  unix_failure(SFH, errno);
  fatal("no recovery; sorry");
}

bool universe::write_snapshot(const char *fileName,
                              const char *compression_f,
                              const char *decompression_f,
                              spaceSizes *snap_sizes) {

  compressed_snapshot= compression_f && decompression_f;

  const char *fullFileName;
  snapFile= Files->openSnapshotFile(fileName, "w", &fullFileName);
  if (snapFile == NULL) return NULL;

  if (!snap_sizes) snap_sizes= &current_sizes;

  OS::FWrite(SNAPSHOT_HEADER, strlen(SNAPSHOT_HEADER), snapFile);

  fprintf(snapFile, "Version: %d.%d.%d\n",
          VM_major_version, VM_minor_version, VM_snapshot_version);
          
  fprintf(snapFile, "Timestamp: %d\n", (int)programming_timestamp);

  fprintf(snapFile, "Snapshot code: %c\n", SnapshotCode ? 'y' : 'n');

  fprintf(snapFile, "VM date: %s\n", vmDate);

  old_gen->set_write_only_old0();

  APPLY_TO_SPACE_SIZES(WRITE_SPACE_SIZES_TEMPLATE);

  fprintf(snapFile, "Compressed: %c\n", compressed_snapshot ? 'y' : 'n');
  if (compressed_snapshot) {
    fprintf(snapFile,   "Compression filter: %s\n",   compression_f);
    fprintf(snapFile, "Decompression filter: %s\n", decompression_f);
  }

# if TARGET_OS_VERSION == MACOSX_VERSION
  // Linux???
  // On OSX, when space::write_snapshot tries to write starting earlier than
  // bytes_bottom, since OSX page = 4096 is smaller than idealized_page_size = 65536,
  // it can try to write an unallocated address and the write fails. -- dmu 9/1
  page_aligned= false;
# else
  page_aligned= !compressed_snapshot && old_gen->write_only_old0;
# endif
  fprintf(snapFile, "Page aligned: %c\n", page_aligned ? 'y' : 'n');

  fprintf(snapFile, "The rest of this file is binary data.\n\f\n");

  if (compressed_snapshot) {
    fclose(snapFile);
    snapFile = OS::start_compressing_snapshot(compression_f, fullFileName, sb);
    if (snapFile == NULL) {
      delete sb;
      return false;
    }
  }

  write_delim(snapFile, misc_data_delim);

  { bool8 c = map_table->get_maps_are_canonical();
    OS::FWrite(&c, sizeof(c), snapFile);
  }
  
  APPLY_TO_VM_OOPS(WRITE_SNAPSHOT_TEMPLATE);
  WRITE_SNAPSHOT_TEMPLATE(&tenuring_threshold);
  APPLY_TO_VM_MAPS(MAP_WRITE_SNAPSHOT_TEMPLATE);
  
  OS::set_sequential_access_before_writing_snapshot();

  write_delim(snapFile, new_gen_delim);
  new_gen->write_snapshot(snapFile);

  write_delim(snapFile, old_gen_delim);
  old_gen->write_snapshot(snapFile);

  write_delim(snapFile, string_table_delim);
  string_table->write_snapshot(snapFile);

  write_delim(snapFile, VM_strings_delim);
  VMStrings_write_snapshot(snapFile);
  
  write_delim(snapFile, vtbls_delim);
  Vtbls->write_snapshot(snapFile);

  write_delim(snapFile, code_delim);
  code->write_snapshot(snapFile);

  write_delim(snapFile, processes_delim);
  processes->write_snapshot(snapFile); 

  OS::set_normal_access_after_writing_snapshot();

  write_delim(snapFile, end_delim);

  if (compressed_snapshot ? OS::end_compressing_snapshot(snapFile) : fclose(snapFile))
    return false;
    
  if (!OS::setup_snapshot_to_run(fullFileName))
    warning("could not make Snapshot runnable");

  if (compressed_snapshot) delete sb;

  return true;
}

// Get the value of the slotName from the map.
// Return true if the slot is not present, or has a positive integer value,
// otherwise return false.
static bool get_space_size(slotsOop obj, const char *slotName, smi &val)
{
  bool junk;
  oop *slotp= obj->get_slot_data_address_if_present(slotName, junk);
  if (slotp == NULL) return true;
  if (! (*slotp)->is_smi()) return false;
  val= smiOop(*slotp)->value();
  return val > 0;
}

#define GET_SPACE_SIZE_FROM_OBJ_TEMPLATE(s)                             \
        if (!get_space_size(sizeObj, STR(s), snap_sizes.s)) {           \
          failure(FH, "Invalid space size");                            \
          return 0; }


oop full_write_snapshot_prim(oop rcvrIgnored, byteVectorOop name,
                             slotsOop c_obj, slotsOop sizeObj,
                             bool snapCode, void *FH) {
  Unused(rcvrIgnored);
  ResourceMark rm;

  SnapshotCode= snapCode;

  // set defaults from running system
  spaceSizes snap_sizes= Memory->current_sizes;

  { APPLY_TO_SPACE_SIZES(GET_SPACE_SIZE_FROM_OBJ_TEMPLATE);

    const char *s= Memory->check_sizes_for_snapshot(snap_sizes);
    if (s) {
      failure(FH, s);
      return 0;
    }
  }
  char *comp_f= NULL, *decomp_f= NULL;
  { bool junk;
    oop *  compress_slotp=
      c_obj->get_slot_data_address_if_present(  "compression_filter", junk);
    oop *decompress_slotp=
      c_obj->get_slot_data_address_if_present("decompression_filter", junk);
    if ((compress_slotp == NULL) != (decompress_slotp == NULL)) {
      // either both or neither...
      failure(FH, "Must have both or neither of compression_filter and decompression_filter");
      return 0;
    }
    if (compress_slotp && decompress_slotp) {
      if (   !(*  compress_slotp)->is_byteVector()
          || !(*decompress_slotp)->is_byteVector()) {
        failure(FH, "(De)compression filters must be specified by byte vectors");
        return 0;
      }
        comp_f= byteVectorOop(*  compress_slotp)->copy_null_terminated();
      decomp_f= byteVectorOop(*decompress_slotp)->copy_null_terminated();
    }
  }

  char* fn= name->copy_null_terminated();
  SFH= FH;

  if (!Memory->write_snapshot(fn, comp_f, decomp_f, &snap_sizes)) {
    unix_failure(FH, errno);
    return NULL;
  }
  return name;
}

bool universe::verify_oop(memOop p, bool expectErrorObj) {
  if (!expectErrorObj && p == errorObj)
    error("refce to errorObj");
  APPLY_TO_SPACES(SPACE_VERIFY_OOP_TEMPLATE);
  error1("memOop 0x%lx not in any space", p);
  return false;
}

byteVectorOop universe::verifyOpts(char *newOpts) {
  byteVectorOop oldOpts= new_string(verify_opts);
  delete [] verify_opts;
  verify_opts= newOpts;
  return oldOpts;
}

bool universe::verify(bool postScavenge) {
  ResourceMark rm;
  initNmlnCache(); 
  bool r = true; 
  lprintf("verifying ");
  if (is_verify_opt('n') || is_verify_opt('e') || is_verify_opt('s')) {
    lprintf("newgen: ");
    r &= new_gen->verify();
  }
  if (is_verify_opt('o')) {
    lprintf("oldgen: ");
    r &= old_gen->verify(); 
  }
  if (is_verify_opt('z')) {
    lprintf("z "); 
    r &= code->verify(); 
  }
  if (is_verify_opt('p')) {
    lprintf("p ");
    r &= processes->verify();
    r &= hprofiler->verify();
    r &= profilers->verify(); 
  }
  if (is_verify_opt('r')) {
    lprintf("r ");  
    r &= remembered_set->verify(postScavenge); }
  if (is_verify_opt('S')) {
    lprintf("S "); 
    r &= string_table->verify(); }
  if (is_verify_opt('v')) {
    lprintf("v "); 
    VMStrings_verify(r); }
  if (is_verify_opt('O')) {
    lprintf("O "); 
    bool verify_result = true;
    APPLY_TO_VM_OOPS(VERIFY_TEMPLATE_EXPECT_ERROR_OBJ); 
    r &= verify_result; }
  if (is_verify_opt('m')) {
    lprintf("m "); 
    bool verify_result = true;
    APPLY_TO_VM_MAPS(MAP_VERIFY_TEMPLATE); 
    r &= verify_result; }
  if (is_verify_opt('N')) {
    lprintf("N "); 
    r &= new_gen->verify_new_maps(); }
  if (is_verify_opt('M')) {
    lprintf("M "); 
    r &= map_table->verify(); }
  if (is_verify_opt('i')) {
    lprintf("i "); 
    r &= slotIterator_verify(); }
    if (CheckAssertions) {
     lprintf("h "); 
     r &= malloc_verify();
    }
  resetNmlnCache();
  lprintf(" done\n");
  return r;
}

#define PRINT_OBJ_TEMPLATE(obj)              \
  lprintf(#obj ": "); printObjectID(obj);    \
  lprintf("\n"); printIndent();

#define PRINT_MAP_TEMPLATE(map)              \
  lprintf(#map ": 0x%lx\n", map->enclosing_mapOop()); \
  printIndent();



void universe::print() {
  printIndent();
  lprintf("Memory:\n");
  Indent++;
  new_gen->print();
  old_gen->print();
  code->print();
  if (WizardMode) {
    printIndent();
#   ifdef VERY_VERBOSE_UNIVERSE_PRINT   // I don't like this  -- Urs
      PRINT_OBJ_TEMPLATE(lobbyObj);
      PRINT_OBJ_TEMPLATE(nilObj);
      PRINT_OBJ_TEMPLATE(trueObj);
      PRINT_OBJ_TEMPLATE(falseObj);
      PRINT_OBJ_TEMPLATE(stringObj);
      PRINT_OBJ_TEMPLATE(byteCodeObj);
      PRINT_OBJ_TEMPLATE(objVectorObj);
      PRINT_OBJ_TEMPLATE(byteVectorObj);
      PRINT_OBJ_TEMPLATE(blockTraitsObj);
      PRINT_OBJ_TEMPLATE(assignmentMirrorObj);
      PRINT_OBJ_TEMPLATE(blockMirrorObj);
      PRINT_OBJ_TEMPLATE(byteCodeMirrorObj);
      PRINT_OBJ_TEMPLATE(byteVectorMirrorObj);
      PRINT_OBJ_TEMPLATE(floatMirrorObj);
      PRINT_OBJ_TEMPLATE(objVectorMirrorObj);
      PRINT_OBJ_TEMPLATE(slotsMirrorObj);
      PRINT_OBJ_TEMPLATE(smiMirrorObj);
      PRINT_OBJ_TEMPLATE(stringMirrorObj);
      PRINT_OBJ_TEMPLATE(proxyMirrorObj);
      PRINT_OBJ_TEMPLATE(fctProxyMirrorObj);
      PRINT_OBJ_TEMPLATE(mirrorMirrorObj);

      PRINT_MAP_TEMPLATE(smi_map);
      PRINT_MAP_TEMPLATE(float_map);
      PRINT_MAP_TEMPLATE(mark_map);
      PRINT_MAP_TEMPLATE(map_map);
#   endif
    printIndent();
    printIndent();
    lprintf("tenuring_threshold: %ld\n", tenuring_threshold);
  }
  Indent--;
}


void universe::increment_programming_timestamp() {
  programming_timestamp =
    programming_timestamp == smiOop_max
    ? smiOop_zero
    : programming_timestamp->increment();
}


void universe_init() {
  new universe;         // no assignment needed
  Memory->canonize_map_vtbls();

  if (CheckAssertions) {
    // check FOR_ALL macros
    // iterate through Memory object (don't rely on FOR_ALL_VM_OOPS)
    oop* start = (oop*)&Memory->lobbyObj;
    oop* end   = (oop*)&Memory->smi_map;

#   define FIND_OOP_TEMPLATE(ptr)  if (p == (oop*)ptr) continue;
    
    oop *p;
    for (p = start; p < end; p++) {
      APPLY_TO_VM_OOPS(FIND_OOP_TEMPLATE);
      error2("Memory structure at offset %ld: oop %#lx is not registered in APPLY_TO_VM_OOPS macro",
       (char*)p - (char*)Memory, *p);
    }
    for ( p = start; p < end; p++) {
      if (! Vtbls->contains((*p)->map()->vtbl_value())) {
        error2("Memory structure at offset %ld: map of oop %#lx is not registered in Vtbls", 
               (char*)p - (char*)Memory, *p);
      }
    }
  }
}


void universe::canonize_map_vtbls() {
  APPLY_TO_SPACES(SPACE_CANONIZE_MAP_VTBLS_TEMPLATE);
}


// checks of startup parameters

const char *universe::check_eden_size(spaceSizes &snap_sizes) {
  return
    snap_sizes.eden_size < new_gen->eden_space->used()
      ? "eden_size too small" : NULL; 
}

const char *universe::check_surv_size(spaceSizes &snap_sizes) {
  return
         snap_sizes.surv_size < new_gen->from_space->used()
      || snap_sizes.surv_size < new_gen->  to_space->used()
        ? "surv_size too small" : NULL; }

const char *universe::check_old_size(spaceSizes &snap_sizes) {
  if (snap_sizes.old_size < old_gen->used())
    return "old_size too small";
  if (!space_sizes_ok(snap_sizes.old_size,
                      snap_sizes.eden_size,
                      snap_sizes.surv_size))
    return "old_size too small relative to eden_size + 2*surv_size";
  if ( OS::is_directed_allocation_supported()
  &&   snap_sizes.old_size + snap_sizes.eden_size + 2*snap_sizes.surv_size  >  MaxHeapSize)
    return "total object heap size too big";
  return NULL; }


# if defined(FAST_COMPILER) || defined(SIC_COMPILER)

const char *universe::check_code_size(spaceSizes &snap_sizes) {
  if (snap_sizes.code_size > MaxNMethodSize)
    return "code_size too big";
  return
    SnapshotCode && snap_sizes.code_size < code->iZone->usedBytes()
      ? "code_size too small" : NULL; }

const char *universe::check_deps_size(spaceSizes &snap_sizes) {
  if (snap_sizes.deps_size > MaxDepsSize)
    return "deps_size too big";
  return
    SnapshotCode && snap_sizes.deps_size < code->dZone->usedBytes()
      ? "deps_size too small" : NULL; }

const char *universe::check_pic_size(spaceSizes &snap_sizes) {
  if (snap_sizes.pic_size > MaxStubsSize)
    return "pic_size too big";
  return
    SnapshotCode && snap_sizes.pic_size < code->stubs->zone()->usedBytes()
      ? "pic_size too small" : NULL; }

const char *universe::check_debug_size(spaceSizes &snap_sizes) {
  if (snap_sizes.debug_size > MaxScopesSize)
    return "debug_size too big";
  return
    SnapshotCode && snap_sizes.debug_size < code->sZone->usedBytes()
      ? "debug_size too small" : NULL; }

# else // not: defined(FAST_COMPILER) || defined(SIC_COMPILER)

const char* universe::check_code_size(spaceSizes& snap_sizes) {
  Unused(&snap_sizes); return NULL; }

const char* universe::check_deps_size(spaceSizes& snap_sizes) {
  Unused(&snap_sizes); return NULL; }

const char* universe::check_pic_size(spaceSizes& snap_sizes) {
  Unused(&snap_sizes); return NULL; }

const char* universe::check_debug_size(spaceSizes& snap_sizes) {
  Unused(&snap_sizes); return NULL; }
  
# endif


#define CHECK_SPACE_SIZE_TEMPLATE(s)                    \
        err_str= CONC(check_, s)(snap_sizes);           \
        if (err_str) return err_str;

// return NULL for OK, otherwise error string
const char *universe::check_sizes_for_snapshot(spaceSizes &snap_sizes)
{
  const char *err_str;
  APPLY_TO_SPACE_SIZES(CHECK_SPACE_SIZE_TEMPLATE);
  return NULL;
}


// primitive to expand heap space
oop expand_heap_prim(oop rcvrIgnored, smi grow_size)
{
  Unused(rcvrIgnored);
  if (grow_size < 0)
    return ErrorCodes::vmString_prim_error(BADTYPEERROR);
  return as_smiOop(Memory->old_gen->expand(grow_size));
}


oop VMversion_prim(oop rcvrIgnored) {
  Unused(rcvrIgnored);
  objVectorOop v= Memory->objVectorObj->cloneSize(3);
  v->obj_at_put(0, as_smiOop(Memory->major_version));
  v->obj_at_put(1, as_smiOop(Memory->minor_version));
  v->obj_at_put(2, as_smiOop(Memory->snapshot_version));
  return v;
}
