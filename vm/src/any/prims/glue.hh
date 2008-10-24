/* Sun-$Revision: 30.11 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


/* NOTE: use a wide (160 chars/line) window when editing this file. */

/* Type seals. */

extern char *sealSeal;   /* Type seal for proxies containing a type seal.   */
extern char *TS_SO;      /* Type seal for dl handles (shared objects).      */
extern char *TS_symb;    /* Type seal for symbol addresses (from dynLink).  */
extern char *TS_func;    /* Type seal for functions (from dynLink).         */

# define byteVector_glue                                                                                                                                 \
  CC_mber_2(oop,,         oop,byteVector,      bv_concatenate_prim, bv_concatenate_prim_glue,   fail,   oop,byteVector, oop,byteVector                 ) \
  CC_mber_0(oop,,         oop,byteVector,      string_canonicalize_prim, string_canonicalize_prim_glue,                                                ) \
  CC_mber_0(oop,,         oop,byteVector,      string_print_prim,      string_print_prim_glue,                                                         ) \
  CC_mber_0(oop,,         oop,byteVector,      run_script_prim,        run_script_prim_glue,                                                           ) \
  CC_mber_0(oop,,         oop,byteVector,      write_snapshot_prim,    write_snapshot_prim_glue, fail                                                  ) \
  CC_mber_2(oop,,         oop,byteVector,      parseObject_prim,       parseObject_prim_glue,       fail, string,, any_oop,                            ) \
  CC_mber_0(oop,,         oop,byteVector,      parseObjectIntoPositionTable_prim, parseObjectIntoPositionTable_prim_glue,                              ) \
  CC_mber_2(oop,,         oop,byteVector,      bv_clone_prim,          bv_clone_prim_glue,      fail,    unsigned_smi,,  unsigned_char,                ) \
  CC_mber_0(oop,,         oop,byteVector,      primitive_documentation_prim, primitive_documentation_prim_glue, fail                                   ) \
  CC_mber_0(oop,,         oop,byteVector,      verify_opts_prim,       verify_opts_prim_glue,                                                          ) \



# define objVector_glue                                                                                                                                  \
  CC_mber_2(oop,,         oop,objVector,       ov_clone_prim,          ov_clone_prim_glue,      fail,    unsigned_smi,,  any_oop,                      ) \
  CC_mber_1(oop,,         oop,objVector,       ov_references_prim,     ov_references_prim_glue,,       any_oop,                                        ) \
  CC_mber_1(oop,,         oop,objVector,       ov_implementors_prim,   ov_implementors_prim_glue,,     any_oop,                                        ) \
  CC_mber_0(oop,,         oop,objVector,       ov_methodPointer_prim,  ov_methodPointer_prim_glue,                                                     ) \



# define foreign_glue                                                                                                                                    \
  CC_mber_0(bool,,        oop,foreign,         is_live,                foreign_is_live_glue,                                                           ) \
  CC_mber_0(bool,,        oop,foreign,         is_null,                foreign_is_null_glue,                                                           ) \
  CC_mber_0(void,,        oop,foreign,         kill,                   foreign_kill_glue,                                                              ) \
  CC_mber_0(smi,,         oop,foreign,         foreign_hash,           foreign_hash_glue,                                                              ) \
  CC_mber_1(bool,,        oop,foreign,         same_pointer_as,        same_pointer_as_glue,,  oop,foreign                                             ) \
  CC_mber_0(proxy,(void *,sealSeal),oop,proxy, get_type_seal,          get_type_seal_glue,                                                             ) \



