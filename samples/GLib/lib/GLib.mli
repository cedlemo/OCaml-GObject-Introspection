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

