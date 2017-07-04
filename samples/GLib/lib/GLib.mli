open Ctypes

val _ANALYZER_ANALYZING : int32

val _ASCII_DTOSTR_BUF_SIZE : int32

type asciitype = Alnum | Alpha | Cntrl | Digit | Graph | Lower | Print | Punct | Space | Upper | Xdigit
type asciitype_list = asciitype list
val asciitype_of_value:
Unsigned.uint32 -> asciitype
val asciitype_to_value:
asciitype -> Unsigned.uint32
val asciitype_list_of_value:
Unsigned.uint32 -> asciitype_list
val asciitype_list_to_value:
asciitype_list -> Unsigned.uint32
val asciitype_list : asciitype_list typ

val _BIG_ENDIAN : int32

type bookmarkfileerror = Invalid_uri | Invalid_value | App_not_registered | Uri_not_found | Read | Unknown_encoding | Write | File_not_found
val bookmarkfileerror_of_value:
Unsigned.uint32 -> bookmarkfileerror
val bookmarkfileerror_to_value:
bookmarkfileerror -> Unsigned.uint32
val bookmarkfileerror : bookmarkfileerror typ

val _CSET_A_2_Z : string

val _CSET_DIGITS : string

val _CSET_a_2_z : string

type checksumtype = Md5 | Sha1 | Sha256 | Sha512 | Sha384
val checksumtype_of_value:
Unsigned.uint32 -> checksumtype
val checksumtype_to_value:
checksumtype -> Unsigned.uint32
val checksumtype : checksumtype typ

type converterror = No_conversion | Illegal_sequence | Failed | Partial_input | Bad_uri | Not_absolute_path | No_memory
val converterror_of_value:
Unsigned.uint32 -> converterror
val converterror_to_value:
converterror -> Unsigned.uint32
val converterror : converterror typ

val _DATALIST_FLAGS_MASK : int32

val _DATE_BAD_DAY : int32

val _DATE_BAD_JULIAN : int32

val _DATE_BAD_YEAR : int32

val _DIR_SEPARATOR : int32

val _DIR_SEPARATOR_S : string

type datedmy = Day | Month | Year
val datedmy_of_value:
Unsigned.uint32 -> datedmy
val datedmy_to_value:
datedmy -> Unsigned.uint32
val datedmy : datedmy typ

type datemonth = Bad_month | January | February | March | April | May | June | July | August | September | October | November | December
val datemonth_of_value:
Unsigned.uint32 -> datemonth
val datemonth_to_value:
datemonth -> Unsigned.uint32
val datemonth : datemonth typ

type dateweekday = Bad_weekday | Monday | Tuesday | Wednesday | Thursday | Friday | Saturday | Sunday
val dateweekday_of_value:
Unsigned.uint32 -> dateweekday
val dateweekday_to_value:
dateweekday -> Unsigned.uint32
val dateweekday : dateweekday typ

val _E : float

type errortype = Unknown | Unexp_eof | Unexp_eof_in_string | Unexp_eof_in_comment | Non_digit_in_const | Digit_radix | Float_radix | Float_malformed
val errortype_of_value:
Unsigned.uint32 -> errortype
val errortype_to_value:
errortype -> Unsigned.uint32
val errortype : errortype typ

type fileerror = Exist | Isdir | Acces | Nametoolong | Noent | Notdir | Nxio | Nodev | Rofs | Txtbsy | Fault | Loop | Nospc | Nomem | Mfile | Nfile | Badf | Inval | Pipe | Again | Intr | Io | Perm | Nosys | Failed
val fileerror_of_value:
Unsigned.uint32 -> fileerror
val fileerror_to_value:
fileerror -> Unsigned.uint32
val fileerror : fileerror typ

type filetest = Is_regular | Is_symlink | Is_dir | Is_executable | Exists
type filetest_list = filetest list
val filetest_of_value:
Unsigned.uint32 -> filetest
val filetest_to_value:
filetest -> Unsigned.uint32
val filetest_list_of_value:
Unsigned.uint32 -> filetest_list
val filetest_list_to_value:
filetest_list -> Unsigned.uint32
val filetest_list : filetest_list typ

type formatsizeflags = Default | Long_format | Iec_units
type formatsizeflags_list = formatsizeflags list
val formatsizeflags_of_value:
Unsigned.uint32 -> formatsizeflags
val formatsizeflags_to_value:
formatsizeflags -> Unsigned.uint32
val formatsizeflags_list_of_value:
Unsigned.uint32 -> formatsizeflags_list
val formatsizeflags_list_to_value:
formatsizeflags_list -> Unsigned.uint32
val formatsizeflags_list : formatsizeflags_list typ

val _GINT16_FORMAT : string

val _GINT16_MODIFIER : string

val _GINT32_FORMAT : string

val _GINT32_MODIFIER : string

val _GINT64_FORMAT : string

val _GINT64_MODIFIER : string

val _GINTPTR_FORMAT : string

val _GINTPTR_MODIFIER : string

val _GNUC_FUNCTION : string

val _GNUC_PRETTY_FUNCTION : string

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

type hookflagmask = Active | In_call | Mask
type hookflagmask_list = hookflagmask list
val hookflagmask_of_value:
Unsigned.uint32 -> hookflagmask
val hookflagmask_to_value:
hookflagmask -> Unsigned.uint32
val hookflagmask_list_of_value:
Unsigned.uint32 -> hookflagmask_list
val hookflagmask_list_to_value:
hookflagmask_list -> Unsigned.uint32
val hookflagmask_list : hookflagmask_list typ

val _IEEE754_DOUBLE_BIAS : int32

val _IEEE754_FLOAT_BIAS : int32

type iochannelerror = Fbig | Inval | Io | Isdir | Nospc | Nxio | Overflow | Pipe | Failed
val iochannelerror_of_value:
Unsigned.uint32 -> iochannelerror
val iochannelerror_to_value:
iochannelerror -> Unsigned.uint32
val iochannelerror : iochannelerror typ

type iocondition = In | Out | Pri | Err | Hup | Nval
type iocondition_list = iocondition list
val iocondition_of_value:
Unsigned.uint32 -> iocondition
val iocondition_to_value:
iocondition -> Unsigned.uint32
val iocondition_list_of_value:
Unsigned.uint32 -> iocondition_list
val iocondition_list_to_value:
iocondition_list -> Unsigned.uint32
val iocondition_list : iocondition_list typ

type ioerror = None | Again | Inval | Unknown
val ioerror_of_value:
Unsigned.uint32 -> ioerror
val ioerror_to_value:
ioerror -> Unsigned.uint32
val ioerror : ioerror typ

type ioflags = Append | Nonblock | Is_readable | Is_writable | Is_writeable | Is_seekable | Mask | Get_mask | Set_mask
type ioflags_list = ioflags list
val ioflags_of_value:
Unsigned.uint32 -> ioflags
val ioflags_to_value:
ioflags -> Unsigned.uint32
val ioflags_list_of_value:
Unsigned.uint32 -> ioflags_list
val ioflags_list_to_value:
ioflags_list -> Unsigned.uint32
val ioflags_list : ioflags_list typ