# define process_glue                                                                                                                                    \
  CC_mber_4(oop,,         oop,process,         NewProcess_prim,        NewProcess_prim_glue,        fail, smi,, any_oop,, oop,string, oop,objVector    ) \
   C_func_1(bool,,                             BlockSignals_prim,      BlockSignals_prim_glue,          , bool,                                        ) \
   C_func_0(smi,,                              TWAINSResultSize_prim,  TWAINSResultSize_prim_glue,                                                     ) \
  CC_mber_3(oop,,         oop,process,         TWAINS_prim,            TWAINS_prim_glue,            fail, oop,objVector,  bool,,  any_oop,             ) \
  CC_mber_0(oop,,         oop,process,         AbortProcess_prim,      AbortProcess_prim_glue,      fail                                               ) \
  CC_mber_0(oop,,         oop,process,         PrintProcessStack_prim, PrintProcessStack_prim_glue, fail                                               ) \
  CC_mber_0(smi,,         oop,process,         StackDepth_prim,        StackDepth_prim_glue,        fail                                               ) \
  CC_mber_0(oop,,         oop,process,         ActivationStack_prim,   ActivationStack_prim_glue,   fail                                               ) \
  CC_mber_1(oop,,         oop,process,         ActivationAt_prim,      ActivationAt_prim_glue,      fail, smi,                                         ) \
  CC_mber_1(oop,,         oop,process,         KillUpTo_prim,          KillUpTo_prim_glue,          fail, smi,                                         ) \
  CC_mber_2(oop,,         oop,process,         GotoByteCode_prim,      GotoByteCode_prim_glue,      fail, smi,,           oop,objVector                ) \
  CC_mber_1(oop,,         oop,process,         set_current_hash_prim,  set_current_hash_prim_glue,,       smi,                                         ) \
  CC_mber_0(oop,,         oop,process,         ProcessReturnValue_prim, ProcessReturnValue_prim_glue, fail                                             ) \
   C_func_0(oop,,                              zombie_prim,            zombie_prim_glue,                                                               ) \



# define dynLink_glue                                                                                                                                    \
   C_func_2(proxy,(void*, TS_SO),              dlopen_wrap,            dlopen_wrap_glue,  fail, string_null,,           int,                           ) \
   C_func_2(proxy,(void*,TS_symb),             dlsym_wrap,             dlsym_wrap_glue,   fail, proxy,(void*,TS_SO),    string,                        ) \
   C_func_1(void,,                             dlclose_wrap,           dlclose_wrap_glue, fail, proxy,(void*,TS_SO)                                    ) \
   C_func_2(fct_proxy,(void*,TS_func,unknownNoOfArgs), fctLookup,      fctLookup_glue,    fail, proxy,(void*,TS_SO),    string,                        ) \
   C_func_2(smi,,                              noOfArgsFct,            noOfArgsFct_glue,      , proxy,(void*,TS_SO),    string,                        ) \



// had to break it up for Metro Works -- dmu



# define misc_glue_ll                                                                                                                                    \
   C_func_3(long_long,,    CSignedIntSize_At_prim,             CSignedIntSize_At_prim_glue,       fail, cbv_len,char *, smi,,  smi,                    ) \
   C_func_3(unsigned_long_long,,CUnsignedIntSize_At_prim,      CUnsignedIntSize_At_prim_glue,     fail, cbv_len,char *, smi,,  smi,                    ) \
   C_func_4(void,,         CSignedIntSize_At_Put_prim,         CSignedIntSize_At_Put_prim_glue,   fail,  bv_len,char *, smi,,  smi,, long_long,        ) \
   C_func_4(void,,         CUnsignedIntSize_At_Put_prim,       CUnsignedIntSize_At_Put_prim_glue, fail,  bv_len,char *, smi,,  smi,, unsigned_long_long,) \
   \
   C_func_3(long_long,,    BigEndianSignedIntSize_At_prim,         BigEndianSignedIntSize_At_prim_glue,       fail, cbv_len,char *, smi,,  smi,                    ) \
   C_func_3(unsigned_long_long,,BigEndianUnsignedIntSize_At_prim,  BigEndianUnsignedIntSize_At_prim_glue,     fail, cbv_len,char *, smi,,  smi,                    ) \
   C_func_4(void,,         BigEndianSignedIntSize_At_Put_prim,     BigEndianSignedIntSize_At_Put_prim_glue,   fail,  bv_len,char *, smi,,  smi,, long_long,        ) \
   C_func_4(void,,         BigEndianUnsignedIntSize_At_Put_prim,   BigEndianUnsignedIntSize_At_Put_prim_glue, fail,  bv_len,char *, smi,,  smi,, unsigned_long_long,) \
   \
   C_func_3(long_long,,    LittleEndianSignedIntSize_At_prim,             LittleEndianSignedIntSize_At_prim_glue,       fail, cbv_len,char *, smi,,  smi,                    ) \
   C_func_3(unsigned_long_long,,LittleEndianUnsignedIntSize_At_prim,      LittleEndianUnsignedIntSize_At_prim_glue,     fail, cbv_len,char *, smi,,  smi,                    ) \
   C_func_4(void,,         LittleEndianSignedIntSize_At_Put_prim,         LittleEndianSignedIntSize_At_Put_prim_glue,   fail,  bv_len,char *, smi,,  smi,, long_long,        ) \
   C_func_4(void,,         LittleEndianUnsignedIntSize_At_Put_prim,       LittleEndianUnsignedIntSize_At_Put_prim_glue, fail,  bv_len,char *, smi,,  smi,, unsigned_long_long,) \




