open Ctypes

val _ANALYZER_ANALYZING : int32

val _ASCII_DTOSTR_BUF_SIZE : int32

val _BIG_ENDIAN : int32

val _CSET_A_2_Z : string

val _CSET_DIGITS : string

val _CSET_a_2_z : string

val _DATALIST_FLAGS_MASK : int32

val _DATE_BAD_DAY : int32

val _DATE_BAD_JULIAN : int32

val _DATE_BAD_YEAR : int32

val _DIR_SEPARATOR : int32

val _DIR_SEPARATOR_S : string

val _E : float

val _GINT16_FORMAT : string

val _GINT16_MODIFIER : string

val _GINT32_FORMAT : string

val _GINT32_MODIFIER : string

val _GINT64_FORMAT : string

val _GINT64_MODIFIER : string

val _GINTPTR_FORMAT : string

val _GINTPTR_MODIFIER : string

(*  !!! DEPRECATED : GNUC_FUNCTION . *)
(*  !!! DEPRECATED : GNUC_PRETTY_FUNCTION . *)
val _GSIZE_FORMAT : string

val _GSIZE_MODIFIER : string

val _GSSIZE_FORMAT : string

val _GSSIZE_MODIFIER : string

val _GUINT16_FORMAT : string

val _GUINT32_FORMAT : string

val _GUINT64_FORMAT : string

val _GUINTPTR_FORMAT : string

val _HAVE_GINT64 : int32

val _HAVE_GNUC_VARARGS : int32

val _HAVE_GNUC_VISIBILITY : int32

val _HAVE_GROWING_STACK : int32

val _HAVE_ISO_VARARGS : int32

val _HOOK_FLAG_USER_SHIFT : int32

val _IEEE754_DOUBLE_BIAS : int32

val _IEEE754_FLOAT_BIAS : int32

val _KEY_FILE_DESKTOP_GROUP : string

val _KEY_FILE_DESKTOP_KEY_ACTIONS : string

val _KEY_FILE_DESKTOP_KEY_CATEGORIES : string

val _KEY_FILE_DESKTOP_KEY_COMMENT : string

val _KEY_FILE_DESKTOP_KEY_DBUS_ACTIVATABLE : string

val _KEY_FILE_DESKTOP_KEY_EXEC : string

val _KEY_FILE_DESKTOP_KEY_GENERIC_NAME : string

val _KEY_FILE_DESKTOP_KEY_HIDDEN : string

val _KEY_FILE_DESKTOP_KEY_ICON : string

val _KEY_FILE_DESKTOP_KEY_MIME_TYPE : string

val _KEY_FILE_DESKTOP_KEY_NAME : string

val _KEY_FILE_DESKTOP_KEY_NOT_SHOW_IN : string

val _KEY_FILE_DESKTOP_KEY_NO_DISPLAY : string

val _KEY_FILE_DESKTOP_KEY_ONLY_SHOW_IN : string

val _KEY_FILE_DESKTOP_KEY_PATH : string

val _KEY_FILE_DESKTOP_KEY_STARTUP_NOTIFY : string

val _KEY_FILE_DESKTOP_KEY_STARTUP_WM_CLASS : string

val _KEY_FILE_DESKTOP_KEY_TERMINAL : string

val _KEY_FILE_DESKTOP_KEY_TRY_EXEC : string

val _KEY_FILE_DESKTOP_KEY_TYPE : string

val _KEY_FILE_DESKTOP_KEY_URL : string

val _KEY_FILE_DESKTOP_KEY_VERSION : string

val _KEY_FILE_DESKTOP_TYPE_APPLICATION : string

val _KEY_FILE_DESKTOP_TYPE_DIRECTORY : string

val _KEY_FILE_DESKTOP_TYPE_LINK : string

val _LITTLE_ENDIAN : int32

val _LN10 : float

val _LN2 : float

val _LOG_2_BASE_10 : float

val _LOG_DOMAIN : int

val _LOG_FATAL_MASK : int32

