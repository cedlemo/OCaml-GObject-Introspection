open Ctypes

val c_ANALYZER_ANALYZING : int32
val c_ASCII_DTOSTR_BUF_SIZE : int32
val c_BIG_ENDIAN : int32
(*SKIPPED : ByteArray*)
(*SKIPPED : Bytes*)
val c_CSET_A_2_Z : string
val c_CSET_DIGITS : string
val c_CSET_a_2_z : string
val c_DATALIST_FLAGS_MASK : int32
val c_DATE_BAD_DAY : int32
val c_DATE_BAD_JULIAN : int32
val c_DATE_BAD_YEAR : int32
val c_DIR_SEPARATOR : int32
val c_DIR_SEPARATOR_S : string
val c_E : float
val c_GINT16_FORMAT : string
val c_GINT16_MODIFIER : string
val c_GINT32_FORMAT : string
val c_GINT32_MODIFIER : string
val c_GINT64_FORMAT : string
val c_GINT64_MODIFIER : string
val c_GINTPTR_FORMAT : string
val c_GINTPTR_MODIFIER : string
(*DEPRECATED : GNUC_FUNCTION*)
(*DEPRECATED : GNUC_PRETTY_FUNCTION*)
val c_GSIZE_FORMAT : string
val c_GSIZE_MODIFIER : string
val c_GSSIZE_FORMAT : string
val c_GSSIZE_MODIFIER : string
val c_GUINT16_FORMAT : string
val c_GUINT32_FORMAT : string
val c_GUINT64_FORMAT : string
val c_GUINTPTR_FORMAT : string
val c_HAVE_GINT64 : int32
val c_HAVE_GNUC_VARARGS : int32
val c_HAVE_GNUC_VISIBILITY : int32
val c_HAVE_GROWING_STACK : int32
val c_HAVE_ISO_VARARGS : int32
val c_HOOK_FLAG_USER_SHIFT : int32
(*SKIPPED : Hook*)
(*SKIPPED : HookCheckFunc*)
(*SKIPPED : HookCheckMarshaller*)
(*SKIPPED : HookCompareFunc*)
(*SKIPPED : HookFinalizeFunc*)
(*SKIPPED : HookFindFunc*)
(*SKIPPED : HookFlagMask*)
(*SKIPPED : HookFunc*)
(*SKIPPED : HookList*)
(*SKIPPED : HookMarshaller*)
val c_IEEE754_DOUBLE_BIAS : int32
val c_IEEE754_FLOAT_BIAS : int32
val c_KEY_FILE_DESKTOP_GROUP : string
val c_KEY_FILE_DESKTOP_KEY_ACTIONS : string
val c_KEY_FILE_DESKTOP_KEY_CATEGORIES : string
val c_KEY_FILE_DESKTOP_KEY_COMMENT : string
val c_KEY_FILE_DESKTOP_KEY_DBUS_ACTIVATABLE : string
val c_KEY_FILE_DESKTOP_KEY_EXEC : string
val c_KEY_FILE_DESKTOP_KEY_GENERIC_NAME : string
val c_KEY_FILE_DESKTOP_KEY_HIDDEN : string
val c_KEY_FILE_DESKTOP_KEY_ICON : string
val c_KEY_FILE_DESKTOP_KEY_MIME_TYPE : string
val c_KEY_FILE_DESKTOP_KEY_NAME : string
val c_KEY_FILE_DESKTOP_KEY_NOT_SHOW_IN : string
val c_KEY_FILE_DESKTOP_KEY_NO_DISPLAY : string
val c_KEY_FILE_DESKTOP_KEY_ONLY_SHOW_IN : string
val c_KEY_FILE_DESKTOP_KEY_PATH : string
val c_KEY_FILE_DESKTOP_KEY_STARTUP_NOTIFY : string
val c_KEY_FILE_DESKTOP_KEY_STARTUP_WM_CLASS : string
val c_KEY_FILE_DESKTOP_KEY_TERMINAL : string
val c_KEY_FILE_DESKTOP_KEY_TRY_EXEC : string
val c_KEY_FILE_DESKTOP_KEY_TYPE : string
val c_KEY_FILE_DESKTOP_KEY_URL : string
val c_KEY_FILE_DESKTOP_KEY_VERSION : string
val c_KEY_FILE_DESKTOP_TYPE_APPLICATION : string
val c_KEY_FILE_DESKTOP_TYPE_DIRECTORY : string
val c_KEY_FILE_DESKTOP_TYPE_LINK : string
val c_LITTLE_ENDIAN : int32
val c_LN10 : float
val c_LN2 : float
val c_LOG_2_BASE_10 : float
val c_LOG_DOMAIN : int
val c_LOG_FATAL_MASK : int32
val c_LOG_LEVEL_USER_SHIFT : int32
val c_MAJOR_VERSION : int32
val c_MAXINT16 : int
val c_MAXINT32 : int32
val c_MAXINT64 : int64
val c_MAXINT8 : int
val c_MAXUINT16 : Unsigned.uint16
val c_MAXUINT32 : Unsigned.uint32
val c_MAXUINT64 : Unsigned.uint64
val c_MAXUINT8 : Unsigned.uint8
val c_MICRO_VERSION : int32
val c_MININT16 : int
val c_MININT32 : int32
val c_MININT64 : int64
val c_MININT8 : int
val c_MINOR_VERSION : int32
val c_MODULE_SUFFIX : string
(*SKIPPED : MainContext*)
val c_OPTION_REMAINING : string
val c_PDP_ENDIAN : int32
val c_PI : float
val c_PID_FORMAT : string
val c_PI_2 : float
val c_PI_4 : float
val c_POLLFD_FORMAT : string
val c_PRIORITY_DEFAULT : int32
val c_PRIORITY_DEFAULT_IDLE : int32
val c_PRIORITY_HIGH : int32
val c_PRIORITY_HIGH_IDLE : int32
val c_PRIORITY_LOW : int32
val c_SEARCHPATH_SEPARATOR : int32
val c_SEARCHPATH_SEPARATOR_S : string
val c_SIZEOF_LONG : int32
val c_SIZEOF_SIZE_T : int32
val c_SIZEOF_SSIZE_T : int32
val c_SIZEOF_VOID_P : int32
val c_SOURCE_CONTINUE : bool
val c_SOURCE_REMOVE : bool
val c_SQRT2 : float
val c_STR_DELIMITERS : string
val c_SYSDEF_AF_INET : int32
val c_SYSDEF_AF_INET6 : int32
val c_SYSDEF_AF_UNIX : int32
val c_SYSDEF_MSG_DONTROUTE : int32
val c_SYSDEF_MSG_OOB : int32
val c_SYSDEF_MSG_PEEK : int32
val c_TIME_SPAN_DAY : int64
val c_TIME_SPAN_HOUR : int64
val c_TIME_SPAN_MILLISECOND : int64
val c_TIME_SPAN_MINUTE : int64
val c_TIME_SPAN_SECOND : int64
(*DEPRECATED : TestTrapFlags*)
(*DEPRECATED : TrashStack*)
val c_UNICHAR_MAX_DECOMPOSITION_LENGTH : int32
val c_URI_RESERVED_CHARS_GENERIC_DELIMITERS : string
val c_URI_RESERVED_CHARS_SUBCOMPONENT_DELIMITERS : string
val c_USEC_PER_SEC : int32
val c_VA_COPY_AS_ARRAY : int32
val c_VERSION_MIN_REQUIRED : int32
val c_WIN32_MSG_HANDLE : int32
val access:
string -> int32 -> int32
val ascii_digit_value:
int -> int32
val ascii_dtostr:
string -> int32 -> float -> string
val ascii_formatd:
string -> int32 -> string -> float -> string
val ascii_strcasecmp:
string -> string -> int32
val ascii_strdown:
string -> int64 -> string
val ascii_strncasecmp:
string -> string -> Unsigned.uint64 -> int32
(*Not implemented g_ascii_strtod argument type Arg_info.In or Arg_info.Out not handled*)
(*Not implemented g_ascii_strtoll argument type Arg_info.In or Arg_info.Out not handled*)
(*Not implemented g_ascii_strtoull argument type Arg_info.In or Arg_info.Out not handled*)
val ascii_strup:
string -> int64 -> string
val ascii_tolower:
int -> int
val ascii_toupper:
int -> int
val ascii_xdigit_value:
int -> int32
val assert_warning:
string -> string -> int32 -> string -> string -> unit
val assertion_message:
string -> string -> int32 -> string -> string -> unit
val assertion_message_cmpstr:
string -> string -> int32 -> string -> string -> string -> string -> string -> unit
val assertion_message_error:
string -> string -> int32 -> string -> string -> Error.t structure ptr -> Unsigned.uint32 -> int32 -> unit
(*DEPRECATED : atexit*)
val atomic_int_add:
int32 ptr -> int32 -> int32
val atomic_int_and:
Unsigned.uint32 ptr -> Unsigned.uint32 -> Unsigned.uint32
val atomic_int_compare_and_exchange:
int32 ptr -> int32 -> int32 -> bool
val atomic_int_dec_and_test:
int32 ptr -> bool
(*DEPRECATED : atomic_int_exchange_and_add*)
val atomic_int_get:
int32 ptr -> int32
val atomic_int_inc:
int32 ptr -> unit
val atomic_int_or:
Unsigned.uint32 ptr -> Unsigned.uint32 -> Unsigned.uint32
val atomic_int_set:
int32 ptr -> int32 -> unit
val atomic_int_xor:
Unsigned.uint32 ptr -> Unsigned.uint32 -> Unsigned.uint32
val atomic_pointer_add:
unit ptr -> int64 -> int64
val atomic_pointer_and:
unit ptr -> Unsigned.uint64 -> Unsigned.uint64
val atomic_pointer_compare_and_exchange:
unit ptr -> unit ptr option -> unit ptr option -> bool
val atomic_pointer_get:
unit ptr -> unit ptr option
val atomic_pointer_or:
unit ptr -> Unsigned.uint64 -> Unsigned.uint64
val atomic_pointer_set:
unit ptr -> unit ptr option -> unit
val atomic_pointer_xor:
unit ptr -> Unsigned.uint64 -> Unsigned.uint64
(*Not implemented g_base64_decode argument type Arg_info.In or Arg_info.Out not handled*)
(*Not implemented g_base64_decode_inplace argument type Arg_info.In or Arg_info.Out not handled*)
(*Not implemented g_base64_decode_step argument type C Array type for Types.Array tag not handled*)
(*Not implemented g_base64_encode argument type C Array type for Types.Array tag not handled*)
(*Not implemented g_base64_encode_close argument type Arg_info.In or Arg_info.Out not handled*)
(*Not implemented g_base64_encode_step argument type C Array type for Types.Array tag not handled*)
(*DEPRECATED : basename*)
val bit_lock:
int32 ptr -> int32 -> unit
val bit_nth_lsf:
Unsigned.uint64 -> int32 -> int32
val bit_nth_msf:
Unsigned.uint64 -> int32 -> int32
val bit_storage:
Unsigned.uint64 -> Unsigned.uint32
val bit_trylock:
int32 ptr -> int32 -> bool
val bit_unlock:
int32 ptr -> int32 -> unit
val bookmark_file_error_quark:
unit -> Unsigned.uint32
(*Not implemented g_build_filenamev argument type C Array type for Types.Array tag not handled*)
(*Not implemented g_build_pathv argument type C Array type for Types.Array tag not handled*)
(*SKIPPED : g_byte_array_free argument type Byte_array.t structure ptr*)
(*SKIPPED : g_byte_array_free_to_bytes argument type Byte_array.t structure ptr*)
(*SKIPPED : g_byte_array_new return type Byte_array.t structure ptr*)
(*Not implemented g_byte_array_new_take argument type C Array type for Types.Array tag not handled*)
(*SKIPPED : g_byte_array_unref argument type Byte_array.t structure ptr*)
val chdir:
string -> int32
val check_version:
Unsigned.uint32 -> Unsigned.uint32 -> Unsigned.uint32 -> string
val checksum_type_get_length:
Checksum_type.t -> int64
(*Not implemented g_child_watch_add_full argument type callback not handled*)
val child_watch_source_new:
int32 -> Source.t structure ptr
val clear_error:
unit -> Error.t structure ptr ptr option -> unit
val close:
int32 -> Error.t structure ptr ptr option -> bool
(*SKIPPED : g_compute_checksum_for_bytes argument type Bytes.t structure ptr*)
(*Not implemented g_compute_checksum_for_data argument type C Array type for Types.Array tag not handled*)
val compute_checksum_for_string:
Checksum_type.t -> string -> int64 -> string
(*SKIPPED : g_compute_hmac_for_bytes argument type Bytes.t structure ptr*)
(*Not implemented g_compute_hmac_for_data argument type C Array type for Types.Array tag not handled*)
(*Not implemented g_compute_hmac_for_string argument type C Array type for Types.Array tag not handled*)
(*Not implemented g_convert argument type Arg_info.In or Arg_info.Out not handled*)
val convert_error_quark:
unit -> Unsigned.uint32
val convert_with_fallback:
string -> int64 -> string -> string -> string -> Unsigned.uint64 ptr -> Unsigned.uint64 ptr -> Error.t structure ptr ptr option -> string
val convert_with_iconv:
string -> int64 -> IConv.t structure ptr -> Unsigned.uint64 ptr -> Unsigned.uint64 ptr -> Error.t structure ptr ptr option -> string
val datalist_clear:
Data.t structure ptr -> unit
val datalist_get_data:
Data.t structure ptr -> string -> unit ptr option
val datalist_get_flags:
Data.t structure ptr -> Unsigned.uint32
val datalist_id_get_data:
Data.t structure ptr -> Unsigned.uint32 -> unit ptr option
val datalist_id_remove_no_notify:
Data.t structure ptr -> Unsigned.uint32 -> unit ptr option
(*Not implemented g_datalist_id_replace_data argument type callback not handled*)
(*Not implemented g_datalist_id_set_data_full argument type callback not handled*)
val datalist_init:
Data.t structure ptr -> unit
val datalist_set_flags:
Data.t structure ptr -> Unsigned.uint32 -> unit
val datalist_unset_flags:
Data.t structure ptr -> Unsigned.uint32 -> unit
val dataset_destroy:
unit ptr -> unit
val dataset_id_get_data:
unit ptr -> Unsigned.uint32 -> unit ptr option
val dataset_id_remove_no_notify:
unit ptr -> Unsigned.uint32 -> unit ptr option
(*Not implemented g_dataset_id_set_data_full argument type callback not handled*)
val date_get_days_in_month:
Date_month.t -> Unsigned.uint16 -> Unsigned.uint8
val date_get_monday_weeks_in_year:
Unsigned.uint16 -> Unsigned.uint8
val date_get_sunday_weeks_in_year:
Unsigned.uint16 -> Unsigned.uint8
val date_is_leap_year:
Unsigned.uint16 -> bool
val date_strftime:
string -> Unsigned.uint64 -> string -> Date.t structure ptr -> Unsigned.uint64
val date_time_compare:
unit ptr -> unit ptr -> int32
val date_time_equal:
unit ptr -> unit ptr -> bool
val date_time_hash:
unit ptr -> Unsigned.uint32
val date_valid_day:
Unsigned.uint8 -> bool
val date_valid_dmy:
Unsigned.uint8 -> Date_month.t -> Unsigned.uint16 -> bool
val date_valid_julian:
Unsigned.uint32 -> bool
val date_valid_month:
Date_month.t -> bool
val date_valid_weekday:
Date_weekday.t -> bool
val date_valid_year:
Unsigned.uint16 -> bool
val dcgettext:
string option -> string -> int32 -> string
val dgettext:
string option -> string -> string
val dir_make_tmp:
string option -> Error.t structure ptr ptr option -> string
val direct_equal:
unit ptr option -> unit ptr option -> bool
val direct_hash:
unit ptr option -> Unsigned.uint32
val dngettext:
string option -> string -> string -> Unsigned.uint64 -> string
val double_equal:
unit ptr -> unit ptr -> bool
val double_hash:
unit ptr -> Unsigned.uint32
val dpgettext:
string option -> string -> Unsigned.uint64 -> string
val dpgettext2:
string option -> string -> string -> string
(*Not implemented g_environ_getenv argument type C Array type for Types.Array tag not handled*)
(*Not implemented g_environ_setenv argument type C Array type for Types.Array tag not handled*)
(*Not implemented g_environ_unsetenv argument type C Array type for Types.Array tag not handled*)
val file_error_from_errno:
int32 -> File_error.t
val file_error_quark:
unit -> Unsigned.uint32
(*Not implemented g_file_get_contents argument type Arg_info.In or Arg_info.Out not handled*)
(*Not implemented g_file_open_tmp argument type Arg_info.In or Arg_info.Out not handled*)
val file_read_link:
string -> Error.t structure ptr ptr option -> string
(*Not implemented g_file_set_contents argument type C Array type for Types.Array tag not handled*)
val file_test:
string -> File_test.t_list -> bool
val filename_display_basename:
string -> string
val filename_display_name:
string -> string
(*Not implemented g_filename_from_uri argument type Arg_info.In or Arg_info.Out not handled*)
(*Not implemented g_filename_from_utf8 argument type Arg_info.In or Arg_info.Out not handled*)
val filename_to_uri:
string -> string option -> Error.t structure ptr ptr option -> string
(*Not implemented g_filename_to_utf8 argument type Arg_info.In or Arg_info.Out not handled*)
val find_program_in_path:
string -> string
val format_size:
Unsigned.uint64 -> string
(*DEPRECATED : format_size_for_display*)
val format_size_full:
Unsigned.uint64 -> Format_size_flags.t_list -> string
val free:
unit ptr option -> unit
val get_application_name:
unit -> string
(*Not implemented g_get_charset argument type Arg_info.In or Arg_info.Out not handled*)
val get_codeset:
unit -> string
val get_current_dir:
unit -> string
val get_current_time:
Time_val.t structure ptr -> unit
(*Not implemented g_get_environ return type C Array type for Types.Array tag not handled*)
val get_filename_charsets:
string -> bool
val get_home_dir:
unit -> string
val get_host_name:
unit -> string
(*Not implemented g_get_language_names return type C Array type for Types.Array tag not handled*)
(*Not implemented g_get_locale_variants return type C Array type for Types.Array tag not handled*)
val get_monotonic_time:
unit -> int64
val get_num_processors:
unit -> Unsigned.uint32
val get_prgname:
unit -> string
val get_real_name:
unit -> string
val get_real_time:
unit -> int64
(*Not implemented g_get_system_config_dirs return type C Array type for Types.Array tag not handled*)
(*Not implemented g_get_system_data_dirs return type C Array type for Types.Array tag not handled*)
val get_tmp_dir:
unit -> string
val get_user_cache_dir:
unit -> string
val get_user_config_dir:
unit -> string
val get_user_data_dir:
unit -> string
val get_user_name:
unit -> string
val get_user_runtime_dir:
unit -> string
val get_user_special_dir:
User_directory.t -> string
val getenv:
string -> string
val hash_table_add:
Hash_table.t structure ptr -> unit ptr option -> bool
val hash_table_contains:
Hash_table.t structure ptr -> unit ptr option -> bool
val hash_table_destroy:
Hash_table.t structure ptr -> unit
val hash_table_insert:
Hash_table.t structure ptr -> unit ptr option -> unit ptr option -> bool
val hash_table_lookup:
Hash_table.t structure ptr -> unit ptr option -> unit ptr option
(*Not implemented g_hash_table_lookup_extended argument type Arg_info.In or Arg_info.Out not handled*)
val hash_table_remove:
Hash_table.t structure ptr -> unit ptr option -> bool
val hash_table_remove_all:
Hash_table.t structure ptr -> unit
val hash_table_replace:
Hash_table.t structure ptr -> unit ptr option -> unit ptr option -> bool
val hash_table_size:
Hash_table.t structure ptr -> Unsigned.uint32
val hash_table_steal:
Hash_table.t structure ptr -> unit ptr option -> bool
val hash_table_steal_all:
Hash_table.t structure ptr -> unit
val hash_table_unref:
Hash_table.t structure ptr -> unit
(*SKIPPED : g_hook_destroy argument type Hook_list.t structure ptr*)
(*SKIPPED : g_hook_destroy_link argument type Hook_list.t structure ptr*)
(*SKIPPED : g_hook_free argument type Hook_list.t structure ptr*)
(*SKIPPED : g_hook_insert_before argument type Hook_list.t structure ptr*)
(*SKIPPED : g_hook_prepend argument type Hook_list.t structure ptr*)
(*SKIPPED : g_hook_unref argument type Hook_list.t structure ptr*)
val hostname_is_ascii_encoded:
string -> bool
val hostname_is_ip_address:
string -> bool
val hostname_is_non_ascii:
string -> bool
val hostname_to_ascii:
string -> string
val hostname_to_unicode:
string -> string
val iconv:
IConv.t structure ptr -> string -> Unsigned.uint64 ptr -> string -> Unsigned.uint64 ptr -> Unsigned.uint64
(*Not implemented g_idle_add_full argument type callback not handled*)
val idle_remove_by_data:
unit ptr option -> bool
val idle_source_new:
unit -> Source.t structure ptr
val int64_equal:
unit ptr -> unit ptr -> bool
val int64_hash:
unit ptr -> Unsigned.uint32
val int_equal:
unit ptr -> unit ptr -> bool
val int_hash:
unit ptr -> Unsigned.uint32
val intern_static_string:
string option -> string
val intern_string:
string option -> string
(*Not implemented g_io_add_watch_full argument type callback not handled*)
val io_channel_error_from_errno:
int32 -> IOChannel_error.t
val io_channel_error_quark:
unit -> Unsigned.uint32
val io_create_watch:
IOChannel.t structure ptr -> IOCondition.t_list -> Source.t structure ptr
val key_file_error_quark:
unit -> Unsigned.uint32
(*Not implemented g_listenv return type C Array type for Types.Array tag not handled*)
(*Not implemented g_locale_from_utf8 argument type Arg_info.In or Arg_info.Out not handled*)
(*Not implemented g_locale_to_utf8 argument type Arg_info.In or Arg_info.Out not handled*)
val log_default_handler:
string option -> Log_level_flags.t_list -> string option -> unit ptr option -> unit
val log_remove_handler:
string -> Unsigned.uint32 -> unit
val log_set_always_fatal:
Log_level_flags.t_list -> Log_level_flags.t_list
val log_set_fatal_mask:
string -> Log_level_flags.t_list -> Log_level_flags.t_list
(*Not implemented g_log_set_handler_full argument type callback not handled*)
(*Not implemented g_log_set_writer_func argument type callback not handled*)
(*Not implemented g_log_structured_array argument type C Array type for Types.Array tag not handled*)
val log_variant:
string option -> Log_level_flags.t_list -> Variant.t structure ptr -> unit
(*Not implemented g_log_writer_default argument type C Array type for Types.Array tag not handled*)
(*Not implemented g_log_writer_format_fields argument type C Array type for Types.Array tag not handled*)
val log_writer_is_journald:
int32 -> bool
(*Not implemented g_log_writer_journald argument type C Array type for Types.Array tag not handled*)
(*Not implemented g_log_writer_standard_streams argument type C Array type for Types.Array tag not handled*)
val log_writer_supports_color:
int32 -> bool
(*SKIPPED : g_main_context_default return type Main_context.t structure ptr*)
(*SKIPPED : g_main_context_get_thread_default return type Main_context.t structure ptr*)
(*SKIPPED : g_main_context_ref_thread_default return type Main_context.t structure ptr*)
val main_current_source:
unit -> Source.t structure ptr
val main_depth:
unit -> int32
val malloc:
Unsigned.uint64 -> unit ptr option
val malloc0:
Unsigned.uint64 -> unit ptr option
val malloc0_n:
Unsigned.uint64 -> Unsigned.uint64 -> unit ptr option
val malloc_n:
Unsigned.uint64 -> Unsigned.uint64 -> unit ptr option
val markup_error_quark:
unit -> Unsigned.uint32
val markup_escape_text:
string -> int64 -> string
(*DEPRECATED : mem_is_system_malloc*)
(*DEPRECATED : mem_profile*)
(*DEPRECATED : mem_set_vtable*)
val memdup:
unit ptr option -> Unsigned.uint32 -> unit ptr option
val mkdir_with_parents:
string -> int32 -> int32
val nullify_pointer:
unit ptr -> unit
val on_error_query:
string -> unit
val on_error_stack_trace:
string -> unit
val once_init_enter:
unit ptr -> bool
val once_init_leave:
unit ptr -> Unsigned.uint64 -> unit
val option_error_quark:
unit -> Unsigned.uint32
(*Not implemented g_parse_debug_string argument type C Array type for Types.Array tag not handled*)
val path_get_basename:
string -> string
val path_get_dirname:
string -> string
val path_is_absolute:
string -> bool
val path_skip_root:
string -> string option
val pattern_match:
Pattern_spec.t structure ptr -> Unsigned.uint32 -> string -> string option -> bool
val pattern_match_simple:
string -> string -> bool
val pattern_match_string:
Pattern_spec.t structure ptr -> string -> bool
val pointer_bit_lock:
unit ptr -> int32 -> unit
val pointer_bit_trylock:
unit ptr -> int32 -> bool
val pointer_bit_unlock:
unit ptr -> int32 -> unit
val poll:
Poll_fd.t structure ptr -> Unsigned.uint32 -> int32 -> int32
(*Not implemented g_propagate_error argument type Arg_info.In or Arg_info.Out not handled*)
val quark_from_static_string:
string option -> Unsigned.uint32
val quark_from_string:
string option -> Unsigned.uint32
val quark_to_string:
Unsigned.uint32 -> string
val quark_try_string:
string option -> Unsigned.uint32
val random_double:
unit -> float
val random_double_range:
float -> float -> float
val random_int:
unit -> Unsigned.uint32
val random_int_range:
int32 -> int32 -> int32
val random_set_seed:
Unsigned.uint32 -> unit
val realloc:
unit ptr option -> Unsigned.uint64 -> unit ptr option
val realloc_n:
unit ptr option -> Unsigned.uint64 -> Unsigned.uint64 -> unit ptr option
(*Not implemented g_regex_check_replacement argument type Arg_info.In or Arg_info.Out not handled*)
val regex_error_quark:
unit -> Unsigned.uint32
val regex_escape_nul:
string -> int32 -> string
(*Not implemented g_regex_escape_string argument type C Array type for Types.Array tag not handled*)
val regex_match_simple:
string -> string -> Regex_compile_flags.t_list -> Regex_match_flags.t_list -> bool
(*Not implemented g_regex_split_simple return type C Array type for Types.Array tag not handled*)
val reload_user_special_dirs_cache:
unit -> unit
val rmdir:
string -> int32
val sequence_get:
Sequence_iter.t structure ptr -> unit ptr option
val sequence_move:
Sequence_iter.t structure ptr -> Sequence_iter.t structure ptr -> unit
val sequence_move_range:
Sequence_iter.t structure ptr -> Sequence_iter.t structure ptr -> Sequence_iter.t structure ptr -> unit
val sequence_remove:
Sequence_iter.t structure ptr -> unit
val sequence_remove_range:
Sequence_iter.t structure ptr -> Sequence_iter.t structure ptr -> unit
val sequence_set:
Sequence_iter.t structure ptr -> unit ptr option -> unit
val sequence_swap:
Sequence_iter.t structure ptr -> Sequence_iter.t structure ptr -> unit
val set_application_name:
string -> unit
(*Not implemented g_set_error_literal argument type Arg_info.In or Arg_info.Out not handled*)
val set_prgname:
string -> unit
val setenv:
string -> string -> bool -> bool
val shell_error_quark:
unit -> Unsigned.uint32
(*Not implemented g_shell_parse_argv argument type Arg_info.In or Arg_info.Out not handled*)
val shell_quote:
string -> string
val shell_unquote:
string -> Error.t structure ptr ptr option -> string
val slice_alloc:
Unsigned.uint64 -> unit ptr option
val slice_alloc0:
Unsigned.uint64 -> unit ptr option
val slice_copy:
Unsigned.uint64 -> unit ptr option -> unit ptr option
val slice_free1:
Unsigned.uint64 -> unit ptr option -> unit
val slice_free_chain_with_offset:
Unsigned.uint64 -> unit ptr option -> Unsigned.uint64 -> unit
val slice_get_config:
Slice_config.t -> int64
val slice_get_config_state:
Slice_config.t -> int64 -> Unsigned.uint32 ptr -> int64 ptr
val slice_set_config:
Slice_config.t -> int64 -> unit
val source_remove:
Unsigned.uint32 -> bool
val source_remove_by_funcs_user_data:
Source_funcs.t structure ptr -> unit ptr option -> bool
val source_remove_by_user_data:
unit ptr option -> bool
val source_set_name_by_id:
Unsigned.uint32 -> string -> unit
val spaced_primes_closest:
Unsigned.uint32 -> Unsigned.uint32
(*Not implemented g_spawn_async argument type C Array type for Types.Array tag not handled*)
(*Not implemented g_spawn_async_with_pipes argument type C Array type for Types.Array tag not handled*)
val spawn_check_exit_status:
int32 -> Error.t structure ptr ptr option -> bool
val spawn_close_pid:
int32 -> unit
val spawn_command_line_async:
string -> Error.t structure ptr ptr option -> bool
(*Not implemented g_spawn_command_line_sync argument type Arg_info.In or Arg_info.Out not handled*)
val spawn_error_quark:
unit -> Unsigned.uint32
val spawn_exit_error_quark:
unit -> Unsigned.uint32
(*Not implemented g_spawn_sync argument type C Array type for Types.Array tag not handled*)
val stpcpy:
string -> string -> string
val str_equal:
unit ptr -> unit ptr -> bool
val str_has_prefix:
string -> string -> bool
val str_has_suffix:
string -> string -> bool
val str_hash:
unit ptr -> Unsigned.uint32
val str_is_ascii:
string -> bool
val str_match_string:
string -> string -> bool -> bool
val str_to_ascii:
string -> string option -> string
(*Not implemented g_str_tokenize_and_fold argument type Arg_info.In or Arg_info.Out not handled*)
val strcanon:
string -> string -> int -> string
(*DEPRECATED : strcasecmp*)
val strchomp:
string -> string
val strchug:
string -> string
val strcmp0:
string option -> string option -> int32
val strcompress:
string -> string
val strdelimit:
string -> string option -> int -> string
(*DEPRECATED : strdown*)
val strdup:
string option -> string
val strerror:
int32 -> string
val strescape:
string -> string option -> string
val strfreev:
string option -> unit
val string_new:
string option -> String.t structure ptr
val string_new_len:
string -> int64 -> String.t structure ptr
val string_sized_new:
Unsigned.uint64 -> String.t structure ptr
val strip_context:
string -> string -> string
val strjoinv:
string option -> string -> string
val strlcat:
string -> string -> Unsigned.uint64 -> Unsigned.uint64
val strlcpy:
string -> string -> Unsigned.uint64 -> Unsigned.uint64
(*DEPRECATED : strncasecmp*)
val strndup:
string -> Unsigned.uint64 -> string
val strnfill:
Unsigned.uint64 -> int -> string
val strreverse:
string -> string
val strrstr:
string -> string -> string
val strrstr_len:
string -> int64 -> string -> string
val strsignal:
int32 -> string
val strstr_len:
string -> int64 -> string -> string
(*Not implemented g_strtod argument type Arg_info.In or Arg_info.Out not handled*)
(*DEPRECATED : strup*)
val strv_contains:
string -> string -> bool
(*Not implemented g_strv_get_type return type gType not handled*)
val strv_length:
string -> Unsigned.uint32
(*Not implemented g_test_add_data_func argument type callback not handled*)
(*Not implemented g_test_add_data_func_full argument type callback not handled*)
(*Not implemented g_test_add_func argument type callback not handled*)
val test_assert_expected_messages_internal:
string -> string -> int32 -> string -> unit
val test_bug:
string -> unit
val test_bug_base:
string -> unit
val test_expect_message:
string option -> Log_level_flags.t_list -> string -> unit
val test_fail:
unit -> unit
val test_failed:
unit -> bool
val test_get_dir:
Test_file_type.t -> string
val test_incomplete:
string option -> unit
val test_log_type_name:
Test_log_type.t -> string
(*Not implemented g_test_queue_destroy argument type callback not handled*)
val test_queue_free:
unit ptr option -> unit
val test_rand_double:
unit -> float
val test_rand_double_range:
float -> float -> float
val test_rand_int:
unit -> int32
val test_rand_int_range:
int32 -> int32 -> int32
val test_run:
unit -> int32
val test_run_suite:
Test_suite.t structure ptr -> int32
val test_set_nonfatal_assertions:
unit -> unit
val test_skip:
string option -> unit
val test_subprocess:
unit -> bool
val test_timer_elapsed:
unit -> float
val test_timer_last:
unit -> float
val test_timer_start:
unit -> unit
val test_trap_assertions:
string -> string -> int32 -> string -> Unsigned.uint64 -> string -> unit
(*DEPRECATED : test_trap_fork*)
val test_trap_has_passed:
unit -> bool
val test_trap_reached_timeout:
unit -> bool
val test_trap_subprocess:
string option -> Unsigned.uint64 -> Test_subprocess_flags.t_list -> unit
val thread_error_quark:
unit -> Unsigned.uint32
val thread_exit:
unit ptr option -> unit
val thread_pool_get_max_idle_time:
unit -> Unsigned.uint32
val thread_pool_get_max_unused_threads:
unit -> int32
val thread_pool_get_num_unused_threads:
unit -> Unsigned.uint32
val thread_pool_set_max_idle_time:
Unsigned.uint32 -> unit
val thread_pool_set_max_unused_threads:
int32 -> unit
val thread_pool_stop_unused_threads:
unit -> unit
val thread_self:
unit -> Thread.t structure ptr
val thread_yield:
unit -> unit
(*Not implemented g_time_val_from_iso8601 argument type Arg_info.In or Arg_info.Out not handled*)
(*Not implemented g_timeout_add_full argument type callback not handled*)
(*Not implemented g_timeout_add_seconds_full argument type callback not handled*)
val timeout_source_new:
Unsigned.uint32 -> Source.t structure ptr
val timeout_source_new_seconds:
Unsigned.uint32 -> Source.t structure ptr
(*DEPRECATED : trash_stack_height*)
(*DEPRECATED : trash_stack_peek*)
(*DEPRECATED : trash_stack_pop*)
(*DEPRECATED : trash_stack_push*)
val try_malloc:
Unsigned.uint64 -> unit ptr option
val try_malloc0:
Unsigned.uint64 -> unit ptr option
val try_malloc0_n:
Unsigned.uint64 -> Unsigned.uint64 -> unit ptr option
val try_malloc_n:
Unsigned.uint64 -> Unsigned.uint64 -> unit ptr option
val try_realloc:
unit ptr option -> Unsigned.uint64 -> unit ptr option
val try_realloc_n:
unit ptr option -> Unsigned.uint64 -> Unsigned.uint64 -> unit ptr option
(*Not implemented g_ucs4_to_utf16 argument type unichar not handled*)
(*Not implemented g_ucs4_to_utf8 argument type unichar not handled*)
(*Not implemented g_unichar_break_type argument type unichar not handled*)
(*Not implemented g_unichar_combining_class argument type unichar not handled*)
(*Not implemented g_unichar_compose argument type unichar not handled*)
(*Not implemented g_unichar_decompose argument type unichar not handled*)
(*Not implemented g_unichar_digit_value argument type unichar not handled*)
(*Not implemented g_unichar_fully_decompose argument type unichar not handled*)
(*Not implemented g_unichar_get_mirror_char argument type unichar not handled*)
(*Not implemented g_unichar_get_script argument type unichar not handled*)
(*Not implemented g_unichar_isalnum argument type unichar not handled*)
(*Not implemented g_unichar_isalpha argument type unichar not handled*)
(*Not implemented g_unichar_iscntrl argument type unichar not handled*)
(*Not implemented g_unichar_isdefined argument type unichar not handled*)
(*Not implemented g_unichar_isdigit argument type unichar not handled*)
(*Not implemented g_unichar_isgraph argument type unichar not handled*)
(*Not implemented g_unichar_islower argument type unichar not handled*)
(*Not implemented g_unichar_ismark argument type unichar not handled*)
(*Not implemented g_unichar_isprint argument type unichar not handled*)
(*Not implemented g_unichar_ispunct argument type unichar not handled*)
(*Not implemented g_unichar_isspace argument type unichar not handled*)
(*Not implemented g_unichar_istitle argument type unichar not handled*)
(*Not implemented g_unichar_isupper argument type unichar not handled*)
(*Not implemented g_unichar_iswide argument type unichar not handled*)
(*Not implemented g_unichar_iswide_cjk argument type unichar not handled*)
(*Not implemented g_unichar_isxdigit argument type unichar not handled*)
(*Not implemented g_unichar_iszerowidth argument type unichar not handled*)
(*Not implemented g_unichar_to_utf8 argument type unichar not handled*)
(*Not implemented g_unichar_tolower argument type unichar not handled*)
(*Not implemented g_unichar_totitle argument type unichar not handled*)
(*Not implemented g_unichar_toupper argument type unichar not handled*)
(*Not implemented g_unichar_type argument type unichar not handled*)
(*Not implemented g_unichar_validate argument type unichar not handled*)
(*Not implemented g_unichar_xdigit_value argument type unichar not handled*)
(*DEPRECATED : unicode_canonical_decomposition*)
(*Not implemented g_unicode_canonical_ordering argument type unichar not handled*)
val unicode_script_from_iso15924:
Unsigned.uint32 -> Unicode_script.t
val unicode_script_to_iso15924:
Unicode_script.t -> Unsigned.uint32
val unix_error_quark:
unit -> Unsigned.uint32
(*Not implemented g_unix_fd_add_full argument type callback not handled*)
val unix_fd_source_new:
int32 -> IOCondition.t_list -> Source.t structure ptr
val unix_open_pipe:
int32 ptr -> int32 -> Error.t structure ptr ptr option -> bool
val unix_set_fd_nonblocking:
int32 -> bool -> Error.t structure ptr ptr option -> bool
(*Not implemented g_unix_signal_add_full argument type callback not handled*)
val unix_signal_source_new:
int32 -> Source.t structure ptr
val unlink:
string -> int32
val unsetenv:
string -> unit
val uri_escape_string:
string -> string option -> bool -> string
(*Not implemented g_uri_list_extract_uris return type C Array type for Types.Array tag not handled*)
val uri_parse_scheme:
string -> string
val uri_unescape_segment:
string option -> string option -> string option -> string
val uri_unescape_string:
string -> string option -> string
val usleep:
Unsigned.uint64 -> unit
(*Not implemented g_utf16_to_ucs4 argument type Arg_info.In or Arg_info.Out not handled*)
(*Not implemented g_utf16_to_utf8 argument type Arg_info.In or Arg_info.Out not handled*)
val utf8_casefold:
string -> int64 -> string
val utf8_collate:
string -> string -> int32
val utf8_collate_key:
string -> int64 -> string
val utf8_collate_key_for_filename:
string -> int64 -> string
val utf8_find_next_char:
string -> string option -> string
val utf8_find_prev_char:
string -> string -> string
(*Not implemented g_utf8_get_char return type unichar not handled*)
(*Not implemented g_utf8_get_char_validated return type unichar not handled*)
val utf8_make_valid:
string -> int64 -> string
val utf8_normalize:
string -> int64 -> Normalize_mode.t -> string
val utf8_offset_to_pointer:
string -> int64 -> string
val utf8_pointer_to_offset:
string -> string -> int64
val utf8_prev_char:
string -> string
(*Not implemented g_utf8_strchr argument type unichar not handled*)
val utf8_strdown:
string -> int64 -> string
val utf8_strlen:
string -> int64 -> int64
val utf8_strncpy:
string -> string -> Unsigned.uint64 -> string
(*Not implemented g_utf8_strrchr argument type unichar not handled*)
val utf8_strreverse:
string -> int64 -> string
val utf8_strup:
string -> int64 -> string
val utf8_substring:
string -> int64 -> int64 -> string
(*Not implemented g_utf8_to_ucs4 argument type Arg_info.In or Arg_info.Out not handled*)
(*Not implemented g_utf8_to_ucs4_fast argument type Arg_info.In or Arg_info.Out not handled*)
(*Not implemented g_utf8_to_utf16 argument type Arg_info.In or Arg_info.Out not handled*)
(*Not implemented g_utf8_validate argument type C Array type for Types.Array tag not handled*)
val uuid_string_is_valid:
string -> bool
val uuid_string_random:
unit -> string
(*Not implemented g_variant_get_gtype return type gType not handled*)
val variant_is_object_path:
string -> bool
val variant_is_signature:
string -> bool
val variant_parse:
Variant_type.t structure ptr option -> string -> string option -> string option -> Error.t structure ptr ptr option -> Variant.t structure ptr
val variant_parse_error_print_context:
Error.t structure ptr -> string -> string
val variant_parse_error_quark:
unit -> Unsigned.uint32
(*DEPRECATED : variant_parser_get_error_quark*)
val variant_type_checked_:
string -> Variant_type.t structure ptr
val variant_type_string_is_valid:
string -> bool
(*Not implemented g_variant_type_string_scan argument type Arg_info.In or Arg_info.Out not handled*)