# define misc_glue_1                                                                                                                                     \
   C_func_0(smi,,          monitor_height_prim,                monitor_height_prim_glue,                                                               ) \
   C_func_0(smi,,          OS::user_time,                      user_time_glue,                                                                          ) \
   C_func_0(smi,,          OS::system_time,                    system_time_glue,                                                                        ) \
   C_func_0(smi,,          OS::cpu_time,                       cpu_time_glue,                                                                           ) \
   C_func_0(oop,,          real_time_prim,                     real_time_prim_glue,               fail                                                 ) \
   C_func_2(oop,,          date_time_prim,                     date_time_prim_glue,,                     smi,,          smi,                           ) \
   C_func_1(oop,,          convert_to_day_ms_prim,             convert_to_day_ms_prim_glue,       fail,  oop,objVector                                 ) \
   C_func_0(oop,,          current_time_string_prim,           current_time_string_prim_glue,                                                          ) \
   C_func_1(smi,,          bitSize,                            bitSize_glue,                      fail,  string,                                       ) \
   C_func_1(oop,,          ErrorCodes::error_message_prim,     error_msg_prim_glue,,                     oop,byteVector                                ) \
   C_func_2(oop,,          PrintFlatProfile_prim,              PrintFlatProfile_prim_glue,,              any_oop,,      unsigned_smi,                  ) \
   C_func_4(oop,,          PrintProfile_prim,                  PrintProfile_prim_glue,,                  any_oop,,      float,, float,, smi,           ) \
   C_func_2(oop,,          Profile_prim,                       Profile_prim_glue,,                       oop,process,   bool,                          ) \
   C_func_3(double,,       CFloatDouble_At_prim,               CFloatDouble_At_prim_glue,         fail, cbv_len,char *, bool,, smi,                    ) \
   C_func_4(void,,         CFloatDouble_At_Put_prim,           CFloatDouble_At_Put_prim_glue,     fail,  bv_len,char *, bool,, smi,, double,           ) \
   misc_glue_ll