type iostatus = Error | Normal | Eof | Again
val iostatus_of_value:
Unsigned.uint32 -> iostatus
val iostatus_to_value:
iostatus -> Unsigned.uint32
val iostatus : iostatus typ

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

type keyfileerror = Unknown_encoding | Parse | Not_found | Key_not_found | Group_not_found | Invalid_value
val keyfileerror_of_value:
Unsigned.uint32 -> keyfileerror
val keyfileerror_to_value:
keyfileerror -> Unsigned.uint32
val keyfileerror : keyfileerror typ

type keyfileflags = None | Keep_comments | Keep_translations
type keyfileflags_list = keyfileflags list
val keyfileflags_of_value:
Unsigned.uint32 -> keyfileflags
val keyfileflags_to_value:
keyfileflags -> Unsigned.uint32
val keyfileflags_list_of_value:
Unsigned.uint32 -> keyfileflags_list
val keyfileflags_list_to_value:
keyfileflags_list -> Unsigned.uint32
val keyfileflags_list : keyfileflags_list typ

val _LITTLE_ENDIAN : int32

val _LN10 : float

val _LN2 : float

val _LOG_2_BASE_10 : float

val _LOG_DOMAIN : int

val _LOG_FATAL_MASK : int32

val _LOG_LEVEL_USER_SHIFT : int32

type loglevelflags = Flag_recursion | Flag_fatal | Level_error | Level_critical | Level_warning | Level_message | Level_info | Level_debug | Level_mask
type loglevelflags_list = loglevelflags list
val loglevelflags_of_value:
int32 -> loglevelflags
val loglevelflags_to_value:
loglevelflags -> int32
val loglevelflags_list_of_value:
int32 -> loglevelflags_list
val loglevelflags_list_to_value:
loglevelflags_list -> int32
val loglevelflags_list : loglevelflags_list typ

type logwriteroutput = Handled | Unhandled
val logwriteroutput_of_value:
Unsigned.uint32 -> logwriteroutput
val logwriteroutput_to_value:
logwriteroutput -> Unsigned.uint32
val logwriteroutput : logwriteroutput typ

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

type markupcollecttype = Invalid | String | Strdup | Boolean | Tristate | Optional
type markupcollecttype_list = markupcollecttype list
val markupcollecttype_of_value:
Unsigned.uint32 -> markupcollecttype
val markupcollecttype_to_value:
markupcollecttype -> Unsigned.uint32
val markupcollecttype_list_of_value:
Unsigned.uint32 -> markupcollecttype_list
val markupcollecttype_list_to_value:
markupcollecttype_list -> Unsigned.uint32
val markupcollecttype_list : markupcollecttype_list typ

type markuperror = Bad_utf8 | Empty | Parse | Unknown_element | Unknown_attribute | Invalid_content | Missing_attribute
val markuperror_of_value:
Unsigned.uint32 -> markuperror
val markuperror_to_value:
markuperror -> Unsigned.uint32
val markuperror : markuperror typ

type markupparseflags = Do_not_use_this_unsupported_flag | Treat_cdata_as_text | Prefix_error_position | Ignore_qualified
type markupparseflags_list = markupparseflags list
val markupparseflags_of_value:
Unsigned.uint32 -> markupparseflags
val markupparseflags_to_value:
markupparseflags -> Unsigned.uint32
val markupparseflags_list_of_value:
Unsigned.uint32 -> markupparseflags_list
val markupparseflags_list_to_value:
markupparseflags_list -> Unsigned.uint32
val markupparseflags_list : markupparseflags_list typ

type normalizemode = Default | Nfd | Default_compose | Nfc | All | Nfkd | All_compose | Nfkc
val normalizemode_of_value:
Unsigned.uint32 -> normalizemode
val normalizemode_to_value:
normalizemode -> Unsigned.uint32
val normalizemode : normalizemode typ

val _OPTION_REMAINING : string

type oncestatus = Notcalled | Progress | Ready
val oncestatus_of_value:
Unsigned.uint32 -> oncestatus
val oncestatus_to_value:
oncestatus -> Unsigned.uint32
val oncestatus : oncestatus typ

type optionarg = None | String | Int | Callback | Filename | String_array | Filename_array | Double | Int64
val optionarg_of_value:
Unsigned.uint32 -> optionarg
val optionarg_to_value:
optionarg -> Unsigned.uint32
val optionarg : optionarg typ

type optionerror = Unknown_option | Bad_value | Failed
val optionerror_of_value:
Unsigned.uint32 -> optionerror
val optionerror_to_value:
optionerror -> Unsigned.uint32
val optionerror : optionerror typ

type optionflags = None | Hidden | In_main | Reverse | No_arg | Filename | Optional_arg | Noalias
type optionflags_list = optionflags list
val optionflags_of_value:
Unsigned.uint32 -> optionflags
val optionflags_to_value:
optionflags -> Unsigned.uint32
val optionflags_list_of_value:
Unsigned.uint32 -> optionflags_list
val optionflags_list_to_value:
optionflags_list -> Unsigned.uint32
val optionflags_list : optionflags_list typ

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

type regexcompileflags = Caseless | Multiline | Dotall | Extended | Anchored | Dollar_endonly | Ungreedy | Raw | No_auto_capture | Optimize | Firstline | Dupnames | Newline_cr | Newline_lf | Newline_crlf | Newline_anycrlf | Bsr_anycrlf | Javascript_compat
type regexcompileflags_list = regexcompileflags list
val regexcompileflags_of_value:
Unsigned.uint32 -> regexcompileflags
val regexcompileflags_to_value:
regexcompileflags -> Unsigned.uint32
val regexcompileflags_list_of_value:
Unsigned.uint32 -> regexcompileflags_list
val regexcompileflags_list_to_value:
regexcompileflags_list -> Unsigned.uint32
val regexcompileflags_list : regexcompileflags_list typ

type regexerror = Compile | Optimize | Replace | Match | Internal | Stray_backslash | Missing_control_char | Unrecognized_escape | Quantifiers_out_of_order | Quantifier_too_big | Unterminated_character_class | Invalid_escape_in_character_class | Range_out_of_order | Nothing_to_repeat | Unrecognized_character | Posix_named_class_outside_class | Unmatched_parenthesis | Inexistent_subpattern_reference | Unterminated_comment | Expression_too_large | Memory_error | Variable_length_lookbehind | Malformed_condition | Too_many_conditional_branches | Assertion_expected | Unknown_posix_class_name | Posix_collating_elements_not_supported | Hex_code_too_large | Invalid_condition | Single_byte_match_in_lookbehind | Infinite_loop | Missing_subpattern_name_terminator | Duplicate_subpattern_name | Malformed_property | Unknown_property | Subpattern_name_too_long | Too_many_subpatterns | Invalid_octal_value | Too_many_branches_in_define | Define_repetion | Inconsistent_newline_options | Missing_back_reference | Invalid_relative_reference | Backtracking_control_verb_argument_forbidden | Unknown_backtracking_control_verb | Number_too_big | Missing_subpattern_name | Missing_digit | Invalid_data_character | Extra_subpattern_name | Backtracking_control_verb_argument_required | Invalid_control_char | Missing_name | Not_supported_in_class | Too_many_forward_references | Name_too_long | Character_value_too_large
val regexerror_of_value:
Unsigned.uint32 -> regexerror
val regexerror_to_value:
regexerror -> Unsigned.uint32
val regexerror : regexerror typ