val _LOG_LEVEL_USER_SHIFT : int32

val _MAJOR_VERSION : int32

val _MAXINT16 : int

val _MAXINT32 : int32

val _MAXINT64 : int64

val _MAXINT8 : int

val _MAXUINT16 : Unsigned.uint16

val _MAXUINT32 : Unsigned.uint32

val _MAXUINT64 : Unsigned.uint64

val _MAXUINT8 : Unsigned.uint8

val _MICRO_VERSION : int32

val _MININT16 : int

val _MININT32 : int32

val _MININT64 : int64

val _MININT8 : int

val _MINOR_VERSION : int32

val _MODULE_SUFFIX : string

val _OPTION_REMAINING : string

val _PDP_ENDIAN : int32

val _PI : float

val _PID_FORMAT : string

val _PI_2 : float

val _PI_4 : float

val _POLLFD_FORMAT : string

val _PRIORITY_DEFAULT : int32

val _PRIORITY_DEFAULT_IDLE : int32

val _PRIORITY_HIGH : int32

val _PRIORITY_HIGH_IDLE : int32

val _PRIORITY_LOW : int32

val _SEARCHPATH_SEPARATOR : int32

val _SEARCHPATH_SEPARATOR_S : string

val _SIZEOF_LONG : int32

val _SIZEOF_SIZE_T : int32

val _SIZEOF_SSIZE_T : int32

val _SIZEOF_VOID_P : int32

val _SOURCE_CONTINUE : bool

val _SOURCE_REMOVE : bool

val _SQRT2 : float

val _STR_DELIMITERS : string

val _SYSDEF_AF_INET : int32

val _SYSDEF_AF_INET6 : int32

val _SYSDEF_AF_UNIX : int32

val _SYSDEF_MSG_DONTROUTE : int32

val _SYSDEF_MSG_OOB : int32

val _SYSDEF_MSG_PEEK : int32

val _TIME_SPAN_DAY : int64

val _TIME_SPAN_HOUR : int64

val _TIME_SPAN_MILLISECOND : int64

val _TIME_SPAN_MINUTE : int64

val _TIME_SPAN_SECOND : int64

(*  !!! DEPRECATED : TestTrapFlags . *)
(*  !!! DEPRECATED : TrashStack . *)
val _UNICHAR_MAX_DECOMPOSITION_LENGTH : int32

val _URI_RESERVED_CHARS_GENERIC_DELIMITERS : string

val _URI_RESERVED_CHARS_SUBCOMPONENT_DELIMITERS : string

val _USEC_PER_SEC : int32

val _VA_COPY_AS_ARRAY : int32

val _VERSION_MIN_REQUIRED : int32

val _WIN32_MSG_HANDLE : int32

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

(* Not implemented g_ascii_strtod argument types not handled . *)

(* Not implemented g_ascii_strtoll argument types not handled . *)

(* Not implemented g_ascii_strtoull argument types not handled . *)

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

(*  !!! DEPRECATED : atexit . *)
val atomic_int_add:
int32 ptr -> int32 -> int32

val atomic_int_and:
Unsigned.uint32 ptr -> Unsigned.uint32 -> Unsigned.uint32

val atomic_int_compare_and_exchange:
int32 ptr -> int32 -> int32 -> bool

val atomic_int_dec_and_test:
int32 ptr -> bool

(*  !!! DEPRECATED : atomic_int_exchange_and_add . *)
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

(* Not implemented g_base64_decode argument types not handled . *)

(* Not implemented g_base64_decode_inplace argument types not handled . *)

(* Not implemented g_base64_decode_step argument types not handled . *)

(* Not implemented g_base64_encode argument types not handled . *)

(* Not implemented g_base64_encode_close argument types not handled . *)

(* Not implemented g_base64_encode_step argument types not handled . *)

(*  !!! DEPRECATED : basename . *)
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

(* Not implemented g_build_filenamev argument types not handled . *)

(* Not implemented g_build_pathv argument types not handled . *)