# define misc_glue_2                                                                                                                                     \
   C_func_1(oop,,          get_compilers_prim,                 get_compilers_prim_glue,,                 any_oop,                                      ) \
   C_func_1(oop,,          get_compile_counts_prim,            get_compile_counts_prim_glue,,            any_oop,                                      ) \
   C_func_1(oop,,          get_recompile_limits_prim,          get_recompile_limits_prim_glue,,          any_oop,                                      ) \
   C_func_3(oop,,          set_recompilation_prim,             set_recompilation_prim_glue,       fail,  any_oop,, oop, objVector,   oop, objVector    ) \
   C_func_6(oop,,          create_outer_method_prim,           create_outer_method_prim_glue,,  any_oop,,  oop,byteVector, oop,objVector, oop,string, oop,smi, oop,string  ) \
   C_func_6(oop,,          create_block_method_prim,           create_block_method_prim_glue,,  any_oop,,  oop,byteVector, oop,objVector, oop,string, oop,smi, oop,string  ) \
   C_func_0(oop,,          primitive_list_prim,                primitive_list_prim_glue,          fail                                                 ) \
   C_func_0(oop,,          command_line_prim,                  command_line_prim_glue,            fail                                                 ) \
   C_func_2(oop,,          get_current_space_sizes_prim,       get_current_space_sizes_prim_glue,fail,   any_oop,, oop,slots                           ) \
   C_func_2(oop,,          Memory->get_mem_current_state_prim, get_mem_current_state_prim_glue,fail,     any_oop,, oop,slots                           ) \
   C_func_2(oop,,          expand_heap_prim,                   expand_heap_prim_glue,,                   any_oop,, smi,                                ) \
   C_func_0(smi,,          Memory->old_gen->getLowSpaceThreshold,get_memory_low_space_threshold_prim_glue,                                             ) \
   C_func_2(smi,,          set_memory_low_space_threshold_prim, set_memory_low_space_threshold_prim_glue,fail,any_oop,, smi,                           ) \
   C_func_0(smi,,          Memory->old_gen->get_VM_reserved_mem, VM_reserved_mem_prim_glue,                                                            ) \
   C_get_var(smi,,         Memory->Desired_Surv_Size,          get_memory_tenuring_threshold_prim_glue                                                 ) \
   C_func_2(smi,,          set_memory_tenuring_threshold_prim, set_memory_tenuring_threshold_prim_glue,fail,any_oop,, smi,                             ) \
   C_func_1(oop,,          get_swap_space_prim,                get_swap_space_prim_glue,fail,            any_oop,                                      ) \
   C_func_0(void,,          OS::core_dump,                      core_dump_prim_glue,                                                                          ) \

# define misc_glue \
  misc_glue_1 \
  misc_glue_2 \
  

# ifdef SIC_COMPILER
# define sic_glue                                                                                                                                      \
   C_func_2(oop,,          get_sic_params_prim,                get_sic_params_prim_glue,          fail,  any_oop,,      string,                        ) \
   C_func_3(oop,,          set_sic_params_prim,                set_sic_params_prim_glue,          fail,  any_oop,,      string,,     oop, objVector    ) \

# else
# define sic_glue
# endif


# define timer_glue                                                                                                                                      \
   C_func_1(unsigned_smi,, IntervalTimer::setRealTimer_prim,   setRealTimer_prim_glue,,        unsigned_smi,                                                   ) \
   C_func_1(unsigned_smi,, IntervalTimer:: setCPUTimer_prim,    setCPUTimer_prim_glue,,        unsigned_smi,                                                   ) \




// broken up for MetroWorks -- dmu, see glue.c

# define fctProxy_glue_1                                                                                                                                         \
   CC_mber_0(smi,,  oop,fctProxy, get_noOfArgs_prim, get_noOfArgs_prim_glue,  fail                                                                     ) \
   CC_mber_1(oop,,  oop,fctProxy, set_noOfArgs_prim, set_noOfArgs_prim_glue,  fail, smi,                                                               ) \
   CC_mber_0(oop,,  oop,fctProxy, call_and_convert0, call_and_convert0_glue,                                                                           ) \
   CC_mber_1(oop,,  oop,fctProxy, call_and_convert1, call_and_convert1_glue,, any,void*                                                                ) \
   CC_mber_2(oop,,  oop,fctProxy, call_and_convert2, call_and_convert2_glue,, any,void*, any,void*                                                     ) \
   CC_mber_3(oop,,  oop,fctProxy, call_and_convert3, call_and_convert3_glue,, any,void*, any,void*, any,void*                                          ) \


# define fctProxy_glue_2 \
   CC_mber_4(oop,,  oop,fctProxy, call_and_convert4, call_and_convert4_glue,, any,void*, any,void*, any,void*, any,void*                               ) \
   CC_mber_5(oop,,  oop,fctProxy, call_and_convert5, call_and_convert5_glue,, any,void*, any,void*, any,void*, any,void*, any,void*                    ) \

# define fctProxy_glue_3 \
   CC_mber_6(oop,,  oop,fctProxy, call_and_convert6, call_and_convert6_glue,, any,void*, any,void*, any,void*, any,void*, any,void*, any,void*         ) \