type regexmatchflags = Anchored | Notbol | Noteol | Notempty | Partial | Newline_cr | Newline_lf | Newline_crlf | Newline_any | Newline_anycrlf | Bsr_anycrlf | Bsr_any | Partial_soft | Partial_hard | Notempty_atstart
type regexmatchflags_list = regexmatchflags list
val regexmatchflags_of_value:
Unsigned.uint32 -> regexmatchflags
val regexmatchflags_to_value:
regexmatchflags -> Unsigned.uint32
val regexmatchflags_list_of_value:
Unsigned.uint32 -> regexmatchflags_list
val regexmatchflags_list_to_value:
regexmatchflags_list -> Unsigned.uint32
val regexmatchflags_list : regexmatchflags_list typ

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

type seektype = Cur | Set | End
val seektype_of_value:
Unsigned.uint32 -> seektype
val seektype_to_value:
seektype -> Unsigned.uint32
val seektype : seektype typ

type shellerror = Bad_quoting | Empty_string | Failed
val shellerror_of_value:
Unsigned.uint32 -> shellerror
val shellerror_to_value:
shellerror -> Unsigned.uint32
val shellerror : shellerror typ

type sliceconfig = Always_malloc | Bypass_magazines | Working_set_msecs | Color_increment | Chunk_sizes | Contention_counter
val sliceconfig_of_value:
Unsigned.uint32 -> sliceconfig
val sliceconfig_to_value:
sliceconfig -> Unsigned.uint32
val sliceconfig : sliceconfig typ

type spawnerror = Fork | Read | Chdir | Acces | Perm | Too_big | Noexec | Nametoolong | Noent | Nomem | Notdir | Loop | Txtbusy | Io | Nfile | Mfile | Inval | Isdir | Libbad | Failed
val spawnerror_of_value:
Unsigned.uint32 -> spawnerror
val spawnerror_to_value:
spawnerror -> Unsigned.uint32
val spawnerror : spawnerror typ

type spawnflags = Default | Leave_descriptors_open | Do_not_reap_child | Search_path | Stdout_to_dev_null | Stderr_to_dev_null | Child_inherits_stdin | File_and_argv_zero | Search_path_from_envp | Cloexec_pipes
type spawnflags_list = spawnflags list
val spawnflags_of_value:
Unsigned.uint32 -> spawnflags
val spawnflags_to_value:
spawnflags -> Unsigned.uint32
val spawnflags_list_of_value:
Unsigned.uint32 -> spawnflags_list
val spawnflags_list_to_value:
spawnflags_list -> Unsigned.uint32
val spawnflags_list : spawnflags_list typ

val _TIME_SPAN_DAY : int64

val _TIME_SPAN_HOUR : int64

val _TIME_SPAN_MILLISECOND : int64

val _TIME_SPAN_MINUTE : int64

val _TIME_SPAN_SECOND : int64

type testfiletype = Dist | Built
val testfiletype_of_value:
Unsigned.uint32 -> testfiletype
val testfiletype_to_value:
testfiletype -> Unsigned.uint32
val testfiletype : testfiletype typ

type testlogtype = None | Error | Start_binary | List_case | Skip_case | Start_case | Stop_case | Min_result | Max_result | Message | Start_suite | Stop_suite
val testlogtype_of_value:
Unsigned.uint32 -> testlogtype
val testlogtype_to_value:
testlogtype -> Unsigned.uint32
val testlogtype : testlogtype typ

type testsubprocessflags = Stdin | Stdout | Stderr
type testsubprocessflags_list = testsubprocessflags list
val testsubprocessflags_of_value:
Unsigned.uint32 -> testsubprocessflags
val testsubprocessflags_to_value:
testsubprocessflags -> Unsigned.uint32
val testsubprocessflags_list_of_value:
Unsigned.uint32 -> testsubprocessflags_list
val testsubprocessflags_list_to_value:
testsubprocessflags_list -> Unsigned.uint32
val testsubprocessflags_list : testsubprocessflags_list typ

type testtrapflags = Silence_stdout | Silence_stderr | Inherit_stdin
type testtrapflags_list = testtrapflags list
val testtrapflags_of_value:
Unsigned.uint32 -> testtrapflags
val testtrapflags_to_value:
testtrapflags -> Unsigned.uint32
val testtrapflags_list_of_value:
Unsigned.uint32 -> testtrapflags_list
val testtrapflags_list_to_value:
testtrapflags_list -> Unsigned.uint32
val testtrapflags_list : testtrapflags_list typ

type threaderror = Thread_error_again
val threaderror_of_value:
Unsigned.uint32 -> threaderror
val threaderror_to_value:
threaderror -> Unsigned.uint32
val threaderror : threaderror typ

type timetype = Standard | Daylight | Universal
val timetype_of_value:
Unsigned.uint32 -> timetype
val timetype_to_value:
timetype -> Unsigned.uint32
val timetype : timetype typ

type tokentype = Eof | Left_paren | Right_paren | Left_curly | Right_curly | Left_brace | Right_brace | Equal_sign | Comma | None | Error | Char | Binary | Octal | Int | Hex | Float | String | Symbol | Identifier | Identifier_null | Comment_single | Comment_multi
val tokentype_of_value:
Unsigned.uint32 -> tokentype
val tokentype_to_value:
tokentype -> Unsigned.uint32
val tokentype : tokentype typ

type traverseflags = Leaves | Non_leaves | All | Mask | Leafs | Non_leafs
type traverseflags_list = traverseflags list
val traverseflags_of_value:
Unsigned.uint32 -> traverseflags
val traverseflags_to_value:
traverseflags -> Unsigned.uint32
val traverseflags_list_of_value:
Unsigned.uint32 -> traverseflags_list
val traverseflags_list_to_value:
traverseflags_list -> Unsigned.uint32
val traverseflags_list : traverseflags_list typ

type traversetype = In_order | Pre_order | Post_order | Level_order
val traversetype_of_value:
Unsigned.uint32 -> traversetype
val traversetype_to_value:
traversetype -> Unsigned.uint32
val traversetype : traversetype typ

val _UNICHAR_MAX_DECOMPOSITION_LENGTH : int32

val _URI_RESERVED_CHARS_GENERIC_DELIMITERS : string

val _URI_RESERVED_CHARS_SUBCOMPONENT_DELIMITERS : string