val byte_array_free:
Byte_array.t structure ptr -> bool -> Unsigned.uint8 ptr

val byte_array_free_to_bytes:
Byte_array.t structure ptr -> Bytes.t structure ptr

val byte_array_new:
unit -> Byte_array.t structure ptr

(* Not implemented g_byte_array_new_take argument types not handled . *)

val byte_array_unref:
Byte_array.t structure ptr -> unit

val chdir:
string -> int32

val check_version:
Unsigned.uint32 -> Unsigned.uint32 -> Unsigned.uint32 -> string

val checksum_type_get_length:
checksum_type -> int64

(* Not implemented g_child_watch_add_full argument types not handled . *)

val child_watch_source_new:
int32 -> Source.t structure ptr

val clear_error:
unit -> Error.t structure ptr ptr option -> unit

val close:
int32 -> Error.t structure ptr ptr option -> bool

val compute_checksum_for_bytes:
checksum_type -> Bytes.t structure ptr -> string

(* Not implemented g_compute_checksum_for_data argument types not handled . *)

val compute_checksum_for_string:
checksum_type -> string -> int64 -> string

val compute_hmac_for_bytes:
checksum_type -> Bytes.t structure ptr -> Bytes.t structure ptr -> string

(* Not implemented g_compute_hmac_for_data argument types not handled . *)

(* Not implemented g_compute_hmac_for_string argument types not handled . *)

(* Not implemented g_convert argument types not handled . *)

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

(* Not implemented g_datalist_id_replace_data argument types not handled . *)

(* Not implemented g_datalist_id_set_data_full argument types not handled . *)

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

(* Not implemented g_dataset_id_set_data_full argument types not handled . *)

val date_get_days_in_month:
date_month -> Unsigned.uint16 -> Unsigned.uint8

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
Unsigned.uint8 -> date_month -> Unsigned.uint16 -> bool

val date_valid_julian:
Unsigned.uint32 -> bool

val date_valid_month:
date_month -> bool

val date_valid_weekday:
date_weekday -> bool

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

(* Not implemented g_environ_getenv argument types not handled . *)

(* Not implemented g_environ_setenv argument types not handled . *)

(* Not implemented g_environ_unsetenv argument types not handled . *)

val file_error_from_errno:
int32 -> file_error

val file_error_quark:
unit -> Unsigned.uint32

(* Not implemented g_file_get_contents argument types not handled . *)

(* Not implemented g_file_open_tmp argument types not handled . *)

val file_read_link:
string -> Error.t structure ptr ptr option -> string

(* Not implemented g_file_set_contents argument types not handled . *)

val file_test:
string -> file_test_list -> bool

val filename_display_basename:
string -> string

val filename_display_name:
string -> string

(* Not implemented g_filename_from_uri argument types not handled . *)

(* Not implemented g_filename_from_utf8 argument types not handled . *)

val filename_to_uri:
string -> string option -> Error.t structure ptr ptr option -> string

(* Not implemented g_filename_to_utf8 argument types not handled . *)

val find_program_in_path:
string -> string

val format_size:
Unsigned.uint64 -> string

(*  !!! DEPRECATED : format_size_for_display . *)
val format_size_full:
Unsigned.uint64 -> format_size_flags_list -> string

val free:
unit ptr option -> unit

val get_application_name:
unit -> string

(* Not implemented g_get_charset argument types not handled . *)

val get_codeset:
unit -> string

val get_current_dir:
unit -> string

val get_current_time:
Time_val.t structure ptr -> unit

(* Not implemented g_get_environ return type not handled . *)

val get_filename_charsets:
string -> bool

val get_home_dir:
unit -> string

val get_host_name:
unit -> string

(* Not implemented g_get_language_names return type not handled . *)

(* Not implemented g_get_locale_variants return type not handled . *)

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

(* Not implemented g_get_system_config_dirs return type not handled . *)

(* Not implemented g_get_system_data_dirs return type not handled . *)

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
user_directory -> string

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