# define fctProxy_glue_4 \
   CC_mber_7(oop,,  oop,fctProxy, call_and_convert7, call_and_convert7_glue,, any,void*, any,void*, any,void*, any,void*, any,void*, any,void*,          \
                                                                              any,void* )
# define fctProxy_glue_5 \
   CC_mber_8(oop,,  oop,fctProxy, call_and_convert8, call_and_convert8_glue,, any,void*, any,void*, any,void*, any,void*, any,void*, any,void*, any,void*, any,void*) \
   
# define fctProxy_glue_6 \
   CC_mber_9(oop,,  oop,fctProxy, call_and_convert9, call_and_convert9_glue,, any,void*, any,void*, any,void*, any,void*, any,void*, any,void*, any,void*, any,void*, any,void*) \


# define fctProxy_glue_7 \
   CC_mber_10(oop,,  oop,fctProxy, call_and_convert10,call_and_convert10_glue,,any,void*, any,void*, any,void*, any,void*, any,void*, any,void*,         \
                                                                               any,void*, any,void*, any,void*, any,void*                              ) \

# define fctProxy_glue \
  fctProxy_glue_1 \
  fctProxy_glue_2 \
  fctProxy_glue_3 \
  fctProxy_glue_4 \
  fctProxy_glue_5 \
  fctProxy_glue_6 \
  fctProxy_glue_7 \


# define mirror_glue                                                                                                                                     \
   CC_mber_0(oop,,  oop,mirror,   get_reflectee_prim,     get_reflectee_prim_glue,                                                                     ) \
   CC_mber_0(oop,,  oop,mirror,   codes_prim,              codes_prim_glue,                                                                            ) \
   CC_mber_0(oop,,  oop,mirror,   literals_prim,           literals_prim_glue,                                                                         ) \
   CC_mber_0(oop,,  oop,mirror,   source_prim,             source_prim_glue,                                                                           ) \
   CC_mber_0(oop,,  oop,mirror,   source_offset_prim,      source_offset_prim_glue,                                                                    ) \
   CC_mber_0(oop,,  oop,mirror,   source_length_prim,      source_length_prim_glue,                                                                    ) \
   CC_mber_0(oop,,  oop,mirror,   file_prim,               file_prim_glue,                                                                             ) \
   CC_mber_0(oop,,  oop,mirror,   line_prim,               line_prim_glue,                                                                             ) \
   CC_mber_0(oop,,  oop,mirror,   size_prim,               size_prim_glue,                                                                             ) \
   CC_mber_0(oop,,  oop,mirror,   sender_prim,             sender_prim_glue,                                                                           ) \
   CC_mber_0(oop,,  oop,mirror,   parent_prim,             parent_prim_glue,                                                                           ) \
   CC_mber_0(oop,,  oop,mirror,   receiver_prim,           receiver_prim_glue,                                                                         ) \
   CC_mber_0(oop,,  oop,mirror,   expr_stack_prim,         expr_stack_prim_glue,                                                                       ) \
   CC_mber_0(oop,,  oop,mirror,   methodHolder_prim,       methodHolder_prim_glue,                                                                     ) \
   CC_mber_0(oop,,  oop,mirror,   selector_prim,           selector_prim_glue,                                                                         ) \
   CC_mber_0(oop,,  oop,mirror,   bci_prim,                bci_prim_glue,                                                                              ) \
   CC_mber_0(oop,,  oop,mirror,   names_prim,              names_prim_glue,                                                                            ) \
   CC_mber_1(oop,,  oop,mirror,   name_at_prim,            name_at_prim_glue,,                  smi,                                                   ) \
   CC_mber_1(oop,,  oop,mirror,   contents_at_prim,        contents_at_prim_glue,,              oop,string                                             ) \
   CC_mber_1(oop,,  oop,mirror,   is_parent_at_prim,       is_parent_at_prim_glue,,             oop,string                                             ) \
   CC_mber_1(oop,,  oop,mirror,   is_argument_at_prim,     is_argument_at_prim_glue,,           oop,string                                             ) \
   CC_mber_1(oop,,  oop,mirror,   is_assignable_at_prim,   is_assignable_at_prim_glue,,         oop,string                                             ) \
   CC_mber_1(oop,,  oop,mirror,   define_prim,             mirror_define_prim_glue,fail,        oop,mirror                                             ) \
   CC_mber_5(oop,,  oop,mirror,   copy_add_slot_prim,      copy_add_slot_prim_glue,fail,        oop,string, oop,mirror, bool,, bool,, any_oop,    ) \
   CC_mber_1(oop,,  oop,mirror,   copy_remove_prim,        copy_remove_prim_glue,fail,          oop,string                                             ) \
   CC_mber_1(oop,,  oop,mirror,   evaluate_in_context_prim,evaluate_in_context_prim_glue,,      oop,mirror                                             ) \
   CC_mber_0(oop,,  oop,mirror,   get_annotation_prim,    get_annotation_prim_glue,                                                                    ) \
   CC_mber_1(oop,,  oop,mirror,   copy_set_annotation_prim,    copy_set_annotation_prim_glue, fail, any_oop,                                           ) \
   CC_mber_1(oop,,  oop,mirror,   annotation_at_prim,     annotation_at_prim_glue,,             oop,string                                             ) \
   CC_mber_0(oop,,  oop,mirror,   create_block_prim,      create_block_prim_glue,                                                                      ) \
   C_get_var(oop,,  Memory->programming_timestamp,                programming_timestamp_prim_glue) \
   C_set_var(       Memory->programming_timestamp,  oop,smi,  set_programming_timestamp_prim_glue) \