val _USEC_PER_SEC : int32

type unicodebreaktype = Mandatory | Carriage_return | Line_feed | Combining_mark | Surrogate | Zero_width_space | Inseparable | Non_breaking_glue | Contingent | Space | After | Before | Before_and_after | Hyphen | Non_starter | Open_punctuation | Close_punctuation | Quotation | Exclamation | Ideographic | Numeric | Infix_separator | Symbol | Alphabetic | Prefix | Postfix | Complex_context | Ambiguous | Unknown | Next_line | Word_joiner | Hangul_l_jamo | Hangul_v_jamo | Hangul_t_jamo | Hangul_lv_syllable | Hangul_lvt_syllable | Close_paranthesis | Conditional_japanese_starter | Hebrew_letter | Regional_indicator | Emoji_base | Emoji_modifier | Zero_width_joiner
val unicodebreaktype_of_value:
Unsigned.uint32 -> unicodebreaktype
val unicodebreaktype_to_value:
unicodebreaktype -> Unsigned.uint32
val unicodebreaktype : unicodebreaktype typ

type unicodescript = Invalid_code | Common | Inherited | Arabic | Armenian | Bengali | Bopomofo | Cherokee | Coptic | Cyrillic | Deseret | Devanagari | Ethiopic | Georgian | Gothic | Greek | Gujarati | Gurmukhi | Han | Hangul | Hebrew | Hiragana | Kannada | Katakana | Khmer | Lao | Latin | Malayalam | Mongolian | Myanmar | Ogham | Old_italic | Oriya | Runic | Sinhala | Syriac | Tamil | Telugu | Thaana | Thai | Tibetan | Canadian_aboriginal | Yi | Tagalog | Hanunoo | Buhid | Tagbanwa | Braille | Cypriot | Limbu | Osmanya | Shavian | Linear_b | Tai_le | Ugaritic | New_tai_lue | Buginese | Glagolitic | Tifinagh | Syloti_nagri | Old_persian | Kharoshthi | Unknown | Balinese | Cuneiform | Phoenician | Phags_pa | Nko | Kayah_li | Lepcha | Rejang | Sundanese | Saurashtra | Cham | Ol_chiki | Vai | Carian | Lycian | Lydian | Avestan | Bamum | Egyptian_hieroglyphs | Imperial_aramaic | Inscriptional_pahlavi | Inscriptional_parthian | Javanese | Kaithi | Lisu | Meetei_mayek | Old_south_arabian | Old_turkic | Samaritan | Tai_tham | Tai_viet | Batak | Brahmi | Mandaic | Chakma | Meroitic_cursive | Meroitic_hieroglyphs | Miao | Sharada | Sora_sompeng | Takri | Bassa_vah | Caucasian_albanian | Duployan | Elbasan | Grantha | Khojki | Khudawadi | Linear_a | Mahajani | Manichaean | Mende_kikakui | Modi | Mro | Nabataean | Old_north_arabian | Old_permic | Pahawh_hmong | Palmyrene | Pau_cin_hau | Psalter_pahlavi | Siddham | Tirhuta | Warang_citi | Ahom | Anatolian_hieroglyphs | Hatran | Multani | Old_hungarian | Signwriting | Adlam | Bhaiksuki | Marchen | Newa | Osage | Tangut
val unicodescript_of_value:
int32 -> unicodescript
val unicodescript_to_value:
unicodescript -> int32
val unicodescript : unicodescript typ

type unicodetype = Control | Format | Unassigned | Private_use | Surrogate | Lowercase_letter | Modifier_letter | Other_letter | Titlecase_letter | Uppercase_letter | Spacing_mark | Enclosing_mark | Non_spacing_mark | Decimal_number | Letter_number | Other_number | Connect_punctuation | Dash_punctuation | Close_punctuation | Final_punctuation | Initial_punctuation | Other_punctuation | Open_punctuation | Currency_symbol | Modifier_symbol | Math_symbol | Other_symbol | Line_separator | Paragraph_separator | Space_separator
val unicodetype_of_value:
Unsigned.uint32 -> unicodetype
val unicodetype_to_value:
unicodetype -> Unsigned.uint32
val unicodetype : unicodetype typ

type userdirectory = Directory_desktop | Directory_documents | Directory_download | Directory_music | Directory_pictures | Directory_public_share | Directory_templates | Directory_videos | N_directories
val userdirectory_of_value:
Unsigned.uint32 -> userdirectory
val userdirectory_to_value:
userdirectory -> Unsigned.uint32
val userdirectory : userdirectory typ

val _VA_COPY_AS_ARRAY : int32

val _VERSION_MIN_REQUIRED : int32

type variantclass = Boolean | Byte | Int16 | Uint16 | Int32 | Uint32 | Int64 | Uint64 | Handle | Double | String | Object_path | Signature | Variant | Maybe | Array | Tuple | Dict_entry
val variantclass_of_value:
Unsigned.uint32 -> variantclass
val variantclass_to_value:
variantclass -> Unsigned.uint32
val variantclass : variantclass typ

type variantparseerror = Failed | Basic_type_expected | Cannot_infer_type | Definite_type_expected | Input_not_at_end | Invalid_character | Invalid_format_string | Invalid_object_path | Invalid_signature | Invalid_type_string | No_common_type | Number_out_of_range | Number_too_big | Type_error | Unexpected_token | Unknown_keyword | Unterminated_string_constant | Value_expected
val variantparseerror_of_value:
Unsigned.uint32 -> variantparseerror
val variantparseerror_to_value:
variantparseerror -> Unsigned.uint32
val variantparseerror : variantparseerror typ

val _WIN32_MSG_HANDLE : int32

val access:
string -> int32 -> int32

val ascii_digit_value:
int -> int32

(* Not implemented g_ascii_dtostr return type not handled *)
(* Not implemented g_ascii_formatd return type not handled *)
val ascii_strcasecmp:
string -> string -> int32

(* Not implemented g_ascii_strdown return type not handled *)
val ascii_strncasecmp:
string -> string -> Unsigned.uint64 -> int32

(* Not implemented g_ascii_strtod argument types not handled *)
(* Not implemented g_ascii_strtoll argument types not handled *)
(* Not implemented g_ascii_strtoull argument types not handled *)
(* Not implemented g_ascii_strup return type not handled *)
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
string -> string -> int32 -> string -> string -> Error.t structure -> Unsigned.uint32 -> int32 -> unit

(* Not implemented g_atexit argument types not handled *)
val atomic_int_add:
int32 -> int32 -> int32

val atomic_int_and:
Unsigned.uint32 -> Unsigned.uint32 -> Unsigned.uint32

val atomic_int_compare_and_exchange:
int32 -> int32 -> int32 -> bool

val atomic_int_dec_and_test:
int32 -> bool

val atomic_int_exchange_and_add:
int32 -> int32 -> int32

val atomic_int_get:
int32 -> int32

val atomic_int_inc:
int32 -> unit