(* Not implemented g_hash_table_lookup_extended argument types not handled . *)

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

val hook_destroy:
Hook_list.t structure ptr -> Unsigned.uint64 -> bool

val hook_destroy_link:
Hook_list.t structure ptr -> Hook.t structure ptr -> unit

val hook_free:
Hook_list.t structure ptr -> Hook.t structure ptr -> unit

val hook_insert_before:
Hook_list.t structure ptr -> Hook.t structure ptr option -> Hook.t structure ptr -> unit

val hook_prepend:
Hook_list.t structure ptr -> Hook.t structure ptr -> unit

val hook_unref:
Hook_list.t structure ptr -> Hook.t structure ptr -> unit

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

(* Not implemented g_idle_add_full argument types not handled . *)

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

(* Not implemented g_io_add_watch_full argument types not handled . *)

val io_channel_error_from_errno:
int32 -> iochannel_error

val io_channel_error_quark:
unit -> Unsigned.uint32

val io_create_watch:
IOChannel.t structure ptr -> iocondition_list -> Source.t structure ptr

val key_file_error_quark:
unit -> Unsigned.uint32

(* Not implemented g_listenv return type not handled . *)

(* Not implemented g_locale_from_utf8 argument types not handled . *)

(* Not implemented g_locale_to_utf8 argument types not handled . *)

val log_default_handler:
string option -> log_level_flags_list -> string option -> unit ptr option -> unit

val log_remove_handler:
string -> Unsigned.uint32 -> unit

val log_set_always_fatal:
log_level_flags_list -> log_level_flags_list

val log_set_fatal_mask:
string -> log_level_flags_list -> log_level_flags_list

(* Not implemented g_log_set_handler_full argument types not handled . *)

(* Not implemented g_log_set_writer_func argument types not handled . *)

(* Not implemented g_log_structured_array argument types not handled . *)

val log_variant:
string option -> log_level_flags_list -> Variant.t structure ptr -> unit

(* Not implemented g_log_writer_default argument types not handled . *)

(* Not implemented g_log_writer_format_fields argument types not handled . *)

val log_writer_is_journald:
int32 -> bool

(* Not implemented g_log_writer_journald argument types not handled . *)

(* Not implemented g_log_writer_standard_streams argument types not handled . *)

val log_writer_supports_color:
int32 -> bool

val main_context_default:
unit -> Main_context.t structure ptr

val main_context_get_thread_default:
unit -> Main_context.t structure ptr

val main_context_ref_thread_default:
unit -> Main_context.t structure ptr

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

(*  !!! DEPRECATED : mem_is_system_malloc . *)
(*  !!! DEPRECATED : mem_profile . *)
(*  !!! DEPRECATED : mem_set_vtable . *)
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

(* Not implemented g_parse_debug_string argument types not handled . *)

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

(* Not implemented g_propagate_error argument types not handled . *)

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

(* Not implemented g_regex_check_replacement argument types not handled . *)

val regex_error_quark:
unit -> Unsigned.uint32

val regex_escape_nul:
string -> int32 -> string

(* Not implemented g_regex_escape_string argument types not handled . *)

val regex_match_simple:
string -> string -> regex_compile_flags_list -> regex_match_flags_list -> bool

(* Not implemented g_regex_split_simple return type not handled . *)

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

(* Not implemented g_set_error_literal argument types not handled . *)

val set_prgname:
string -> unit

val setenv:
string -> string -> bool -> bool

val shell_error_quark:
unit -> Unsigned.uint32

(* Not implemented g_shell_parse_argv argument types not handled . *)

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
slice_config -> int64

val slice_get_config_state:
slice_config -> int64 -> Unsigned.uint32 ptr -> int64 ptr

val slice_set_config:
slice_config -> int64 -> unit

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

(* Not implemented g_spawn_async argument types not handled . *)

(* Not implemented g_spawn_async_with_pipes argument types not handled . *)

val spawn_check_exit_status:
int32 -> Error.t structure ptr ptr option -> bool