# define oop_glue                                                                                                                                        \
   CC_mber_0(smi,,  any_oop,,     identity_hash,          identity_hash_prim_glue,                                                                     ) \
   CC_mber_0(smi,,  any_oop,,     objectID_prim,          objectID_prim_glue,                                                                          ) \
   CC_mber_1(bool,, any_oop,,     eq_prim,                oop_eq_prim_glue,,           any_oop,                                                        ) \
   CC_mber_1(oop,,  any_oop,,     print_memory_histogram_prim, print_memory_histogram_prim_glue,,  smi,                                                ) \
   CC_mber_1(oop,,  any_oop,,     print_nmethod_histogram_prim, print_nmethod_histogram_prim_glue,,  smi,                                              ) \
   CC_mber_1(oop,,  any_oop,,     all_prim,               all_prim_glue,,                   any_oop,                                                   ) \
   CC_mber_0(oop,,  any_oop,,     clone_prim,             clone_prim_glue, fail                                                                        ) \
   CC_mber_1(oop,,  any_oop,,     define_prim,            define_prim_glue,fail, any_oop,                                                              ) \
   CC_mber_0(oop,,  any_oop,,     compact_prim,           compact_prim_glue,                                                                           ) \
   CC_mber_0(oop,,  any_oop,,     credits_prim,           credits_prim_glue,                                                                           ) \
   CC_mber_0(oop,,  any_oop,,     flush_prim,             flush_prim_glue,                                                                             ) \
   CC_mber_0(oop,,  any_oop,,     flush_inline_cache_prim,flush_inline_cache_prim_glue,                                                                ) \
   CC_mber_0(oop,,  any_oop,,     flushUnused_prim,       flushUnused_prim_glue,                                                                       ) \
   CC_mber_0(oop,,  any_oop,,     markAllUnused_prim,     markAllUnused_prim_glue,                                                                     ) \
   CC_mber_0(oop,,  any_oop,,     garbage_collect_prim,   garbage_collect_prim_glue,                                                                   ) \
   CC_mber_0(oop,,  any_oop,,     manufacturer_prim,      manufacturer_prim_glue,                                                                      ) \
   CC_mber_0(oop,,  any_oop,,     operating_system_prim,  operating_system_prim_glue,                                                                  ) \
   CC_mber_0(oop,,  any_oop,,     print_prim,             print_prim_glue,                                                                             ) \
   CC_mber_0(oop,,  any_oop,,     print_memory_prim,      print_memory_prim_glue,                                                                      ) \
   CC_mber_0(oop,,  any_oop,,     print_slot_stats_prim,  print_slot_stats_prim_glue,                                                                  ) \
   CC_mber_0(oop,,  any_oop,,     print_zone_stats_prim,  print_zone_stats_prim_glue,                                                                  ) \
   CC_mber_0(oop,,  any_oop,,     print_option_primitives_prim,print_option_primitives_prim_glue,                                                      ) \
   CC_mber_0(oop,,  any_oop,,     print_changed_option_primitives_prim,print_changed_option_primitives_prim_glue,                                                      ) \
   CC_mber_0(oop,,  any_oop,,     quit_prim,              quit_prim_glue,                                                                              ) \
   CC_mber_0(oop,,  any_oop,,     tenure_prim,            tenure_prim_glue,                                                                            ) \
   CC_mber_0(oop,,  any_oop,,     verify_prim,            verify_prim_glue,                                                                            ) \
    C_func_5(oop,,  full_write_snapshot_prim, full_write_snapshot_prim_glue, fail,     any_oop,,   oop,byteVector,  oop,slots,  oop,slots, bool,      ) \