val atomic_int_or:
Unsigned.uint32 -> Unsigned.uint32 -> Unsigned.uint32

val atomic_int_set:
int32 -> int32 -> unit

val atomic_int_xor:
Unsigned.uint32 -> Unsigned.uint32 -> Unsigned.uint32

val atomic_pointer_add:
unit -> int64 -> int64

val atomic_pointer_and:
unit -> Unsigned.uint64 -> Unsigned.uint64

val atomic_pointer_compare_and_exchange:
unit -> unit -> unit -> bool

val atomic_pointer_get:
unit -> unit

val atomic_pointer_or:
unit -> Unsigned.uint64 -> Unsigned.uint64

val atomic_pointer_set:
unit -> unit -> unit

val atomic_pointer_xor:
unit -> Unsigned.uint64 -> Unsigned.uint64

(* Not implemented g_base64_decode argument types not handled *)
(* Not implemented g_base64_decode_inplace argument types not handled *)
(* Not implemented g_base64_decode_step argument types not handled *)
(* Not implemented g_base64_encode return type not handled *)
(* Not implemented g_base64_encode_close argument types not handled *)
(* Not implemented g_base64_encode_step argument types not handled *)
val basename:
string -> string

val bit_lock:
int32 -> int32 -> unit

val bit_nth_lsf:
Unsigned.uint64 -> int32 -> int32

val bit_nth_msf:
Unsigned.uint64 -> int32 -> int32

val bit_storage:
Unsigned.uint64 -> Unsigned.uint32

val bit_trylock:
int32 -> int32 -> bool

val bit_unlock:
int32 -> int32 -> unit

val bookmark_file_error_quark:
 -> Unsigned.uint32

(* Not implemented g_build_filenamev return type not handled *)
(* Not implemented g_build_pathv return type not handled *)
val byte_array_free:
Array.t structure -> bool -> Unsigned.uint8

(* Not implemented g_byte_array_free_to_bytes return type not handled *)
(* Not implemented g_byte_array_new return type not handled *)
(* Not implemented g_byte_array_new_take return type not handled *)
val byte_array_unref:
Array.t structure -> unit

val chdir:
string -> int32

val check_version:
Unsigned.uint32 -> Unsigned.uint32 -> Unsigned.uint32 -> string

(* Not implemented g_checksum_type_get_length argument types not handled *)
(* Not implemented g_child_watch_add_full argument types not handled *)
(* Not implemented g_child_watch_source_new return type not handled *)
val clear_error:
 -> unit

val close:
int32 -> bool

(* Not implemented g_compute_checksum_for_bytes argument types not handled *)
(* Not implemented g_compute_checksum_for_data argument types not handled *)
(* Not implemented g_compute_checksum_for_string argument types not handled *)
(* Not implemented g_compute_hmac_for_bytes argument types not handled *)
(* Not implemented g_compute_hmac_for_data argument types not handled *)
(* Not implemented g_compute_hmac_for_string argument types not handled *)
(* Not implemented g_convert argument types not handled *)
val convert_error_quark:
 -> Unsigned.uint32

(* Not implemented g_convert_with_fallback return type not handled *)
(* Not implemented g_convert_with_iconv argument types not handled *)
(* Not implemented g_datalist_clear argument types not handled *)
(* Not implemented g_datalist_get_data argument types not handled *)
(* Not implemented g_datalist_get_flags argument types not handled *)
(* Not implemented g_datalist_id_get_data argument types not handled *)
(* Not implemented g_datalist_id_remove_no_notify argument types not handled *)
(* Not implemented g_datalist_id_replace_data argument types not handled *)
(* Not implemented g_datalist_id_set_data_full argument types not handled *)
(* Not implemented g_datalist_init argument types not handled *)
(* Not implemented g_datalist_set_flags argument types not handled *)
(* Not implemented g_datalist_unset_flags argument types not handled *)
val dataset_destroy:
unit -> unit

val dataset_id_get_data:
unit -> Unsigned.uint32 -> unit

val dataset_id_remove_no_notify:
unit -> Unsigned.uint32 -> unit

(* Not implemented g_dataset_id_set_data_full argument types not handled *)
(* Not implemented g_date_get_days_in_month argument types not handled *)
val date_get_monday_weeks_in_year:
Unsigned.uint16 -> Unsigned.uint8

val date_get_sunday_weeks_in_year:
Unsigned.uint16 -> Unsigned.uint8

val date_is_leap_year:
Unsigned.uint16 -> bool

(* Not implemented g_date_strftime argument types not handled *)
val date_time_compare:
unit -> unit -> int32

val date_time_equal:
unit -> unit -> bool

val date_time_hash:
unit -> Unsigned.uint32

val date_valid_day:
Unsigned.uint8 -> bool

(* Not implemented g_date_valid_dmy argument types not handled *)
val date_valid_julian:
Unsigned.uint32 -> bool

(* Not implemented g_date_valid_month argument types not handled *)
(* Not implemented g_date_valid_weekday argument types not handled *)
val date_valid_year:
Unsigned.uint16 -> bool

val dcgettext:
string -> string -> int32 -> string

val dgettext:
string -> string -> string

(* Not implemented g_dir_make_tmp return type not handled *)
val direct_equal:
unit -> unit -> bool

val direct_hash:
unit -> Unsigned.uint32

val dngettext:
string -> string -> string -> Unsigned.uint64 -> string

val double_equal:
unit -> unit -> bool

val double_hash:
unit -> Unsigned.uint32

val dpgettext:
string -> string -> Unsigned.uint64 -> string

val dpgettext2:
string -> string -> string -> string

val environ_getenv:
Array.t structure -> string -> string

(* Not implemented g_environ_setenv return type not handled *)
(* Not implemented g_environ_unsetenv return type not handled *)
(* Not implemented g_file_error_from_errno return type not handled *)
val file_error_quark:
 -> Unsigned.uint32

(* Not implemented g_file_get_contents argument types not handled *)
(* Not implemented g_file_open_tmp argument types not handled *)
(* Not implemented g_file_read_link return type not handled *)
val file_set_contents:
string -> Array.t structure -> int64 -> bool

(* Not implemented g_file_test argument types not handled *)
(* Not implemented g_filename_display_basename return type not handled *)
(* Not implemented g_filename_display_name return type not handled *)
(* Not implemented g_filename_from_uri argument types not handled *)
(* Not implemented g_filename_from_utf8 argument types not handled *)
(* Not implemented g_filename_to_uri return type not handled *)
(* Not implemented g_filename_to_utf8 argument types not handled *)
(* Not implemented g_find_program_in_path return type not handled *)
(* Not implemented g_format_size return type not handled *)
(* Not implemented g_format_size_for_display return type not handled *)
(* Not implemented g_format_size_full argument types not handled *)
val free:
unit -> unit

val get_application_name:
 -> string