val spawn_close_pid:
int32 -> unit

val spawn_command_line_async:
string -> Error.t structure ptr ptr option -> bool

(* Not implemented g_spawn_command_line_sync argument types not handled . *)

val spawn_error_quark:
unit -> Unsigned.uint32

val spawn_exit_error_quark:
unit -> Unsigned.uint32

(* Not implemented g_spawn_sync argument types not handled . *)

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

(* Not implemented g_str_tokenize_and_fold argument types not handled . *)

val strcanon:
string -> string -> int -> string

(*  !!! DEPRECATED : strcasecmp . *)
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

(*  !!! DEPRECATED : strdown . *)
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

(*  !!! DEPRECATED : strncasecmp . *)
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

(* Not implemented g_strtod argument types not handled . *)

(*  !!! DEPRECATED : strup . *)
val strv_contains:
string -> string -> bool

(* Not implemented g_strv_get_type return type not handled . *)

val strv_length:
string -> Unsigned.uint32

(* Not implemented g_test_add_data_func argument types not handled . *)

(* Not implemented g_test_add_data_func_full argument types not handled . *)

(* Not implemented g_test_add_func argument types not handled . *)

val test_assert_expected_messages_internal:
string -> string -> int32 -> string -> unit

val test_bug:
string -> unit

val test_bug_base:
string -> unit

val test_expect_message:
string option -> log_level_flags_list -> string -> unit

val test_fail:
unit -> unit

val test_failed:
unit -> bool

val test_get_dir:
test_file_type -> string

val test_incomplete:
string option -> unit

val test_log_type_name:
test_log_type -> string

(* Not implemented g_test_queue_destroy argument types not handled . *)

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

(*  !!! DEPRECATED : test_trap_fork . *)
val test_trap_has_passed:
unit -> bool

val test_trap_reached_timeout:
unit -> bool

val test_trap_subprocess:
string option -> Unsigned.uint64 -> test_subprocess_flags_list -> unit

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

(* Not implemented g_time_val_from_iso8601 argument types not handled . *)

(* Not implemented g_timeout_add_full argument types not handled . *)

(* Not implemented g_timeout_add_seconds_full argument types not handled . *)

val timeout_source_new:
Unsigned.uint32 -> Source.t structure ptr

val timeout_source_new_seconds:
Unsigned.uint32 -> Source.t structure ptr

(*  !!! DEPRECATED : trash_stack_height . *)
(*  !!! DEPRECATED : trash_stack_peek . *)
(*  !!! DEPRECATED : trash_stack_pop . *)
(*  !!! DEPRECATED : trash_stack_push . *)
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

(* Not implemented g_ucs4_to_utf16 argument types not handled . *)

(* Not implemented g_ucs4_to_utf8 argument types not handled . *)

(* Not implemented g_unichar_break_type argument types not handled . *)

(* Not implemented g_unichar_combining_class argument types not handled . *)

(* Not implemented g_unichar_compose argument types not handled . *)

(* Not implemented g_unichar_decompose argument types not handled . *)

(* Not implemented g_unichar_digit_value argument types not handled . *)

(* Not implemented g_unichar_fully_decompose argument types not handled . *)

(* Not implemented g_unichar_get_mirror_char argument types not handled . *)

(* Not implemented g_unichar_get_script argument types not handled . *)

(* Not implemented g_unichar_isalnum argument types not handled . *)

(* Not implemented g_unichar_isalpha argument types not handled . *)

(* Not implemented g_unichar_iscntrl argument types not handled . *)

(* Not implemented g_unichar_isdefined argument types not handled . *)

(* Not implemented g_unichar_isdigit argument types not handled . *)

(* Not implemented g_unichar_isgraph argument types not handled . *)

(* Not implemented g_unichar_islower argument types not handled . *)

(* Not implemented g_unichar_ismark argument types not handled . *)

(* Not implemented g_unichar_isprint argument types not handled . *)

(* Not implemented g_unichar_ispunct argument types not handled . *)