# define slots_glue                                                                                                                                      \
   CC_mber_1(oop,,  oop,slots,    remove_slot_prim,       remove_slot_prim_glue,         fail,  oop,string                                             ) \
   CC_mber_0(oop,,  oop,slots,    remove_all_slots_prim,  remove_all_slots_prim_glue,    fail                                                          ) \
   CC_mber_1(oop,,  oop,slots,    add_slots_prim,         add_slots_prim_glue,           fail,  any_oop,                                               ) \
   CC_mber_1(oop,,  oop,slots,    add_slots_if_absent_prim,add_slots_if_absent_prim_glue,fail,  any_oop,                                               ) \



# define smi_glue                                                                                                                                        \
   CC_mber_0(oop,,   oop,smi,     as_object_prim,         as_object_prim_glue,                                                                         ) \
   CC_mber_0(oop,,   oop,smi,     address_as_oop_prim,    address_as_oop_prim_glue,                                                                    ) \



# define float_glue                                                                                                                                      \
   CC_mber_0(string,, oop,float,  print_string_prim,      print_string_prim_glue,                                                                      ) \
   CC_mber_1(string,, oop,float,  print_string_precision_prim, print_string_precision_prim_glue,,   unsigned_smi,                                      ) \


# define profiler_glue                                                                                                                                   \
   CC_mber_0(oop,,  oop,profiler, ProfilerProcess_prim,   ProfilerProcess_prim_glue,   fail                                                            ) \
   CC_mber_1(oop,,  oop,profiler, ProfilerEngage_prim,    ProfilerEngage_prim_glue,    fail, any_oop,                                                  ) \
   CC_mber_0(oop,,  oop,profiler, ProfilerDisengage_prim, ProfilerDisengage_prim_glue, fail                                                            ) \
   CC_mber_0(oop,,  oop,profiler, ProfilerReset_prim,     ProfilerReset_prim_glue,                                                                     ) \
   CC_mber_1(oop,,  oop,profiler, ProfilerTicks_prim,     ProfilerTicks_prim_glue,     fail, any_oop,                                                  ) \
   CC_mber_1(oop,,  oop,profiler, ProfilerTimes_prim,     ProfilerTimes_prim_glue,     fail, any_oop,                                                  ) \
   CC_mber_8(oop,,  oop,profiler, ProfilerCopyGraph_prim, ProfilerCopyGraph_prim_glue, fail, any_oop,, any_oop,, any_oop,, any_oop,, any_oop,,           \
                                                                                             any_oop,, any_oop,, unsigned_smi,                         ) \
   CC_mber_1(oop,,  oop,profiler, ProfilerPrint_prim,     ProfilerPrint_prim_glue,,           float,                                                   ) \



# define WHAT_GLUE PROTOTYPES
    byteVector_glue
    objVector_glue
    foreign_glue
    process_glue
    misc_glue
    timer_glue
    fctProxy_glue
    mirror_glue
    oop_glue
    slots_glue
    smi_glue
    float_glue
    profiler_glue
# ifdef DYNLINK_SUPPORTED
    dynLink_glue
# endif
# ifdef SIC_COMPILER
    sic_glue
# endif
# undef  WHAT_GLUE