(* Not implemented g_get_charset argument types not handled *)
(* Not implemented g_get_codeset return type not handled *)
(* Not implemented g_get_current_dir return type not handled *)
(* Not implemented g_get_current_time argument types not handled *)
(* Not implemented g_get_environ return type not handled *)
val get_filename_charsets:
string -> bool

val get_home_dir:
 -> string

val get_host_name:
 -> string

val get_language_names:
 -> Array.t structure

(* Not implemented g_get_locale_variants return type not handled *)
val get_monotonic_time:
 -> int64

val get_num_processors:
 -> Unsigned.uint32

val get_prgname:
 -> string

val get_real_name:
 -> string

val get_real_time:
 -> int64

val get_system_config_dirs:
 -> Array.t structure

val get_system_data_dirs:
 -> Array.t structure

val get_tmp_dir:
 -> string

val get_user_cache_dir:
 -> string

val get_user_config_dir:
 -> string

val get_user_data_dir:
 -> string

val get_user_name:
 -> string

val get_user_runtime_dir:
 -> string

(* Not implemented g_get_user_special_dir argument types not handled *)
val getenv:
string -> string

val hash_table_add:
HashTable.t structure -> unit -> bool

val hash_table_contains:
HashTable.t structure -> unit -> bool

val hash_table_destroy:
HashTable.t structure -> unit

val hash_table_insert:
HashTable.t structure -> unit -> unit -> bool

val hash_table_lookup:
HashTable.t structure -> unit -> unit

(* Not implemented g_hash_table_lookup_extended argument types not handled *)
val hash_table_remove:
HashTable.t structure -> unit -> bool

val hash_table_remove_all:
HashTable.t structure -> unit

val hash_table_replace:
HashTable.t structure -> unit -> unit -> bool

val hash_table_size:
HashTable.t structure -> Unsigned.uint32

val hash_table_steal:
HashTable.t structure -> unit -> bool

val hash_table_steal_all:
HashTable.t structure -> unit

val hash_table_unref:
HashTable.t structure -> unit

(* Not implemented g_hook_destroy argument types not handled *)
(* Not implemented g_hook_destroy_link argument types not handled *)
(* Not implemented g_hook_free argument types not handled *)
(* Not implemented g_hook_insert_before argument types not handled *)
(* Not implemented g_hook_prepend argument types not handled *)
(* Not implemented g_hook_unref argument types not handled *)
val hostname_is_ascii_encoded:
string -> bool

val hostname_is_ip_address:
string -> bool

val hostname_is_non_ascii:
string -> bool

(* Not implemented g_hostname_to_ascii return type not handled *)
(* Not implemented g_hostname_to_unicode return type not handled *)
(* Not implemented g_iconv argument types not handled *)
(* Not implemented g_idle_add_full argument types not handled *)
val idle_remove_by_data:
unit -> bool

(* Not implemented g_idle_source_new return type not handled *)
val int64_equal:
unit -> unit -> bool

val int64_hash:
unit -> Unsigned.uint32

val int_equal:
unit -> unit -> bool

val int_hash:
unit -> Unsigned.uint32

val intern_static_string:
string -> string

val intern_string:
string -> string

(* Not implemented g_io_add_watch_full argument types not handled *)
(* Not implemented g_io_channel_error_from_errno return type not handled *)
val io_channel_error_quark:
 -> Unsigned.uint32

(* Not implemented g_io_create_watch argument types not handled *)
val key_file_error_quark:
 -> Unsigned.uint32

(* Not implemented g_listenv return type not handled *)
(* Not implemented g_locale_from_utf8 argument types not handled *)
(* Not implemented g_locale_to_utf8 argument types not handled *)
(* Not implemented g_log_default_handler argument types not handled *)
val log_remove_handler:
string -> Unsigned.uint32 -> unit

(* Not implemented g_log_set_always_fatal argument types not handled *)
(* Not implemented g_log_set_fatal_mask argument types not handled *)
(* Not implemented g_log_set_handler_full argument types not handled *)
(* Not implemented g_log_set_writer_func argument types not handled *)
(* Not implemented g_log_structured_array argument types not handled *)
(* Not implemented g_log_variant argument types not handled *)
(* Not implemented g_log_writer_default argument types not handled *)
(* Not implemented g_log_writer_format_fields argument types not handled *)
val log_writer_is_journald:
int32 -> bool

(* Not implemented g_log_writer_journald argument types not handled *)
(* Not implemented g_log_writer_standard_streams argument types not handled *)
val log_writer_supports_color:
int32 -> bool

(* Not implemented g_main_context_default return type not handled *)
(* Not implemented g_main_context_get_thread_default return type not handled *)
(* Not implemented g_main_context_ref_thread_default return type not handled *)
(* Not implemented g_main_current_source return type not handled *)
val main_depth:
 -> int32

val malloc:
Unsigned.uint64 -> unit

val malloc0:
Unsigned.uint64 -> unit

val malloc0_n:
Unsigned.uint64 -> Unsigned.uint64 -> unit

val malloc_n:
Unsigned.uint64 -> Unsigned.uint64 -> unit

val markup_error_quark:
 -> Unsigned.uint32

(* Not implemented g_markup_escape_text return type not handled *)
val mem_is_system_malloc:
 -> bool

val mem_profile:
 -> unit

(* Not implemented g_mem_set_vtable argument types not handled *)
val memdup:
unit -> Unsigned.uint32 -> unit

val mkdir_with_parents:
string -> int32 -> int32

val nullify_pointer:
unit -> unit

val on_error_query:
string -> unit

val on_error_stack_trace:
string -> unit

val once_init_enter:
unit -> bool

val once_init_leave:
unit -> Unsigned.uint64 -> unit

val option_error_quark:
 -> Unsigned.uint32

val parse_debug_string:
string -> Array.t structure -> Unsigned.uint32 -> Unsigned.uint32

(* Not implemented g_path_get_basename return type not handled *)
(* Not implemented g_path_get_dirname return type not handled *)
val path_is_absolute:
string -> bool

val path_skip_root:
string -> string

(* Not implemented g_pattern_match argument types not handled *)
val pattern_match_simple:
string -> string -> bool

(* Not implemented g_pattern_match_string argument types not handled *)
val pointer_bit_lock:
unit -> int32 -> unit

val pointer_bit_trylock:
unit -> int32 -> bool

val pointer_bit_unlock:
unit -> int32 -> unit

(* Not implemented g_poll argument types not handled *)
(* Not implemented g_propagate_error argument types not handled *)
val quark_from_static_string:
string -> Unsigned.uint32

val quark_from_string:
string -> Unsigned.uint32

val quark_to_string:
Unsigned.uint32 -> string

val quark_try_string:
string -> Unsigned.uint32

val random_double:
 -> float

val random_double_range:
float -> float -> float

val random_int:
 -> Unsigned.uint32

val random_int_range:
int32 -> int32 -> int32

val random_set_seed:
Unsigned.uint32 -> unit

val realloc:
unit -> Unsigned.uint64 -> unit

val realloc_n:
unit -> Unsigned.uint64 -> Unsigned.uint64 -> unit