(* Not implemented g_unichar_isspace argument types not handled . *)

(* Not implemented g_unichar_istitle argument types not handled . *)

(* Not implemented g_unichar_isupper argument types not handled . *)

(* Not implemented g_unichar_iswide argument types not handled . *)

(* Not implemented g_unichar_iswide_cjk argument types not handled . *)

(* Not implemented g_unichar_isxdigit argument types not handled . *)

(* Not implemented g_unichar_iszerowidth argument types not handled . *)

(* Not implemented g_unichar_to_utf8 argument types not handled . *)

(* Not implemented g_unichar_tolower argument types not handled . *)

(* Not implemented g_unichar_totitle argument types not handled . *)

(* Not implemented g_unichar_toupper argument types not handled . *)

(* Not implemented g_unichar_type argument types not handled . *)

(* Not implemented g_unichar_validate argument types not handled . *)

(* Not implemented g_unichar_xdigit_value argument types not handled . *)

(*  !!! DEPRECATED : unicode_canonical_decomposition . *)
(* Not implemented g_unicode_canonical_ordering argument types not handled . *)

val unicode_script_from_iso15924:
Unsigned.uint32 -> unicode_script

val unicode_script_to_iso15924:
unicode_script -> Unsigned.uint32

val unix_error_quark:
unit -> Unsigned.uint32

(* Not implemented g_unix_fd_add_full argument types not handled . *)

val unix_fd_source_new:
int32 -> iocondition_list -> Source.t structure ptr

val unix_open_pipe:
int32 ptr -> int32 -> Error.t structure ptr ptr option -> bool

val unix_set_fd_nonblocking:
int32 -> bool -> Error.t structure ptr ptr option -> bool

(* Not implemented g_unix_signal_add_full argument types not handled . *)

val unix_signal_source_new:
int32 -> Source.t structure ptr

val unlink:
string -> int32

val unsetenv:
string -> unit

val uri_escape_string:
string -> string option -> bool -> string

(* Not implemented g_uri_list_extract_uris return type not handled . *)

val uri_parse_scheme:
string -> string

val uri_unescape_segment:
string option -> string option -> string option -> string

val uri_unescape_string:
string -> string option -> string

val usleep:
Unsigned.uint64 -> unit

(* Not implemented g_utf16_to_ucs4 argument types not handled . *)

(* Not implemented g_utf16_to_utf8 argument types not handled . *)

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

(* Not implemented g_utf8_get_char return type not handled . *)

(* Not implemented g_utf8_get_char_validated return type not handled . *)

val utf8_make_valid:
string -> int64 -> string

val utf8_normalize:
string -> int64 -> normalize_mode -> string

val utf8_offset_to_pointer:
string -> int64 -> string

val utf8_pointer_to_offset:
string -> string -> int64

val utf8_prev_char:
string -> string

(* Not implemented g_utf8_strchr argument types not handled . *)

val utf8_strdown:
string -> int64 -> string

val utf8_strlen:
string -> int64 -> int64

val utf8_strncpy:
string -> string -> Unsigned.uint64 -> string

(* Not implemented g_utf8_strrchr argument types not handled . *)

val utf8_strreverse:
string -> int64 -> string

val utf8_strup:
string -> int64 -> string

val utf8_substring:
string -> int64 -> int64 -> string

(* Not implemented g_utf8_to_ucs4 argument types not handled . *)

(* Not implemented g_utf8_to_ucs4_fast argument types not handled . *)

(* Not implemented g_utf8_to_utf16 argument types not handled . *)

(* Not implemented g_utf8_validate argument types not handled . *)

val uuid_string_is_valid:
string -> bool

val uuid_string_random:
unit -> string

(* Not implemented g_variant_get_gtype return type not handled . *)

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

(*  !!! DEPRECATED : variant_parser_get_error_quark . *)
val variant_type_checked_:
string -> Variant_type.t structure ptr

val variant_type_string_is_valid:
string -> bool

(* Not implemented g_variant_type_string_scan argument types not handled . *)