(* Not implemented g_regex_check_replacement argument types not handled *)
val regex_error_quark:
 -> Unsigned.uint32

(* Not implemented g_regex_escape_nul return type not handled *)
(* Not implemented g_regex_escape_string return type not handled *)
(* Not implemented g_regex_match_simple argument types not handled *)
(* Not implemented g_regex_split_simple argument types not handled *)
val reload_user_special_dirs_cache:
 -> unit

val rmdir:
string -> int32

(* Not implemented g_sequence_get argument types not handled *)
(* Not implemented g_sequence_move argument types not handled *)
(* Not implemented g_sequence_move_range argument types not handled *)
(* Not implemented g_sequence_remove argument types not handled *)
(* Not implemented g_sequence_remove_range argument types not handled *)
(* Not implemented g_sequence_set argument types not handled *)
(* Not implemented g_sequence_swap argument types not handled *)
val set_application_name:
string -> unit

(* Not implemented g_set_error_literal argument types not handled *)
val set_prgname:
string -> unit

val setenv:
string -> string -> bool -> bool

val shell_error_quark:
 -> Unsigned.uint32

(* Not implemented g_shell_parse_argv argument types not handled *)
(* Not implemented g_shell_quote return type not handled *)
(* Not implemented g_shell_unquote return type not handled *)
val slice_alloc:
Unsigned.uint64 -> unit

val slice_alloc0:
Unsigned.uint64 -> unit

val slice_copy:
Unsigned.uint64 -> unit -> unit

val slice_free1:
Unsigned.uint64 -> unit -> unit

val slice_free_chain_with_offset:
Unsigned.uint64 -> unit -> Unsigned.uint64 -> unit

(* Not implemented g_slice_get_config argument types not handled *)
(* Not implemented g_slice_get_config_state argument types not handled *)
(* Not implemented g_slice_set_config argument types not handled *)
val source_remove:
Unsigned.uint32 -> bool

(* Not implemented g_source_remove_by_funcs_user_data argument types not handled *)
val source_remove_by_user_data:
unit -> bool

val source_set_name_by_id:
Unsigned.uint32 -> string -> unit

val spaced_primes_closest:
Unsigned.uint32 -> Unsigned.uint32

(* Not implemented g_spawn_async argument types not handled *)
(* Not implemented g_spawn_async_with_pipes argument types not handled *)
val spawn_check_exit_status:
int32 -> bool

val spawn_close_pid:
int32 -> unit

val spawn_command_line_async:
string -> bool

(* Not implemented g_spawn_command_line_sync argument types not handled *)
val spawn_error_quark:
 -> Unsigned.uint32

val spawn_exit_error_quark:
 -> Unsigned.uint32

(* Not implemented g_spawn_sync argument types not handled *)
(* Not implemented g_stpcpy return type not handled *)
val str_equal:
unit -> unit -> bool

val str_has_prefix:
string -> string -> bool

val str_has_suffix:
string -> string -> bool

val str_hash:
unit -> Unsigned.uint32

val str_is_ascii:
string -> bool

val str_match_string:
string -> string -> bool -> bool

(* Not implemented g_str_to_ascii return type not handled *)
(* Not implemented g_str_tokenize_and_fold argument types not handled *)
(* Not implemented g_strcanon return type not handled *)
val strcasecmp:
string -> string -> int32

(* Not implemented g_strchomp return type not handled *)
(* Not implemented g_strchug return type not handled *)
val strcmp0:
string -> string -> int32

(* Not implemented g_strcompress return type not handled *)
(* Not implemented g_strdelimit return type not handled *)
(* Not implemented g_strdown return type not handled *)
(* Not implemented g_strdup return type not handled *)
val strerror:
int32 -> string

(* Not implemented g_strescape return type not handled *)
val strfreev:
string -> unit

(* Not implemented g_string_new return type not handled *)
(* Not implemented g_string_new_len return type not handled *)
(* Not implemented g_string_sized_new return type not handled *)
val strip_context:
string -> string -> string

(* Not implemented g_strjoinv return type not handled *)
val strlcat:
string -> string -> Unsigned.uint64 -> Unsigned.uint64

val strlcpy:
string -> string -> Unsigned.uint64 -> Unsigned.uint64

val strncasecmp:
string -> string -> Unsigned.uint32 -> int32

(* Not implemented g_strndup return type not handled *)
(* Not implemented g_strnfill return type not handled *)
(* Not implemented g_strreverse return type not handled *)
(* Not implemented g_strrstr return type not handled *)
(* Not implemented g_strrstr_len return type not handled *)
val strsignal:
int32 -> string

(* Not implemented g_strstr_len return type not handled *)
(* Not implemented g_strtod argument types not handled *)
(* Not implemented g_strup return type not handled *)
val strv_contains:
string -> string -> bool

(* Not implemented g_strv_get_type return type not handled *)
val strv_length:
string -> Unsigned.uint32

(* Not implemented g_test_add_data_func argument types not handled *)
(* Not implemented g_test_add_data_func_full argument types not handled *)
(* Not implemented g_test_add_func argument types not handled *)
val test_assert_expected_messages_internal:
string -> string -> int32 -> string -> unit

val test_bug:
string -> unit

val test_bug_base:
string -> unit

(* Not implemented g_test_expect_message argument types not handled *)
val test_fail:
 -> unit

val test_failed:
 -> bool

(* Not implemented g_test_get_dir argument types not handled *)
val test_incomplete:
string -> unit

(* Not implemented g_test_log_type_name argument types not handled *)
(* Not implemented g_test_queue_destroy argument types not handled *)
val test_queue_free:
unit -> unit

val test_rand_double:
 -> float

val test_rand_double_range:
float -> float -> float

val test_rand_int:
 -> int32

val test_rand_int_range:
int32 -> int32 -> int32

val test_run:
 -> int32

(* Not implemented g_test_run_suite argument types not handled *)
val test_set_nonfatal_assertions:
 -> unit

val test_skip:
string -> unit

val test_subprocess:
 -> bool

val test_timer_elapsed:
 -> float

val test_timer_last:
 -> float

val test_timer_start:
 -> unit

val test_trap_assertions:
string -> string -> int32 -> string -> Unsigned.uint64 -> string -> unit

(* Not implemented g_test_trap_fork argument types not handled *)
val test_trap_has_passed:
 -> bool

val test_trap_reached_timeout:
 -> bool

(* Not implemented g_test_trap_subprocess argument types not handled *)
val thread_error_quark:
 -> Unsigned.uint32

val thread_exit:
unit -> unit

val thread_pool_get_max_idle_time:
 -> Unsigned.uint32

val thread_pool_get_max_unused_threads:
 -> int32

val thread_pool_get_num_unused_threads:
 -> Unsigned.uint32

val thread_pool_set_max_idle_time:
Unsigned.uint32 -> unit

val thread_pool_set_max_unused_threads:
int32 -> unit

val thread_pool_stop_unused_threads:
 -> unit

(* Not implemented g_thread_self return type not handled *)
val thread_yield:
 -> unit

(* Not implemented g_time_val_from_iso8601 argument types not handled *)
(* Not implemented g_timeout_add_full argument types not handled *)
(* Not implemented g_timeout_add_seconds_full argument types not handled *)
(* Not implemented g_timeout_source_new return type not handled *)
(* Not implemented g_timeout_source_new_seconds return type not handled *)
(* Not implemented g_trash_stack_height argument types not handled *)
(* Not implemented g_trash_stack_peek argument types not handled *)
(* Not implemented g_trash_stack_pop argument types not handled *)
(* Not implemented g_trash_stack_push argument types not handled *)
val try_malloc:
Unsigned.uint64 -> unit

val try_malloc0:
Unsigned.uint64 -> unit

val try_malloc0_n:
Unsigned.uint64 -> Unsigned.uint64 -> unit

val try_malloc_n:
Unsigned.uint64 -> Unsigned.uint64 -> unit

val try_realloc:
unit -> Unsigned.uint64 -> unit

val try_realloc_n:
unit -> Unsigned.uint64 -> Unsigned.uint64 -> unit

(* Not implemented g_ucs4_to_utf16 argument types not handled *)
(* Not implemented g_ucs4_to_utf8 argument types not handled *)
(* Not implemented g_unichar_break_type argument types not handled *)
(* Not implemented g_unichar_combining_class argument types not handled *)
(* Not implemented g_unichar_compose argument types not handled *)
(* Not implemented g_unichar_decompose argument types not handled *)
(* Not implemented g_unichar_digit_value argument types not handled *)
(* Not implemented g_unichar_fully_decompose argument types not handled *)
(* Not implemented g_unichar_get_mirror_char argument types not handled *)
(* Not implemented g_unichar_get_script argument types not handled *)
(* Not implemented g_unichar_isalnum argument types not handled *)
(* Not implemented g_unichar_isalpha argument types not handled *)
(* Not implemented g_unichar_iscntrl argument types not handled *)
(* Not implemented g_unichar_isdefined argument types not handled *)
(* Not implemented g_unichar_isdigit argument types not handled *)
(* Not implemented g_unichar_isgraph argument types not handled *)
(* Not implemented g_unichar_islower argument types not handled *)
(* Not implemented g_unichar_ismark argument types not handled *)
(* Not implemented g_unichar_isprint argument types not handled *)
(* Not implemented g_unichar_ispunct argument types not handled *)
(* Not implemented g_unichar_isspace argument types not handled *)
(* Not implemented g_unichar_istitle argument types not handled *)
(* Not implemented g_unichar_isupper argument types not handled *)
(* Not implemented g_unichar_iswide argument types not handled *)
(* Not implemented g_unichar_iswide_cjk argument types not handled *)
(* Not implemented g_unichar_isxdigit argument types not handled *)
(* Not implemented g_unichar_iszerowidth argument types not handled *)
(* Not implemented g_unichar_to_utf8 argument types not handled *)
(* Not implemented g_unichar_tolower argument types not handled *)
(* Not implemented g_unichar_totitle argument types not handled *)
(* Not implemented g_unichar_toupper argument types not handled *)
(* Not implemented g_unichar_type argument types not handled *)
(* Not implemented g_unichar_validate argument types not handled *)
(* Not implemented g_unichar_xdigit_value argument types not handled *)
(* Not implemented g_unicode_canonical_decomposition argument types not handled *)
(* Not implemented g_unicode_canonical_ordering argument types not handled *)
(* Not implemented g_unicode_script_from_iso15924 return type not handled *)
(* Not implemented g_unicode_script_to_iso15924 argument types not handled *)
val unix_error_quark:
 -> Unsigned.uint32

(* Not implemented g_unix_fd_add_full argument types not handled *)
(* Not implemented g_unix_fd_source_new argument types not handled *)
val unix_open_pipe:
int32 -> int32 -> bool

val unix_set_fd_nonblocking:
int32 -> bool -> bool

(* Not implemented g_unix_signal_add_full argument types not handled *)
(* Not implemented g_unix_signal_source_new return type not handled *)
val unlink:
string -> int32

val unsetenv:
string -> unit

(* Not implemented g_uri_escape_string return type not handled *)
(* Not implemented g_uri_list_extract_uris return type not handled *)
(* Not implemented g_uri_parse_scheme return type not handled *)
(* Not implemented g_uri_unescape_segment return type not handled *)
(* Not implemented g_uri_unescape_string return type not handled *)
val usleep:
Unsigned.uint64 -> unit

(* Not implemented g_utf16_to_ucs4 argument types not handled *)
(* Not implemented g_utf16_to_utf8 argument types not handled *)
(* Not implemented g_utf8_casefold return type not handled *)
val utf8_collate:
string -> string -> int32

(* Not implemented g_utf8_collate_key return type not handled *)
(* Not implemented g_utf8_collate_key_for_filename return type not handled *)
(* Not implemented g_utf8_find_next_char return type not handled *)
(* Not implemented g_utf8_find_prev_char return type not handled *)
(* Not implemented g_utf8_get_char return type not handled *)
(* Not implemented g_utf8_get_char_validated return type not handled *)
(* Not implemented g_utf8_make_valid return type not handled *)
(* Not implemented g_utf8_normalize argument types not handled *)
(* Not implemented g_utf8_offset_to_pointer return type not handled *)
val utf8_pointer_to_offset:
string -> string -> int64

(* Not implemented g_utf8_prev_char return type not handled *)
(* Not implemented g_utf8_strchr argument types not handled *)
(* Not implemented g_utf8_strdown return type not handled *)
val utf8_strlen:
string -> int64 -> int64

(* Not implemented g_utf8_strncpy return type not handled *)
(* Not implemented g_utf8_strrchr argument types not handled *)
(* Not implemented g_utf8_strreverse return type not handled *)
(* Not implemented g_utf8_strup return type not handled *)
(* Not implemented g_utf8_substring return type not handled *)
(* Not implemented g_utf8_to_ucs4 argument types not handled *)
(* Not implemented g_utf8_to_ucs4_fast argument types not handled *)
(* Not implemented g_utf8_to_utf16 argument types not handled *)
(* Not implemented g_utf8_validate argument types not handled *)
val uuid_string_is_valid:
string -> bool

(* Not implemented g_uuid_string_random return type not handled *)
(* Not implemented g_variant_get_gtype return type not handled *)
val variant_is_object_path:
string -> bool

val variant_is_signature:
string -> bool

(* Not implemented g_variant_parse argument types not handled *)
(* Not implemented g_variant_parse_error_print_context return type not handled *)
val variant_parse_error_quark:
 -> Unsigned.uint32

val variant_parser_get_error_quark:
 -> Unsigned.uint32

(* Not implemented g_variant_type_checked_ return type not handled *)
val variant_type_string_is_valid:
string -> bool

(* Not implemented g_variant_type_string_scan argument types not handled *)
