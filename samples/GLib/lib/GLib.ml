open Ctypes
open Foreign
let _ANALYZER_ANALYZING = 1
let _ASCII_DTOSTR_BUF_SIZE = 39
let _BIG_ENDIAN = 4321
let invalid_uri = constant "G_BOOKMARKFILEERROR_INVALID_URI" uint32_t
and invalid_value = constant "G_BOOKMARKFILEERROR_INVALID_VALUE" uint32_t
and app_not_registered = constant "G_BOOKMARKFILEERROR_APP_NOT_REGISTERED" uint32_t
and uri_not_found = constant "G_BOOKMARKFILEERROR_URI_NOT_FOUND" uint32_t
and read = constant "G_BOOKMARKFILEERROR_READ" uint32_t
and unknown_encoding = constant "G_BOOKMARKFILEERROR_UNKNOWN_ENCODING" uint32_t
and write = constant "G_BOOKMARKFILEERROR_WRITE" uint32_t
and file_not_found = constant "G_BOOKMARKFILEERROR_FILE_NOT_FOUND" uint32_t
let bookmarkfileerror : [`Invalid_uri|`Invalid_value|`App_not_registered|`Uri_not_found|`Read|`Unknown_encoding|`Write|`File_not_found] typ = enum "bookmarkfileerror" [
`Invalid_uri, invalid_uri;
`Invalid_value, invalid_value;
`App_not_registered, app_not_registered;
`Uri_not_found, uri_not_found;
`Read, read;
`Unknown_encoding, unknown_encoding;
`Write, write;
`File_not_found, file_not_found
]
let _CSET_A_2_Z = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
let _CSET_DIGITS = "0123456789"
let _CSET_a_2_z = "abcdefghijklmnopqrstuvwxyz"
let md5 = constant "G_CHECKSUM_MD5" uint32_t
and sha1 = constant "G_CHECKSUM_SHA1" uint32_t
and sha256 = constant "G_CHECKSUM_SHA256" uint32_t
and sha512 = constant "G_CHECKSUM_SHA512" uint32_t
and sha384 = constant "G_CHECKSUM_SHA384" uint32_t
let checksumtype : [`Md5|`Sha1|`Sha256|`Sha512|`Sha384] typ = enum "checksumtype" [
`Md5, md5;
`Sha1, sha1;
`Sha256, sha256;
`Sha512, sha512;
`Sha384, sha384
]
let no_conversion = constant "G_CONVERTERROR_NO_CONVERSION" uint32_t
and illegal_sequence = constant "G_CONVERTERROR_ILLEGAL_SEQUENCE" uint32_t
and failed = constant "G_CONVERTERROR_FAILED" uint32_t
and partial_input = constant "G_CONVERTERROR_PARTIAL_INPUT" uint32_t
and bad_uri = constant "G_CONVERTERROR_BAD_URI" uint32_t
and not_absolute_path = constant "G_CONVERTERROR_NOT_ABSOLUTE_PATH" uint32_t
and no_memory = constant "G_CONVERTERROR_NO_MEMORY" uint32_t
let converterror : [`No_conversion|`Illegal_sequence|`Failed|`Partial_input|`Bad_uri|`Not_absolute_path|`No_memory] typ = enum "converterror" [
`No_conversion, no_conversion;
`Illegal_sequence, illegal_sequence;
`Failed, failed;
`Partial_input, partial_input;
`Bad_uri, bad_uri;
`Not_absolute_path, not_absolute_path;
`No_memory, no_memory
]
let _DATALIST_FLAGS_MASK = 3
let _DATE_BAD_DAY = 0
let _DATE_BAD_JULIAN = 0
let _DATE_BAD_YEAR = 0
let _DIR_SEPARATOR = 92
let _DIR_SEPARATOR_S = "\\"
let day = constant "G_DATEDMY_DAY" uint32_t
and month = constant "G_DATEDMY_MONTH" uint32_t
and year = constant "G_DATEDMY_YEAR" uint32_t
let datedmy : [`Day|`Month|`Year] typ = enum "datedmy" [
`Day, day;
`Month, month;
`Year, year
]
let bad_month = constant "G_DATEMONTH_BAD_MONTH" uint32_t
and january = constant "G_DATEMONTH_JANUARY" uint32_t
and february = constant "G_DATEMONTH_FEBRUARY" uint32_t
and march = constant "G_DATEMONTH_MARCH" uint32_t
and april = constant "G_DATEMONTH_APRIL" uint32_t
and may = constant "G_DATEMONTH_MAY" uint32_t
and june = constant "G_DATEMONTH_JUNE" uint32_t
and july = constant "G_DATEMONTH_JULY" uint32_t
and august = constant "G_DATEMONTH_AUGUST" uint32_t
and september = constant "G_DATEMONTH_SEPTEMBER" uint32_t
and october = constant "G_DATEMONTH_OCTOBER" uint32_t
and november = constant "G_DATEMONTH_NOVEMBER" uint32_t
and december = constant "G_DATEMONTH_DECEMBER" uint32_t
let datemonth : [`Bad_month|`January|`February|`March|`April|`May|`June|`July|`August|`September|`October|`November|`December] typ = enum "datemonth" [
`Bad_month, bad_month;
`January, january;
`February, february;
`March, march;
`April, april;
`May, may;
`June, june;
`July, july;
`August, august;
`September, september;
`October, october;
`November, november;
`December, december
]
let bad_weekday = constant "G_DATEWEEKDAY_BAD_WEEKDAY" uint32_t
and monday = constant "G_DATEWEEKDAY_MONDAY" uint32_t
and tuesday = constant "G_DATEWEEKDAY_TUESDAY" uint32_t
and wednesday = constant "G_DATEWEEKDAY_WEDNESDAY" uint32_t
and thursday = constant "G_DATEWEEKDAY_THURSDAY" uint32_t
and friday = constant "G_DATEWEEKDAY_FRIDAY" uint32_t
and saturday = constant "G_DATEWEEKDAY_SATURDAY" uint32_t
and sunday = constant "G_DATEWEEKDAY_SUNDAY" uint32_t
let dateweekday : [`Bad_weekday|`Monday|`Tuesday|`Wednesday|`Thursday|`Friday|`Saturday|`Sunday] typ = enum "dateweekday" [
`Bad_weekday, bad_weekday;
`Monday, monday;
`Tuesday, tuesday;
`Wednesday, wednesday;
`Thursday, thursday;
`Friday, friday;
`Saturday, saturday;
`Sunday, sunday
]
let _E = 2.718282
let unknown = constant "G_ERROR_UNKNOWN" uint32_t
and unexp_eof = constant "G_ERROR_UNEXP_EOF" uint32_t
and unexp_eof_in_string = constant "G_ERROR_UNEXP_EOF_IN_STRING" uint32_t
and unexp_eof_in_comment = constant "G_ERROR_UNEXP_EOF_IN_COMMENT" uint32_t
and non_digit_in_const = constant "G_ERROR_NON_DIGIT_IN_CONST" uint32_t
and digit_radix = constant "G_ERROR_DIGIT_RADIX" uint32_t
and float_radix = constant "G_ERROR_FLOAT_RADIX" uint32_t
and float_malformed = constant "G_ERROR_FLOAT_MALFORMED" uint32_t
let errortype : [`Unknown|`Unexp_eof|`Unexp_eof_in_string|`Unexp_eof_in_comment|`Non_digit_in_const|`Digit_radix|`Float_radix|`Float_malformed] typ = enum "errortype" [
`Unknown, unknown;
`Unexp_eof, unexp_eof;
`Unexp_eof_in_string, unexp_eof_in_string;
`Unexp_eof_in_comment, unexp_eof_in_comment;
`Non_digit_in_const, non_digit_in_const;
`Digit_radix, digit_radix;
`Float_radix, float_radix;
`Float_malformed, float_malformed
]
let exist = constant "G_FILEERROR_EXIST" uint32_t
and isdir = constant "G_FILEERROR_ISDIR" uint32_t
and acces = constant "G_FILEERROR_ACCES" uint32_t
and nametoolong = constant "G_FILEERROR_NAMETOOLONG" uint32_t
and noent = constant "G_FILEERROR_NOENT" uint32_t
and notdir = constant "G_FILEERROR_NOTDIR" uint32_t
and nxio = constant "G_FILEERROR_NXIO" uint32_t
and nodev = constant "G_FILEERROR_NODEV" uint32_t
and rofs = constant "G_FILEERROR_ROFS" uint32_t
and txtbsy = constant "G_FILEERROR_TXTBSY" uint32_t
and fault = constant "G_FILEERROR_FAULT" uint32_t
and loop = constant "G_FILEERROR_LOOP" uint32_t
and nospc = constant "G_FILEERROR_NOSPC" uint32_t
and nomem = constant "G_FILEERROR_NOMEM" uint32_t
and mfile = constant "G_FILEERROR_MFILE" uint32_t
and nfile = constant "G_FILEERROR_NFILE" uint32_t
and badf = constant "G_FILEERROR_BADF" uint32_t
and inval = constant "G_FILEERROR_INVAL" uint32_t
and pipe = constant "G_FILEERROR_PIPE" uint32_t
and again = constant "G_FILEERROR_AGAIN" uint32_t
and intr = constant "G_FILEERROR_INTR" uint32_t
and io = constant "G_FILEERROR_IO" uint32_t
and perm = constant "G_FILEERROR_PERM" uint32_t
and nosys = constant "G_FILEERROR_NOSYS" uint32_t
and failed = constant "G_FILEERROR_FAILED" uint32_t
let fileerror : [`Exist|`Isdir|`Acces|`Nametoolong|`Noent|`Notdir|`Nxio|`Nodev|`Rofs|`Txtbsy|`Fault|`Loop|`Nospc|`Nomem|`Mfile|`Nfile|`Badf|`Inval|`Pipe|`Again|`Intr|`Io|`Perm|`Nosys|`Failed] typ = enum "fileerror" [
`Exist, exist;
`Isdir, isdir;
`Acces, acces;
`Nametoolong, nametoolong;
`Noent, noent;
`Notdir, notdir;
`Nxio, nxio;
`Nodev, nodev;
`Rofs, rofs;
`Txtbsy, txtbsy;
`Fault, fault;
`Loop, loop;
`Nospc, nospc;
`Nomem, nomem;
`Mfile, mfile;
`Nfile, nfile;
`Badf, badf;
`Inval, inval;
`Pipe, pipe;
`Again, again;
`Intr, intr;
`Io, io;
`Perm, perm;
`Nosys, nosys;
`Failed, failed
]
let _GINT16_FORMAT = "hi"
let _GINT16_MODIFIER = "h"
let _GINT32_FORMAT = "i"
let _GINT32_MODIFIER = ""
let _GINT64_FORMAT = "li"
let _GINT64_MODIFIER = "l"
let _GINTPTR_FORMAT = "li"
let _GINTPTR_MODIFIER = "l"
let _GNUC_FUNCTION = ""
let _GNUC_PRETTY_FUNCTION = ""
let _GSIZE_FORMAT = "lu"
let _GSIZE_MODIFIER = "l"
let _GSSIZE_FORMAT = "li"
let _GSSIZE_MODIFIER = "l"
let _GUINT16_FORMAT = "hu"
let _GUINT32_FORMAT = "u"
let _GUINT64_FORMAT = "lu"
let _GUINTPTR_FORMAT = "lu"
let _HAVE_GINT64 = 1
let _HAVE_GNUC_VARARGS = 1
let _HAVE_GNUC_VISIBILITY = 1
let _HAVE_GROWING_STACK = 0
let _HAVE_ISO_VARARGS = 1
let _HOOK_FLAG_USER_SHIFT = 4
let _IEEE754_DOUBLE_BIAS = 1023
let _IEEE754_FLOAT_BIAS = 127
let fbig = constant "G_IOCHANNELERROR_FBIG" uint32_t
and inval = constant "G_IOCHANNELERROR_INVAL" uint32_t
and io = constant "G_IOCHANNELERROR_IO" uint32_t
and isdir = constant "G_IOCHANNELERROR_ISDIR" uint32_t
and nospc = constant "G_IOCHANNELERROR_NOSPC" uint32_t
and nxio = constant "G_IOCHANNELERROR_NXIO" uint32_t
and overflow = constant "G_IOCHANNELERROR_OVERFLOW" uint32_t
and pipe = constant "G_IOCHANNELERROR_PIPE" uint32_t
and failed = constant "G_IOCHANNELERROR_FAILED" uint32_t
let iochannelerror : [`Fbig|`Inval|`Io|`Isdir|`Nospc|`Nxio|`Overflow|`Pipe|`Failed] typ = enum "iochannelerror" [
`Fbig, fbig;
`Inval, inval;
`Io, io;
`Isdir, isdir;
`Nospc, nospc;
`Nxio, nxio;
`Overflow, overflow;
`Pipe, pipe;
`Failed, failed
]
let none = constant "G_IOERROR_NONE" uint32_t
and again = constant "G_IOERROR_AGAIN" uint32_t
and inval = constant "G_IOERROR_INVAL" uint32_t
and unknown = constant "G_IOERROR_UNKNOWN" uint32_t
let ioerror : [`None|`Again|`Inval|`Unknown] typ = enum "ioerror" [
`None, none;
`Again, again;
`Inval, inval;
`Unknown, unknown
]
let error = constant "G_IOSTATUS_ERROR" uint32_t
and normal = constant "G_IOSTATUS_NORMAL" uint32_t
and eof = constant "G_IOSTATUS_EOF" uint32_t
and again = constant "G_IOSTATUS_AGAIN" uint32_t
let iostatus : [`Error|`Normal|`Eof|`Again] typ = enum "iostatus" [
`Error, error;
`Normal, normal;
`Eof, eof;
`Again, again
]
let _KEY_FILE_DESKTOP_GROUP = "Desktop Entry"
let _KEY_FILE_DESKTOP_KEY_ACTIONS = "Actions"
let _KEY_FILE_DESKTOP_KEY_CATEGORIES = "Categories"
let _KEY_FILE_DESKTOP_KEY_COMMENT = "Comment"
let _KEY_FILE_DESKTOP_KEY_DBUS_ACTIVATABLE = "DBusActivatable"
let _KEY_FILE_DESKTOP_KEY_EXEC = "Exec"
let _KEY_FILE_DESKTOP_KEY_GENERIC_NAME = "GenericName"
let _KEY_FILE_DESKTOP_KEY_HIDDEN = "Hidden"
let _KEY_FILE_DESKTOP_KEY_ICON = "Icon"
let _KEY_FILE_DESKTOP_KEY_MIME_TYPE = "MimeType"
let _KEY_FILE_DESKTOP_KEY_NAME = "Name"
let _KEY_FILE_DESKTOP_KEY_NOT_SHOW_IN = "NotShowIn"
let _KEY_FILE_DESKTOP_KEY_NO_DISPLAY = "NoDisplay"
let _KEY_FILE_DESKTOP_KEY_ONLY_SHOW_IN = "OnlyShowIn"
let _KEY_FILE_DESKTOP_KEY_PATH = "Path"
let _KEY_FILE_DESKTOP_KEY_STARTUP_NOTIFY = "StartupNotify"
let _KEY_FILE_DESKTOP_KEY_STARTUP_WM_CLASS = "StartupWMClass"
let _KEY_FILE_DESKTOP_KEY_TERMINAL = "Terminal"
let _KEY_FILE_DESKTOP_KEY_TRY_EXEC = "TryExec"
let _KEY_FILE_DESKTOP_KEY_TYPE = "Type"
let _KEY_FILE_DESKTOP_KEY_URL = "URL"
let _KEY_FILE_DESKTOP_KEY_VERSION = "Version"
let _KEY_FILE_DESKTOP_TYPE_APPLICATION = "Application"
let _KEY_FILE_DESKTOP_TYPE_DIRECTORY = "Directory"
let _KEY_FILE_DESKTOP_TYPE_LINK = "Link"
let unknown_encoding = constant "G_KEYFILEERROR_UNKNOWN_ENCODING" uint32_t
and parse = constant "G_KEYFILEERROR_PARSE" uint32_t
and not_found = constant "G_KEYFILEERROR_NOT_FOUND" uint32_t
and key_not_found = constant "G_KEYFILEERROR_KEY_NOT_FOUND" uint32_t
and group_not_found = constant "G_KEYFILEERROR_GROUP_NOT_FOUND" uint32_t
and invalid_value = constant "G_KEYFILEERROR_INVALID_VALUE" uint32_t
let keyfileerror : [`Unknown_encoding|`Parse|`Not_found|`Key_not_found|`Group_not_found|`Invalid_value] typ = enum "keyfileerror" [
`Unknown_encoding, unknown_encoding;
`Parse, parse;
`Not_found, not_found;
`Key_not_found, key_not_found;
`Group_not_found, group_not_found;
`Invalid_value, invalid_value
]
let _LITTLE_ENDIAN = 1234
let _LN10 = 2.302585
let _LN2 = 0.693147
let _LOG_2_BASE_10 = 0.30103
let _LOG_DOMAIN = 0
let _LOG_FATAL_MASK = 0
let _LOG_LEVEL_USER_SHIFT = 8
let handled = constant "G_LOGWRITEROUTPUT_HANDLED" uint32_t
and unhandled = constant "G_LOGWRITEROUTPUT_UNHANDLED" uint32_t
let logwriteroutput : [`Handled|`Unhandled] typ = enum "logwriteroutput" [
`Handled, handled;
`Unhandled, unhandled
]
let _MAJOR_VERSION = 2
let _MAXINT16 = 32767
let _MAXINT32 = 2147483647
let _MAXINT64 = 9223372036854775807
let _MAXINT8 = 127
let _MAXUINT16 = 65535
let _MAXUINT32 = 4294967295
let _MAXUINT64 = 18446744073709551615
let _MAXUINT8 = 255
let _MICRO_VERSION = 1
let _MININT16 = -32768
let _MININT32 = -2147483648
let _MININT64 = -9223372036854775808
let _MININT8 = -128
let _MINOR_VERSION = 52
let _MODULE_SUFFIX = "so"
let bad_utf8 = constant "G_MARKUPERROR_BAD_UTF8" uint32_t
and empty = constant "G_MARKUPERROR_EMPTY" uint32_t
and parse = constant "G_MARKUPERROR_PARSE" uint32_t
and unknown_element = constant "G_MARKUPERROR_UNKNOWN_ELEMENT" uint32_t
and unknown_attribute = constant "G_MARKUPERROR_UNKNOWN_ATTRIBUTE" uint32_t
and invalid_content = constant "G_MARKUPERROR_INVALID_CONTENT" uint32_t
and missing_attribute = constant "G_MARKUPERROR_MISSING_ATTRIBUTE" uint32_t
let markuperror : [`Bad_utf8|`Empty|`Parse|`Unknown_element|`Unknown_attribute|`Invalid_content|`Missing_attribute] typ = enum "markuperror" [
`Bad_utf8, bad_utf8;
`Empty, empty;
`Parse, parse;
`Unknown_element, unknown_element;
`Unknown_attribute, unknown_attribute;
`Invalid_content, invalid_content;
`Missing_attribute, missing_attribute
]
let default = constant "G_NORMALIZEMODE_DEFAULT" uint32_t
and nfd = constant "G_NORMALIZEMODE_NFD" uint32_t
and default_compose = constant "G_NORMALIZEMODE_DEFAULT_COMPOSE" uint32_t
and nfc = constant "G_NORMALIZEMODE_NFC" uint32_t
and all = constant "G_NORMALIZEMODE_ALL" uint32_t
and nfkd = constant "G_NORMALIZEMODE_NFKD" uint32_t
and all_compose = constant "G_NORMALIZEMODE_ALL_COMPOSE" uint32_t
and nfkc = constant "G_NORMALIZEMODE_NFKC" uint32_t
let normalizemode : [`Default|`Nfd|`Default_compose|`Nfc|`All|`Nfkd|`All_compose|`Nfkc] typ = enum "normalizemode" [
`Default, default;
`Nfd, nfd;
`Default_compose, default_compose;
`Nfc, nfc;
`All, all;
`Nfkd, nfkd;
`All_compose, all_compose;
`Nfkc, nfkc
]
let _OPTION_REMAINING = ""
let notcalled = constant "G_ONCESTATUS_NOTCALLED" uint32_t
and progress = constant "G_ONCESTATUS_PROGRESS" uint32_t
and ready = constant "G_ONCESTATUS_READY" uint32_t
let oncestatus : [`Notcalled|`Progress|`Ready] typ = enum "oncestatus" [
`Notcalled, notcalled;
`Progress, progress;
`Ready, ready
]
let none = constant "G_OPTIONARG_NONE" uint32_t
and string = constant "G_OPTIONARG_STRING" uint32_t
and int = constant "G_OPTIONARG_INT" uint32_t
and callback = constant "G_OPTIONARG_CALLBACK" uint32_t
and filename = constant "G_OPTIONARG_FILENAME" uint32_t
and string_array = constant "G_OPTIONARG_STRING_ARRAY" uint32_t
and filename_array = constant "G_OPTIONARG_FILENAME_ARRAY" uint32_t
and double = constant "G_OPTIONARG_DOUBLE" uint32_t
and int64 = constant "G_OPTIONARG_INT64" uint32_t
let optionarg : [`None|`String|`Int|`Callback|`Filename|`String_array|`Filename_array|`Double|`Int64] typ = enum "optionarg" [
`None, none;
`String, string;
`Int, int;
`Callback, callback;
`Filename, filename;
`String_array, string_array;
`Filename_array, filename_array;
`Double, double;
`Int64, int64
]
let unknown_option = constant "G_OPTIONERROR_UNKNOWN_OPTION" uint32_t
and bad_value = constant "G_OPTIONERROR_BAD_VALUE" uint32_t
and failed = constant "G_OPTIONERROR_FAILED" uint32_t
let optionerror : [`Unknown_option|`Bad_value|`Failed] typ = enum "optionerror" [
`Unknown_option, unknown_option;
`Bad_value, bad_value;
`Failed, failed
]
let _PDP_ENDIAN = 3412
let _PI = 3.141593
let _PID_FORMAT = "i"
let _PI_2 = 1.570796
let _PI_4 = 0.785398
let _POLLFD_FORMAT = "%d"
let _PRIORITY_DEFAULT = 0
let _PRIORITY_DEFAULT_IDLE = 200
let _PRIORITY_HIGH = -100
let _PRIORITY_HIGH_IDLE = 100
let _PRIORITY_LOW = 300
let compile = constant "G_REGEXERROR_COMPILE" uint32_t
and optimize = constant "G_REGEXERROR_OPTIMIZE" uint32_t
and replace = constant "G_REGEXERROR_REPLACE" uint32_t
and _match = constant "G_REGEXERROR_MATCH" uint32_t
and internal = constant "G_REGEXERROR_INTERNAL" uint32_t
and stray_backslash = constant "G_REGEXERROR_STRAY_BACKSLASH" uint32_t
and missing_control_char = constant "G_REGEXERROR_MISSING_CONTROL_CHAR" uint32_t
and unrecognized_escape = constant "G_REGEXERROR_UNRECOGNIZED_ESCAPE" uint32_t
and quantifiers_out_of_order = constant "G_REGEXERROR_QUANTIFIERS_OUT_OF_ORDER" uint32_t
and quantifier_too_big = constant "G_REGEXERROR_QUANTIFIER_TOO_BIG" uint32_t
and unterminated_character_class = constant "G_REGEXERROR_UNTERMINATED_CHARACTER_CLASS" uint32_t
and invalid_escape_in_character_class = constant "G_REGEXERROR_INVALID_ESCAPE_IN_CHARACTER_CLASS" uint32_t
and range_out_of_order = constant "G_REGEXERROR_RANGE_OUT_OF_ORDER" uint32_t
and nothing_to_repeat = constant "G_REGEXERROR_NOTHING_TO_REPEAT" uint32_t
and unrecognized_character = constant "G_REGEXERROR_UNRECOGNIZED_CHARACTER" uint32_t
and posix_named_class_outside_class = constant "G_REGEXERROR_POSIX_NAMED_CLASS_OUTSIDE_CLASS" uint32_t
and unmatched_parenthesis = constant "G_REGEXERROR_UNMATCHED_PARENTHESIS" uint32_t
and inexistent_subpattern_reference = constant "G_REGEXERROR_INEXISTENT_SUBPATTERN_REFERENCE" uint32_t
and unterminated_comment = constant "G_REGEXERROR_UNTERMINATED_COMMENT" uint32_t
and expression_too_large = constant "G_REGEXERROR_EXPRESSION_TOO_LARGE" uint32_t
and memory_error = constant "G_REGEXERROR_MEMORY_ERROR" uint32_t
and variable_length_lookbehind = constant "G_REGEXERROR_VARIABLE_LENGTH_LOOKBEHIND" uint32_t
and malformed_condition = constant "G_REGEXERROR_MALFORMED_CONDITION" uint32_t
and too_many_conditional_branches = constant "G_REGEXERROR_TOO_MANY_CONDITIONAL_BRANCHES" uint32_t
and assertion_expected = constant "G_REGEXERROR_ASSERTION_EXPECTED" uint32_t
and unknown_posix_class_name = constant "G_REGEXERROR_UNKNOWN_POSIX_CLASS_NAME" uint32_t
and posix_collating_elements_not_supported = constant "G_REGEXERROR_POSIX_COLLATING_ELEMENTS_NOT_SUPPORTED" uint32_t
and hex_code_too_large = constant "G_REGEXERROR_HEX_CODE_TOO_LARGE" uint32_t
and invalid_condition = constant "G_REGEXERROR_INVALID_CONDITION" uint32_t
and single_byte_match_in_lookbehind = constant "G_REGEXERROR_SINGLE_BYTE_MATCH_IN_LOOKBEHIND" uint32_t
and infinite_loop = constant "G_REGEXERROR_INFINITE_LOOP" uint32_t
and missing_subpattern_name_terminator = constant "G_REGEXERROR_MISSING_SUBPATTERN_NAME_TERMINATOR" uint32_t
and duplicate_subpattern_name = constant "G_REGEXERROR_DUPLICATE_SUBPATTERN_NAME" uint32_t
and malformed_property = constant "G_REGEXERROR_MALFORMED_PROPERTY" uint32_t
and unknown_property = constant "G_REGEXERROR_UNKNOWN_PROPERTY" uint32_t
and subpattern_name_too_long = constant "G_REGEXERROR_SUBPATTERN_NAME_TOO_LONG" uint32_t
and too_many_subpatterns = constant "G_REGEXERROR_TOO_MANY_SUBPATTERNS" uint32_t
and invalid_octal_value = constant "G_REGEXERROR_INVALID_OCTAL_VALUE" uint32_t
and too_many_branches_in_define = constant "G_REGEXERROR_TOO_MANY_BRANCHES_IN_DEFINE" uint32_t
and define_repetion = constant "G_REGEXERROR_DEFINE_REPETION" uint32_t
and inconsistent_newline_options = constant "G_REGEXERROR_INCONSISTENT_NEWLINE_OPTIONS" uint32_t
and missing_back_reference = constant "G_REGEXERROR_MISSING_BACK_REFERENCE" uint32_t
and invalid_relative_reference = constant "G_REGEXERROR_INVALID_RELATIVE_REFERENCE" uint32_t
and backtracking_control_verb_argument_forbidden = constant "G_REGEXERROR_BACKTRACKING_CONTROL_VERB_ARGUMENT_FORBIDDEN" uint32_t
and unknown_backtracking_control_verb = constant "G_REGEXERROR_UNKNOWN_BACKTRACKING_CONTROL_VERB" uint32_t
and number_too_big = constant "G_REGEXERROR_NUMBER_TOO_BIG" uint32_t
and missing_subpattern_name = constant "G_REGEXERROR_MISSING_SUBPATTERN_NAME" uint32_t
and missing_digit = constant "G_REGEXERROR_MISSING_DIGIT" uint32_t
and invalid_data_character = constant "G_REGEXERROR_INVALID_DATA_CHARACTER" uint32_t
and extra_subpattern_name = constant "G_REGEXERROR_EXTRA_SUBPATTERN_NAME" uint32_t
and backtracking_control_verb_argument_required = constant "G_REGEXERROR_BACKTRACKING_CONTROL_VERB_ARGUMENT_REQUIRED" uint32_t
and invalid_control_char = constant "G_REGEXERROR_INVALID_CONTROL_CHAR" uint32_t
and missing_name = constant "G_REGEXERROR_MISSING_NAME" uint32_t
and not_supported_in_class = constant "G_REGEXERROR_NOT_SUPPORTED_IN_CLASS" uint32_t
and too_many_forward_references = constant "G_REGEXERROR_TOO_MANY_FORWARD_REFERENCES" uint32_t
and name_too_long = constant "G_REGEXERROR_NAME_TOO_LONG" uint32_t
and character_value_too_large = constant "G_REGEXERROR_CHARACTER_VALUE_TOO_LARGE" uint32_t
let regexerror : [`Compile|`Optimize|`Replace|`Match|`Internal|`Stray_backslash|`Missing_control_char|`Unrecognized_escape|`Quantifiers_out_of_order|`Quantifier_too_big|`Unterminated_character_class|`Invalid_escape_in_character_class|`Range_out_of_order|`Nothing_to_repeat|`Unrecognized_character|`Posix_named_class_outside_class|`Unmatched_parenthesis|`Inexistent_subpattern_reference|`Unterminated_comment|`Expression_too_large|`Memory_error|`Variable_length_lookbehind|`Malformed_condition|`Too_many_conditional_branches|`Assertion_expected|`Unknown_posix_class_name|`Posix_collating_elements_not_supported|`Hex_code_too_large|`Invalid_condition|`Single_byte_match_in_lookbehind|`Infinite_loop|`Missing_subpattern_name_terminator|`Duplicate_subpattern_name|`Malformed_property|`Unknown_property|`Subpattern_name_too_long|`Too_many_subpatterns|`Invalid_octal_value|`Too_many_branches_in_define|`Define_repetion|`Inconsistent_newline_options|`Missing_back_reference|`Invalid_relative_reference|`Backtracking_control_verb_argument_forbidden|`Unknown_backtracking_control_verb|`Number_too_big|`Missing_subpattern_name|`Missing_digit|`Invalid_data_character|`Extra_subpattern_name|`Backtracking_control_verb_argument_required|`Invalid_control_char|`Missing_name|`Not_supported_in_class|`Too_many_forward_references|`Name_too_long|`Character_value_too_large] typ = enum "regexerror" [
`Compile, compile;
`Optimize, optimize;
`Replace, replace;
`Match, _match;
`Internal, internal;
`Stray_backslash, stray_backslash;
`Missing_control_char, missing_control_char;
`Unrecognized_escape, unrecognized_escape;
`Quantifiers_out_of_order, quantifiers_out_of_order;
`Quantifier_too_big, quantifier_too_big;
`Unterminated_character_class, unterminated_character_class;
`Invalid_escape_in_character_class, invalid_escape_in_character_class;
`Range_out_of_order, range_out_of_order;
`Nothing_to_repeat, nothing_to_repeat;
`Unrecognized_character, unrecognized_character;
`Posix_named_class_outside_class, posix_named_class_outside_class;
`Unmatched_parenthesis, unmatched_parenthesis;
`Inexistent_subpattern_reference, inexistent_subpattern_reference;
`Unterminated_comment, unterminated_comment;
`Expression_too_large, expression_too_large;
`Memory_error, memory_error;
`Variable_length_lookbehind, variable_length_lookbehind;
`Malformed_condition, malformed_condition;
`Too_many_conditional_branches, too_many_conditional_branches;
`Assertion_expected, assertion_expected;
`Unknown_posix_class_name, unknown_posix_class_name;
`Posix_collating_elements_not_supported, posix_collating_elements_not_supported;
`Hex_code_too_large, hex_code_too_large;
`Invalid_condition, invalid_condition;
`Single_byte_match_in_lookbehind, single_byte_match_in_lookbehind;
`Infinite_loop, infinite_loop;
`Missing_subpattern_name_terminator, missing_subpattern_name_terminator;
`Duplicate_subpattern_name, duplicate_subpattern_name;
`Malformed_property, malformed_property;
`Unknown_property, unknown_property;
`Subpattern_name_too_long, subpattern_name_too_long;
`Too_many_subpatterns, too_many_subpatterns;
`Invalid_octal_value, invalid_octal_value;
`Too_many_branches_in_define, too_many_branches_in_define;
`Define_repetion, define_repetion;
`Inconsistent_newline_options, inconsistent_newline_options;
`Missing_back_reference, missing_back_reference;
`Invalid_relative_reference, invalid_relative_reference;
`Backtracking_control_verb_argument_forbidden, backtracking_control_verb_argument_forbidden;
`Unknown_backtracking_control_verb, unknown_backtracking_control_verb;
`Number_too_big, number_too_big;
`Missing_subpattern_name, missing_subpattern_name;
`Missing_digit, missing_digit;
`Invalid_data_character, invalid_data_character;
`Extra_subpattern_name, extra_subpattern_name;
`Backtracking_control_verb_argument_required, backtracking_control_verb_argument_required;
`Invalid_control_char, invalid_control_char;
`Missing_name, missing_name;
`Not_supported_in_class, not_supported_in_class;
`Too_many_forward_references, too_many_forward_references;
`Name_too_long, name_too_long;
`Character_value_too_large, character_value_too_large
]
let _SEARCHPATH_SEPARATOR = 59
let _SEARCHPATH_SEPARATOR_S = ";"
let _SIZEOF_LONG = 8
let _SIZEOF_SIZE_T = 8
let _SIZEOF_SSIZE_T = 8
let _SIZEOF_VOID_P = 8
let _SOURCE_CONTINUE = true
let _SOURCE_REMOVE = false
let _SQRT2 = 1.414214
let _STR_DELIMITERS = "_-|> <."
let _SYSDEF_AF_INET = 2
let _SYSDEF_AF_INET6 = 10
let _SYSDEF_AF_UNIX = 1
let _SYSDEF_MSG_DONTROUTE = 4
let _SYSDEF_MSG_OOB = 1
let _SYSDEF_MSG_PEEK = 2
let cur = constant "G_SEEK_CUR" uint32_t
and set = constant "G_SEEK_SET" uint32_t
and end = constant "G_SEEK_END" uint32_t
let seektype : [`Cur|`Set|`End] typ = enum "seektype" [
`Cur, cur;
`Set, set;
`End, end
]
let bad_quoting = constant "G_SHELLERROR_BAD_QUOTING" uint32_t
and empty_string = constant "G_SHELLERROR_EMPTY_STRING" uint32_t
and failed = constant "G_SHELLERROR_FAILED" uint32_t
let shellerror : [`Bad_quoting|`Empty_string|`Failed] typ = enum "shellerror" [
`Bad_quoting, bad_quoting;
`Empty_string, empty_string;
`Failed, failed
]
let always_malloc = constant "G_SLICECONFIG_ALWAYS_MALLOC" uint32_t
and bypass_magazines = constant "G_SLICECONFIG_BYPASS_MAGAZINES" uint32_t
and working_set_msecs = constant "G_SLICECONFIG_WORKING_SET_MSECS" uint32_t
and color_increment = constant "G_SLICECONFIG_COLOR_INCREMENT" uint32_t
and chunk_sizes = constant "G_SLICECONFIG_CHUNK_SIZES" uint32_t
and contention_counter = constant "G_SLICECONFIG_CONTENTION_COUNTER" uint32_t
let sliceconfig : [`Always_malloc|`Bypass_magazines|`Working_set_msecs|`Color_increment|`Chunk_sizes|`Contention_counter] typ = enum "sliceconfig" [
`Always_malloc, always_malloc;
`Bypass_magazines, bypass_magazines;
`Working_set_msecs, working_set_msecs;
`Color_increment, color_increment;
`Chunk_sizes, chunk_sizes;
`Contention_counter, contention_counter
]
let fork = constant "G_SPAWNERROR_FORK" uint32_t
and read = constant "G_SPAWNERROR_READ" uint32_t
and chdir = constant "G_SPAWNERROR_CHDIR" uint32_t
and acces = constant "G_SPAWNERROR_ACCES" uint32_t
and perm = constant "G_SPAWNERROR_PERM" uint32_t
and too_big = constant "G_SPAWNERROR_TOO_BIG" uint32_t
and 2big = constant "G_SPAWNERROR_2BIG" uint32_t
and noexec = constant "G_SPAWNERROR_NOEXEC" uint32_t
and nametoolong = constant "G_SPAWNERROR_NAMETOOLONG" uint32_t
and noent = constant "G_SPAWNERROR_NOENT" uint32_t
and nomem = constant "G_SPAWNERROR_NOMEM" uint32_t
and notdir = constant "G_SPAWNERROR_NOTDIR" uint32_t
and loop = constant "G_SPAWNERROR_LOOP" uint32_t
and txtbusy = constant "G_SPAWNERROR_TXTBUSY" uint32_t
and io = constant "G_SPAWNERROR_IO" uint32_t
and nfile = constant "G_SPAWNERROR_NFILE" uint32_t
and mfile = constant "G_SPAWNERROR_MFILE" uint32_t
and inval = constant "G_SPAWNERROR_INVAL" uint32_t
and isdir = constant "G_SPAWNERROR_ISDIR" uint32_t
and libbad = constant "G_SPAWNERROR_LIBBAD" uint32_t
and failed = constant "G_SPAWNERROR_FAILED" uint32_t
let spawnerror : [`Fork|`Read|`Chdir|`Acces|`Perm|`Too_big|`2big|`Noexec|`Nametoolong|`Noent|`Nomem|`Notdir|`Loop|`Txtbusy|`Io|`Nfile|`Mfile|`Inval|`Isdir|`Libbad|`Failed] typ = enum "spawnerror" [
`Fork, fork;
`Read, read;
`Chdir, chdir;
`Acces, acces;
`Perm, perm;
`Too_big, too_big;
`2big, 2big;
`Noexec, noexec;
`Nametoolong, nametoolong;
`Noent, noent;
`Nomem, nomem;
`Notdir, notdir;
`Loop, loop;
`Txtbusy, txtbusy;
`Io, io;
`Nfile, nfile;
`Mfile, mfile;
`Inval, inval;
`Isdir, isdir;
`Libbad, libbad;
`Failed, failed
]
let _TIME_SPAN_DAY = 86400000000
let _TIME_SPAN_HOUR = 3600000000
let _TIME_SPAN_MILLISECOND = 1000
let _TIME_SPAN_MINUTE = 60000000
let _TIME_SPAN_SECOND = 1000000
let dist = constant "G_TESTFILE_DIST" uint32_t
and built = constant "G_TESTFILE_BUILT" uint32_t
let testfiletype : [`Dist|`Built] typ = enum "testfiletype" [
`Dist, dist;
`Built, built
]
let none = constant "G_TESTLOG_NONE" uint32_t
and error = constant "G_TESTLOG_ERROR" uint32_t
and start_binary = constant "G_TESTLOG_START_BINARY" uint32_t
and list_case = constant "G_TESTLOG_LIST_CASE" uint32_t
and skip_case = constant "G_TESTLOG_SKIP_CASE" uint32_t
and start_case = constant "G_TESTLOG_START_CASE" uint32_t
and stop_case = constant "G_TESTLOG_STOP_CASE" uint32_t
and min_result = constant "G_TESTLOG_MIN_RESULT" uint32_t
and max_result = constant "G_TESTLOG_MAX_RESULT" uint32_t
and message = constant "G_TESTLOG_MESSAGE" uint32_t
and start_suite = constant "G_TESTLOG_START_SUITE" uint32_t
and stop_suite = constant "G_TESTLOG_STOP_SUITE" uint32_t
let testlogtype : [`None|`Error|`Start_binary|`List_case|`Skip_case|`Start_case|`Stop_case|`Min_result|`Max_result|`Message|`Start_suite|`Stop_suite] typ = enum "testlogtype" [
`None, none;
`Error, error;
`Start_binary, start_binary;
`List_case, list_case;
`Skip_case, skip_case;
`Start_case, start_case;
`Stop_case, stop_case;
`Min_result, min_result;
`Max_result, max_result;
`Message, message;
`Start_suite, start_suite;
`Stop_suite, stop_suite
]
let thread_error_again = constant "G_THREADERROR_THREAD_ERROR_AGAIN" uint32_t
let threaderror : [`Thread_error_again] typ = enum "threaderror" [
`Thread_error_again, thread_error_again
]
let standard = constant "G_TIME_STANDARD" uint32_t
and daylight = constant "G_TIME_DAYLIGHT" uint32_t
and universal = constant "G_TIME_UNIVERSAL" uint32_t
let timetype : [`Standard|`Daylight|`Universal] typ = enum "timetype" [
`Standard, standard;
`Daylight, daylight;
`Universal, universal
]
let eof = constant "G_TOKEN_EOF" uint32_t
and left_paren = constant "G_TOKEN_LEFT_PAREN" uint32_t
and right_paren = constant "G_TOKEN_RIGHT_PAREN" uint32_t
and left_curly = constant "G_TOKEN_LEFT_CURLY" uint32_t
and right_curly = constant "G_TOKEN_RIGHT_CURLY" uint32_t
and left_brace = constant "G_TOKEN_LEFT_BRACE" uint32_t
and right_brace = constant "G_TOKEN_RIGHT_BRACE" uint32_t
and equal_sign = constant "G_TOKEN_EQUAL_SIGN" uint32_t
and comma = constant "G_TOKEN_COMMA" uint32_t
and none = constant "G_TOKEN_NONE" uint32_t
and error = constant "G_TOKEN_ERROR" uint32_t
and char = constant "G_TOKEN_CHAR" uint32_t
and binary = constant "G_TOKEN_BINARY" uint32_t
and octal = constant "G_TOKEN_OCTAL" uint32_t
and int = constant "G_TOKEN_INT" uint32_t
and hex = constant "G_TOKEN_HEX" uint32_t
and float = constant "G_TOKEN_FLOAT" uint32_t
and string = constant "G_TOKEN_STRING" uint32_t
and symbol = constant "G_TOKEN_SYMBOL" uint32_t
and identifier = constant "G_TOKEN_IDENTIFIER" uint32_t
and identifier_null = constant "G_TOKEN_IDENTIFIER_NULL" uint32_t
and comment_single = constant "G_TOKEN_COMMENT_SINGLE" uint32_t
and comment_multi = constant "G_TOKEN_COMMENT_MULTI" uint32_t
let tokentype : [`Eof|`Left_paren|`Right_paren|`Left_curly|`Right_curly|`Left_brace|`Right_brace|`Equal_sign|`Comma|`None|`Error|`Char|`Binary|`Octal|`Int|`Hex|`Float|`String|`Symbol|`Identifier|`Identifier_null|`Comment_single|`Comment_multi] typ = enum "tokentype" [
`Eof, eof;
`Left_paren, left_paren;
`Right_paren, right_paren;
`Left_curly, left_curly;
`Right_curly, right_curly;
`Left_brace, left_brace;
`Right_brace, right_brace;
`Equal_sign, equal_sign;
`Comma, comma;
`None, none;
`Error, error;
`Char, char;
`Binary, binary;
`Octal, octal;
`Int, int;
`Hex, hex;
`Float, float;
`String, string;
`Symbol, symbol;
`Identifier, identifier;
`Identifier_null, identifier_null;
`Comment_single, comment_single;
`Comment_multi, comment_multi
]
let in_order = constant "G_TRAVERSE_IN_ORDER" uint32_t
and pre_order = constant "G_TRAVERSE_PRE_ORDER" uint32_t
and post_order = constant "G_TRAVERSE_POST_ORDER" uint32_t
and level_order = constant "G_TRAVERSE_LEVEL_ORDER" uint32_t
let traversetype : [`In_order|`Pre_order|`Post_order|`Level_order] typ = enum "traversetype" [
`In_order, in_order;
`Pre_order, pre_order;
`Post_order, post_order;
`Level_order, level_order
]
let _UNICHAR_MAX_DECOMPOSITION_LENGTH = 18
let _URI_RESERVED_CHARS_GENERIC_DELIMITERS = ":/?#[]@"
let _URI_RESERVED_CHARS_SUBCOMPONENT_DELIMITERS = "!$&'()*+,;="
let _USEC_PER_SEC = 1000000
let mandatory = constant "G_UNICODEBREAK_MANDATORY" uint32_t
and carriage_return = constant "G_UNICODEBREAK_CARRIAGE_RETURN" uint32_t
and line_feed = constant "G_UNICODEBREAK_LINE_FEED" uint32_t
and combining_mark = constant "G_UNICODEBREAK_COMBINING_MARK" uint32_t
and surrogate = constant "G_UNICODEBREAK_SURROGATE" uint32_t
and zero_width_space = constant "G_UNICODEBREAK_ZERO_WIDTH_SPACE" uint32_t
and inseparable = constant "G_UNICODEBREAK_INSEPARABLE" uint32_t
and non_breaking_glue = constant "G_UNICODEBREAK_NON_BREAKING_GLUE" uint32_t
and contingent = constant "G_UNICODEBREAK_CONTINGENT" uint32_t
and space = constant "G_UNICODEBREAK_SPACE" uint32_t
and after = constant "G_UNICODEBREAK_AFTER" uint32_t
and before = constant "G_UNICODEBREAK_BEFORE" uint32_t
and before_and_after = constant "G_UNICODEBREAK_BEFORE_AND_AFTER" uint32_t
and hyphen = constant "G_UNICODEBREAK_HYPHEN" uint32_t
and non_starter = constant "G_UNICODEBREAK_NON_STARTER" uint32_t
and open_punctuation = constant "G_UNICODEBREAK_OPEN_PUNCTUATION" uint32_t
and close_punctuation = constant "G_UNICODEBREAK_CLOSE_PUNCTUATION" uint32_t
and quotation = constant "G_UNICODEBREAK_QUOTATION" uint32_t
and exclamation = constant "G_UNICODEBREAK_EXCLAMATION" uint32_t
and ideographic = constant "G_UNICODEBREAK_IDEOGRAPHIC" uint32_t
and numeric = constant "G_UNICODEBREAK_NUMERIC" uint32_t
and infix_separator = constant "G_UNICODEBREAK_INFIX_SEPARATOR" uint32_t
and symbol = constant "G_UNICODEBREAK_SYMBOL" uint32_t
and alphabetic = constant "G_UNICODEBREAK_ALPHABETIC" uint32_t
and prefix = constant "G_UNICODEBREAK_PREFIX" uint32_t
and postfix = constant "G_UNICODEBREAK_POSTFIX" uint32_t
and complex_context = constant "G_UNICODEBREAK_COMPLEX_CONTEXT" uint32_t
and ambiguous = constant "G_UNICODEBREAK_AMBIGUOUS" uint32_t
and unknown = constant "G_UNICODEBREAK_UNKNOWN" uint32_t
and next_line = constant "G_UNICODEBREAK_NEXT_LINE" uint32_t
and word_joiner = constant "G_UNICODEBREAK_WORD_JOINER" uint32_t
and hangul_l_jamo = constant "G_UNICODEBREAK_HANGUL_L_JAMO" uint32_t
and hangul_v_jamo = constant "G_UNICODEBREAK_HANGUL_V_JAMO" uint32_t
and hangul_t_jamo = constant "G_UNICODEBREAK_HANGUL_T_JAMO" uint32_t
and hangul_lv_syllable = constant "G_UNICODEBREAK_HANGUL_LV_SYLLABLE" uint32_t
and hangul_lvt_syllable = constant "G_UNICODEBREAK_HANGUL_LVT_SYLLABLE" uint32_t
and close_paranthesis = constant "G_UNICODEBREAK_CLOSE_PARANTHESIS" uint32_t
and conditional_japanese_starter = constant "G_UNICODEBREAK_CONDITIONAL_JAPANESE_STARTER" uint32_t
and hebrew_letter = constant "G_UNICODEBREAK_HEBREW_LETTER" uint32_t
and regional_indicator = constant "G_UNICODEBREAK_REGIONAL_INDICATOR" uint32_t
and emoji_base = constant "G_UNICODEBREAK_EMOJI_BASE" uint32_t
and emoji_modifier = constant "G_UNICODEBREAK_EMOJI_MODIFIER" uint32_t
and zero_width_joiner = constant "G_UNICODEBREAK_ZERO_WIDTH_JOINER" uint32_t
let unicodebreaktype : [`Mandatory|`Carriage_return|`Line_feed|`Combining_mark|`Surrogate|`Zero_width_space|`Inseparable|`Non_breaking_glue|`Contingent|`Space|`After|`Before|`Before_and_after|`Hyphen|`Non_starter|`Open_punctuation|`Close_punctuation|`Quotation|`Exclamation|`Ideographic|`Numeric|`Infix_separator|`Symbol|`Alphabetic|`Prefix|`Postfix|`Complex_context|`Ambiguous|`Unknown|`Next_line|`Word_joiner|`Hangul_l_jamo|`Hangul_v_jamo|`Hangul_t_jamo|`Hangul_lv_syllable|`Hangul_lvt_syllable|`Close_paranthesis|`Conditional_japanese_starter|`Hebrew_letter|`Regional_indicator|`Emoji_base|`Emoji_modifier|`Zero_width_joiner] typ = enum "unicodebreaktype" [
`Mandatory, mandatory;
`Carriage_return, carriage_return;
`Line_feed, line_feed;
`Combining_mark, combining_mark;
`Surrogate, surrogate;
`Zero_width_space, zero_width_space;
`Inseparable, inseparable;
`Non_breaking_glue, non_breaking_glue;
`Contingent, contingent;
`Space, space;
`After, after;
`Before, before;
`Before_and_after, before_and_after;
`Hyphen, hyphen;
`Non_starter, non_starter;
`Open_punctuation, open_punctuation;
`Close_punctuation, close_punctuation;
`Quotation, quotation;
`Exclamation, exclamation;
`Ideographic, ideographic;
`Numeric, numeric;
`Infix_separator, infix_separator;
`Symbol, symbol;
`Alphabetic, alphabetic;
`Prefix, prefix;
`Postfix, postfix;
`Complex_context, complex_context;
`Ambiguous, ambiguous;
`Unknown, unknown;
`Next_line, next_line;
`Word_joiner, word_joiner;
`Hangul_l_jamo, hangul_l_jamo;
`Hangul_v_jamo, hangul_v_jamo;
`Hangul_t_jamo, hangul_t_jamo;
`Hangul_lv_syllable, hangul_lv_syllable;
`Hangul_lvt_syllable, hangul_lvt_syllable;
`Close_paranthesis, close_paranthesis;
`Conditional_japanese_starter, conditional_japanese_starter;
`Hebrew_letter, hebrew_letter;
`Regional_indicator, regional_indicator;
`Emoji_base, emoji_base;
`Emoji_modifier, emoji_modifier;
`Zero_width_joiner, zero_width_joiner
]
let invalid_code = constant "G_UNICODESCRIPT_INVALID_CODE" int32_t
and common = constant "G_UNICODESCRIPT_COMMON" int32_t
and inherited = constant "G_UNICODESCRIPT_INHERITED" int32_t
and arabic = constant "G_UNICODESCRIPT_ARABIC" int32_t
and armenian = constant "G_UNICODESCRIPT_ARMENIAN" int32_t
and bengali = constant "G_UNICODESCRIPT_BENGALI" int32_t
and bopomofo = constant "G_UNICODESCRIPT_BOPOMOFO" int32_t
and cherokee = constant "G_UNICODESCRIPT_CHEROKEE" int32_t
and coptic = constant "G_UNICODESCRIPT_COPTIC" int32_t
and cyrillic = constant "G_UNICODESCRIPT_CYRILLIC" int32_t
and deseret = constant "G_UNICODESCRIPT_DESERET" int32_t
and devanagari = constant "G_UNICODESCRIPT_DEVANAGARI" int32_t
and ethiopic = constant "G_UNICODESCRIPT_ETHIOPIC" int32_t
and georgian = constant "G_UNICODESCRIPT_GEORGIAN" int32_t
and gothic = constant "G_UNICODESCRIPT_GOTHIC" int32_t
and greek = constant "G_UNICODESCRIPT_GREEK" int32_t
and gujarati = constant "G_UNICODESCRIPT_GUJARATI" int32_t
and gurmukhi = constant "G_UNICODESCRIPT_GURMUKHI" int32_t
and han = constant "G_UNICODESCRIPT_HAN" int32_t
and hangul = constant "G_UNICODESCRIPT_HANGUL" int32_t
and hebrew = constant "G_UNICODESCRIPT_HEBREW" int32_t
and hiragana = constant "G_UNICODESCRIPT_HIRAGANA" int32_t
and kannada = constant "G_UNICODESCRIPT_KANNADA" int32_t
and katakana = constant "G_UNICODESCRIPT_KATAKANA" int32_t
and khmer = constant "G_UNICODESCRIPT_KHMER" int32_t
and lao = constant "G_UNICODESCRIPT_LAO" int32_t
and latin = constant "G_UNICODESCRIPT_LATIN" int32_t
and malayalam = constant "G_UNICODESCRIPT_MALAYALAM" int32_t
and mongolian = constant "G_UNICODESCRIPT_MONGOLIAN" int32_t
and myanmar = constant "G_UNICODESCRIPT_MYANMAR" int32_t
and ogham = constant "G_UNICODESCRIPT_OGHAM" int32_t
and old_italic = constant "G_UNICODESCRIPT_OLD_ITALIC" int32_t
and oriya = constant "G_UNICODESCRIPT_ORIYA" int32_t
and runic = constant "G_UNICODESCRIPT_RUNIC" int32_t
and sinhala = constant "G_UNICODESCRIPT_SINHALA" int32_t
and syriac = constant "G_UNICODESCRIPT_SYRIAC" int32_t
and tamil = constant "G_UNICODESCRIPT_TAMIL" int32_t
and telugu = constant "G_UNICODESCRIPT_TELUGU" int32_t
and thaana = constant "G_UNICODESCRIPT_THAANA" int32_t
and thai = constant "G_UNICODESCRIPT_THAI" int32_t
and tibetan = constant "G_UNICODESCRIPT_TIBETAN" int32_t
and canadian_aboriginal = constant "G_UNICODESCRIPT_CANADIAN_ABORIGINAL" int32_t
and yi = constant "G_UNICODESCRIPT_YI" int32_t
and tagalog = constant "G_UNICODESCRIPT_TAGALOG" int32_t
and hanunoo = constant "G_UNICODESCRIPT_HANUNOO" int32_t
and buhid = constant "G_UNICODESCRIPT_BUHID" int32_t
and tagbanwa = constant "G_UNICODESCRIPT_TAGBANWA" int32_t
and braille = constant "G_UNICODESCRIPT_BRAILLE" int32_t
and cypriot = constant "G_UNICODESCRIPT_CYPRIOT" int32_t
and limbu = constant "G_UNICODESCRIPT_LIMBU" int32_t
and osmanya = constant "G_UNICODESCRIPT_OSMANYA" int32_t
and shavian = constant "G_UNICODESCRIPT_SHAVIAN" int32_t
and linear_b = constant "G_UNICODESCRIPT_LINEAR_B" int32_t
and tai_le = constant "G_UNICODESCRIPT_TAI_LE" int32_t
and ugaritic = constant "G_UNICODESCRIPT_UGARITIC" int32_t
and new_tai_lue = constant "G_UNICODESCRIPT_NEW_TAI_LUE" int32_t
and buginese = constant "G_UNICODESCRIPT_BUGINESE" int32_t
and glagolitic = constant "G_UNICODESCRIPT_GLAGOLITIC" int32_t
and tifinagh = constant "G_UNICODESCRIPT_TIFINAGH" int32_t
and syloti_nagri = constant "G_UNICODESCRIPT_SYLOTI_NAGRI" int32_t
and old_persian = constant "G_UNICODESCRIPT_OLD_PERSIAN" int32_t
and kharoshthi = constant "G_UNICODESCRIPT_KHAROSHTHI" int32_t
and unknown = constant "G_UNICODESCRIPT_UNKNOWN" int32_t
and balinese = constant "G_UNICODESCRIPT_BALINESE" int32_t
and cuneiform = constant "G_UNICODESCRIPT_CUNEIFORM" int32_t
and phoenician = constant "G_UNICODESCRIPT_PHOENICIAN" int32_t
and phags_pa = constant "G_UNICODESCRIPT_PHAGS_PA" int32_t
and nko = constant "G_UNICODESCRIPT_NKO" int32_t
and kayah_li = constant "G_UNICODESCRIPT_KAYAH_LI" int32_t
and lepcha = constant "G_UNICODESCRIPT_LEPCHA" int32_t
and rejang = constant "G_UNICODESCRIPT_REJANG" int32_t
and sundanese = constant "G_UNICODESCRIPT_SUNDANESE" int32_t
and saurashtra = constant "G_UNICODESCRIPT_SAURASHTRA" int32_t
and cham = constant "G_UNICODESCRIPT_CHAM" int32_t
and ol_chiki = constant "G_UNICODESCRIPT_OL_CHIKI" int32_t
and vai = constant "G_UNICODESCRIPT_VAI" int32_t
and carian = constant "G_UNICODESCRIPT_CARIAN" int32_t
and lycian = constant "G_UNICODESCRIPT_LYCIAN" int32_t
and lydian = constant "G_UNICODESCRIPT_LYDIAN" int32_t
and avestan = constant "G_UNICODESCRIPT_AVESTAN" int32_t
and bamum = constant "G_UNICODESCRIPT_BAMUM" int32_t
and egyptian_hieroglyphs = constant "G_UNICODESCRIPT_EGYPTIAN_HIEROGLYPHS" int32_t
and imperial_aramaic = constant "G_UNICODESCRIPT_IMPERIAL_ARAMAIC" int32_t
and inscriptional_pahlavi = constant "G_UNICODESCRIPT_INSCRIPTIONAL_PAHLAVI" int32_t
and inscriptional_parthian = constant "G_UNICODESCRIPT_INSCRIPTIONAL_PARTHIAN" int32_t
and javanese = constant "G_UNICODESCRIPT_JAVANESE" int32_t
and kaithi = constant "G_UNICODESCRIPT_KAITHI" int32_t
and lisu = constant "G_UNICODESCRIPT_LISU" int32_t
and meetei_mayek = constant "G_UNICODESCRIPT_MEETEI_MAYEK" int32_t
and old_south_arabian = constant "G_UNICODESCRIPT_OLD_SOUTH_ARABIAN" int32_t
and old_turkic = constant "G_UNICODESCRIPT_OLD_TURKIC" int32_t
and samaritan = constant "G_UNICODESCRIPT_SAMARITAN" int32_t
and tai_tham = constant "G_UNICODESCRIPT_TAI_THAM" int32_t
and tai_viet = constant "G_UNICODESCRIPT_TAI_VIET" int32_t
and batak = constant "G_UNICODESCRIPT_BATAK" int32_t
and brahmi = constant "G_UNICODESCRIPT_BRAHMI" int32_t
and mandaic = constant "G_UNICODESCRIPT_MANDAIC" int32_t
and chakma = constant "G_UNICODESCRIPT_CHAKMA" int32_t
and meroitic_cursive = constant "G_UNICODESCRIPT_MEROITIC_CURSIVE" int32_t
and meroitic_hieroglyphs = constant "G_UNICODESCRIPT_MEROITIC_HIEROGLYPHS" int32_t
and miao = constant "G_UNICODESCRIPT_MIAO" int32_t
and sharada = constant "G_UNICODESCRIPT_SHARADA" int32_t
and sora_sompeng = constant "G_UNICODESCRIPT_SORA_SOMPENG" int32_t
and takri = constant "G_UNICODESCRIPT_TAKRI" int32_t
and bassa_vah = constant "G_UNICODESCRIPT_BASSA_VAH" int32_t
and caucasian_albanian = constant "G_UNICODESCRIPT_CAUCASIAN_ALBANIAN" int32_t
and duployan = constant "G_UNICODESCRIPT_DUPLOYAN" int32_t
and elbasan = constant "G_UNICODESCRIPT_ELBASAN" int32_t
and grantha = constant "G_UNICODESCRIPT_GRANTHA" int32_t
and khojki = constant "G_UNICODESCRIPT_KHOJKI" int32_t
and khudawadi = constant "G_UNICODESCRIPT_KHUDAWADI" int32_t
and linear_a = constant "G_UNICODESCRIPT_LINEAR_A" int32_t
and mahajani = constant "G_UNICODESCRIPT_MAHAJANI" int32_t
and manichaean = constant "G_UNICODESCRIPT_MANICHAEAN" int32_t
and mende_kikakui = constant "G_UNICODESCRIPT_MENDE_KIKAKUI" int32_t
and modi = constant "G_UNICODESCRIPT_MODI" int32_t
and mro = constant "G_UNICODESCRIPT_MRO" int32_t
and nabataean = constant "G_UNICODESCRIPT_NABATAEAN" int32_t
and old_north_arabian = constant "G_UNICODESCRIPT_OLD_NORTH_ARABIAN" int32_t
and old_permic = constant "G_UNICODESCRIPT_OLD_PERMIC" int32_t
and pahawh_hmong = constant "G_UNICODESCRIPT_PAHAWH_HMONG" int32_t
and palmyrene = constant "G_UNICODESCRIPT_PALMYRENE" int32_t
and pau_cin_hau = constant "G_UNICODESCRIPT_PAU_CIN_HAU" int32_t
and psalter_pahlavi = constant "G_UNICODESCRIPT_PSALTER_PAHLAVI" int32_t
and siddham = constant "G_UNICODESCRIPT_SIDDHAM" int32_t
and tirhuta = constant "G_UNICODESCRIPT_TIRHUTA" int32_t
and warang_citi = constant "G_UNICODESCRIPT_WARANG_CITI" int32_t
and ahom = constant "G_UNICODESCRIPT_AHOM" int32_t
and anatolian_hieroglyphs = constant "G_UNICODESCRIPT_ANATOLIAN_HIEROGLYPHS" int32_t
and hatran = constant "G_UNICODESCRIPT_HATRAN" int32_t
and multani = constant "G_UNICODESCRIPT_MULTANI" int32_t
and old_hungarian = constant "G_UNICODESCRIPT_OLD_HUNGARIAN" int32_t
and signwriting = constant "G_UNICODESCRIPT_SIGNWRITING" int32_t
and adlam = constant "G_UNICODESCRIPT_ADLAM" int32_t
and bhaiksuki = constant "G_UNICODESCRIPT_BHAIKSUKI" int32_t
and marchen = constant "G_UNICODESCRIPT_MARCHEN" int32_t
and newa = constant "G_UNICODESCRIPT_NEWA" int32_t
and osage = constant "G_UNICODESCRIPT_OSAGE" int32_t
and tangut = constant "G_UNICODESCRIPT_TANGUT" int32_t
let unicodescript : [`Invalid_code|`Common|`Inherited|`Arabic|`Armenian|`Bengali|`Bopomofo|`Cherokee|`Coptic|`Cyrillic|`Deseret|`Devanagari|`Ethiopic|`Georgian|`Gothic|`Greek|`Gujarati|`Gurmukhi|`Han|`Hangul|`Hebrew|`Hiragana|`Kannada|`Katakana|`Khmer|`Lao|`Latin|`Malayalam|`Mongolian|`Myanmar|`Ogham|`Old_italic|`Oriya|`Runic|`Sinhala|`Syriac|`Tamil|`Telugu|`Thaana|`Thai|`Tibetan|`Canadian_aboriginal|`Yi|`Tagalog|`Hanunoo|`Buhid|`Tagbanwa|`Braille|`Cypriot|`Limbu|`Osmanya|`Shavian|`Linear_b|`Tai_le|`Ugaritic|`New_tai_lue|`Buginese|`Glagolitic|`Tifinagh|`Syloti_nagri|`Old_persian|`Kharoshthi|`Unknown|`Balinese|`Cuneiform|`Phoenician|`Phags_pa|`Nko|`Kayah_li|`Lepcha|`Rejang|`Sundanese|`Saurashtra|`Cham|`Ol_chiki|`Vai|`Carian|`Lycian|`Lydian|`Avestan|`Bamum|`Egyptian_hieroglyphs|`Imperial_aramaic|`Inscriptional_pahlavi|`Inscriptional_parthian|`Javanese|`Kaithi|`Lisu|`Meetei_mayek|`Old_south_arabian|`Old_turkic|`Samaritan|`Tai_tham|`Tai_viet|`Batak|`Brahmi|`Mandaic|`Chakma|`Meroitic_cursive|`Meroitic_hieroglyphs|`Miao|`Sharada|`Sora_sompeng|`Takri|`Bassa_vah|`Caucasian_albanian|`Duployan|`Elbasan|`Grantha|`Khojki|`Khudawadi|`Linear_a|`Mahajani|`Manichaean|`Mende_kikakui|`Modi|`Mro|`Nabataean|`Old_north_arabian|`Old_permic|`Pahawh_hmong|`Palmyrene|`Pau_cin_hau|`Psalter_pahlavi|`Siddham|`Tirhuta|`Warang_citi|`Ahom|`Anatolian_hieroglyphs|`Hatran|`Multani|`Old_hungarian|`Signwriting|`Adlam|`Bhaiksuki|`Marchen|`Newa|`Osage|`Tangut] typ = enum "unicodescript" [
`Invalid_code, invalid_code;
`Common, common;
`Inherited, inherited;
`Arabic, arabic;
`Armenian, armenian;
`Bengali, bengali;
`Bopomofo, bopomofo;
`Cherokee, cherokee;
`Coptic, coptic;
`Cyrillic, cyrillic;
`Deseret, deseret;
`Devanagari, devanagari;
`Ethiopic, ethiopic;
`Georgian, georgian;
`Gothic, gothic;
`Greek, greek;
`Gujarati, gujarati;
`Gurmukhi, gurmukhi;
`Han, han;
`Hangul, hangul;
`Hebrew, hebrew;
`Hiragana, hiragana;
`Kannada, kannada;
`Katakana, katakana;
`Khmer, khmer;
`Lao, lao;
`Latin, latin;
`Malayalam, malayalam;
`Mongolian, mongolian;
`Myanmar, myanmar;
`Ogham, ogham;
`Old_italic, old_italic;
`Oriya, oriya;
`Runic, runic;
`Sinhala, sinhala;
`Syriac, syriac;
`Tamil, tamil;
`Telugu, telugu;
`Thaana, thaana;
`Thai, thai;
`Tibetan, tibetan;
`Canadian_aboriginal, canadian_aboriginal;
`Yi, yi;
`Tagalog, tagalog;
`Hanunoo, hanunoo;
`Buhid, buhid;
`Tagbanwa, tagbanwa;
`Braille, braille;
`Cypriot, cypriot;
`Limbu, limbu;
`Osmanya, osmanya;
`Shavian, shavian;
`Linear_b, linear_b;
`Tai_le, tai_le;
`Ugaritic, ugaritic;
`New_tai_lue, new_tai_lue;
`Buginese, buginese;
`Glagolitic, glagolitic;
`Tifinagh, tifinagh;
`Syloti_nagri, syloti_nagri;
`Old_persian, old_persian;
`Kharoshthi, kharoshthi;
`Unknown, unknown;
`Balinese, balinese;
`Cuneiform, cuneiform;
`Phoenician, phoenician;
`Phags_pa, phags_pa;
`Nko, nko;
`Kayah_li, kayah_li;
`Lepcha, lepcha;
`Rejang, rejang;
`Sundanese, sundanese;
`Saurashtra, saurashtra;
`Cham, cham;
`Ol_chiki, ol_chiki;
`Vai, vai;
`Carian, carian;
`Lycian, lycian;
`Lydian, lydian;
`Avestan, avestan;
`Bamum, bamum;
`Egyptian_hieroglyphs, egyptian_hieroglyphs;
`Imperial_aramaic, imperial_aramaic;
`Inscriptional_pahlavi, inscriptional_pahlavi;
`Inscriptional_parthian, inscriptional_parthian;
`Javanese, javanese;
`Kaithi, kaithi;
`Lisu, lisu;
`Meetei_mayek, meetei_mayek;
`Old_south_arabian, old_south_arabian;
`Old_turkic, old_turkic;
`Samaritan, samaritan;
`Tai_tham, tai_tham;
`Tai_viet, tai_viet;
`Batak, batak;
`Brahmi, brahmi;
`Mandaic, mandaic;
`Chakma, chakma;
`Meroitic_cursive, meroitic_cursive;
`Meroitic_hieroglyphs, meroitic_hieroglyphs;
`Miao, miao;
`Sharada, sharada;
`Sora_sompeng, sora_sompeng;
`Takri, takri;
`Bassa_vah, bassa_vah;
`Caucasian_albanian, caucasian_albanian;
`Duployan, duployan;
`Elbasan, elbasan;
`Grantha, grantha;
`Khojki, khojki;
`Khudawadi, khudawadi;
`Linear_a, linear_a;
`Mahajani, mahajani;
`Manichaean, manichaean;
`Mende_kikakui, mende_kikakui;
`Modi, modi;
`Mro, mro;
`Nabataean, nabataean;
`Old_north_arabian, old_north_arabian;
`Old_permic, old_permic;
`Pahawh_hmong, pahawh_hmong;
`Palmyrene, palmyrene;
`Pau_cin_hau, pau_cin_hau;
`Psalter_pahlavi, psalter_pahlavi;
`Siddham, siddham;
`Tirhuta, tirhuta;
`Warang_citi, warang_citi;
`Ahom, ahom;
`Anatolian_hieroglyphs, anatolian_hieroglyphs;
`Hatran, hatran;
`Multani, multani;
`Old_hungarian, old_hungarian;
`Signwriting, signwriting;
`Adlam, adlam;
`Bhaiksuki, bhaiksuki;
`Marchen, marchen;
`Newa, newa;
`Osage, osage;
`Tangut, tangut
]
let control = constant "G_UNICODE_CONTROL" uint32_t
and format = constant "G_UNICODE_FORMAT" uint32_t
and unassigned = constant "G_UNICODE_UNASSIGNED" uint32_t
and private_use = constant "G_UNICODE_PRIVATE_USE" uint32_t
and surrogate = constant "G_UNICODE_SURROGATE" uint32_t
and lowercase_letter = constant "G_UNICODE_LOWERCASE_LETTER" uint32_t
and modifier_letter = constant "G_UNICODE_MODIFIER_LETTER" uint32_t
and other_letter = constant "G_UNICODE_OTHER_LETTER" uint32_t
and titlecase_letter = constant "G_UNICODE_TITLECASE_LETTER" uint32_t
and uppercase_letter = constant "G_UNICODE_UPPERCASE_LETTER" uint32_t
and spacing_mark = constant "G_UNICODE_SPACING_MARK" uint32_t
and enclosing_mark = constant "G_UNICODE_ENCLOSING_MARK" uint32_t
and non_spacing_mark = constant "G_UNICODE_NON_SPACING_MARK" uint32_t
and decimal_number = constant "G_UNICODE_DECIMAL_NUMBER" uint32_t
and letter_number = constant "G_UNICODE_LETTER_NUMBER" uint32_t
and other_number = constant "G_UNICODE_OTHER_NUMBER" uint32_t
and connect_punctuation = constant "G_UNICODE_CONNECT_PUNCTUATION" uint32_t
and dash_punctuation = constant "G_UNICODE_DASH_PUNCTUATION" uint32_t
and close_punctuation = constant "G_UNICODE_CLOSE_PUNCTUATION" uint32_t
and final_punctuation = constant "G_UNICODE_FINAL_PUNCTUATION" uint32_t
and initial_punctuation = constant "G_UNICODE_INITIAL_PUNCTUATION" uint32_t
and other_punctuation = constant "G_UNICODE_OTHER_PUNCTUATION" uint32_t
and open_punctuation = constant "G_UNICODE_OPEN_PUNCTUATION" uint32_t
and currency_symbol = constant "G_UNICODE_CURRENCY_SYMBOL" uint32_t
and modifier_symbol = constant "G_UNICODE_MODIFIER_SYMBOL" uint32_t
and math_symbol = constant "G_UNICODE_MATH_SYMBOL" uint32_t
and other_symbol = constant "G_UNICODE_OTHER_SYMBOL" uint32_t
and line_separator = constant "G_UNICODE_LINE_SEPARATOR" uint32_t
and paragraph_separator = constant "G_UNICODE_PARAGRAPH_SEPARATOR" uint32_t
and space_separator = constant "G_UNICODE_SPACE_SEPARATOR" uint32_t
let unicodetype : [`Control|`Format|`Unassigned|`Private_use|`Surrogate|`Lowercase_letter|`Modifier_letter|`Other_letter|`Titlecase_letter|`Uppercase_letter|`Spacing_mark|`Enclosing_mark|`Non_spacing_mark|`Decimal_number|`Letter_number|`Other_number|`Connect_punctuation|`Dash_punctuation|`Close_punctuation|`Final_punctuation|`Initial_punctuation|`Other_punctuation|`Open_punctuation|`Currency_symbol|`Modifier_symbol|`Math_symbol|`Other_symbol|`Line_separator|`Paragraph_separator|`Space_separator] typ = enum "unicodetype" [
`Control, control;
`Format, format;
`Unassigned, unassigned;
`Private_use, private_use;
`Surrogate, surrogate;
`Lowercase_letter, lowercase_letter;
`Modifier_letter, modifier_letter;
`Other_letter, other_letter;
`Titlecase_letter, titlecase_letter;
`Uppercase_letter, uppercase_letter;
`Spacing_mark, spacing_mark;
`Enclosing_mark, enclosing_mark;
`Non_spacing_mark, non_spacing_mark;
`Decimal_number, decimal_number;
`Letter_number, letter_number;
`Other_number, other_number;
`Connect_punctuation, connect_punctuation;
`Dash_punctuation, dash_punctuation;
`Close_punctuation, close_punctuation;
`Final_punctuation, final_punctuation;
`Initial_punctuation, initial_punctuation;
`Other_punctuation, other_punctuation;
`Open_punctuation, open_punctuation;
`Currency_symbol, currency_symbol;
`Modifier_symbol, modifier_symbol;
`Math_symbol, math_symbol;
`Other_symbol, other_symbol;
`Line_separator, line_separator;
`Paragraph_separator, paragraph_separator;
`Space_separator, space_separator
]
let directory_desktop = constant "G_USERDIRECTORY_DIRECTORY_DESKTOP" uint32_t
and directory_documents = constant "G_USERDIRECTORY_DIRECTORY_DOCUMENTS" uint32_t
and directory_download = constant "G_USERDIRECTORY_DIRECTORY_DOWNLOAD" uint32_t
and directory_music = constant "G_USERDIRECTORY_DIRECTORY_MUSIC" uint32_t
and directory_pictures = constant "G_USERDIRECTORY_DIRECTORY_PICTURES" uint32_t
and directory_public_share = constant "G_USERDIRECTORY_DIRECTORY_PUBLIC_SHARE" uint32_t
and directory_templates = constant "G_USERDIRECTORY_DIRECTORY_TEMPLATES" uint32_t
and directory_videos = constant "G_USERDIRECTORY_DIRECTORY_VIDEOS" uint32_t
and n_directories = constant "G_USERDIRECTORY_N_DIRECTORIES" uint32_t
let userdirectory : [`Directory_desktop|`Directory_documents|`Directory_download|`Directory_music|`Directory_pictures|`Directory_public_share|`Directory_templates|`Directory_videos|`N_directories] typ = enum "userdirectory" [
`Directory_desktop, directory_desktop;
`Directory_documents, directory_documents;
`Directory_download, directory_download;
`Directory_music, directory_music;
`Directory_pictures, directory_pictures;
`Directory_public_share, directory_public_share;
`Directory_templates, directory_templates;
`Directory_videos, directory_videos;
`N_directories, n_directories
]
let _VA_COPY_AS_ARRAY = 1
let _VERSION_MIN_REQUIRED = 2
let boolean = constant "G_VARIANTCLASS_BOOLEAN" uint32_t
and byte = constant "G_VARIANTCLASS_BYTE" uint32_t
and int16 = constant "G_VARIANTCLASS_INT16" uint32_t
and uint16 = constant "G_VARIANTCLASS_UINT16" uint32_t
and int32 = constant "G_VARIANTCLASS_INT32" uint32_t
and uint32 = constant "G_VARIANTCLASS_UINT32" uint32_t
and int64 = constant "G_VARIANTCLASS_INT64" uint32_t
and uint64 = constant "G_VARIANTCLASS_UINT64" uint32_t
and handle = constant "G_VARIANTCLASS_HANDLE" uint32_t
and double = constant "G_VARIANTCLASS_DOUBLE" uint32_t
and string = constant "G_VARIANTCLASS_STRING" uint32_t
and object_path = constant "G_VARIANTCLASS_OBJECT_PATH" uint32_t
and signature = constant "G_VARIANTCLASS_SIGNATURE" uint32_t
and variant = constant "G_VARIANTCLASS_VARIANT" uint32_t
and maybe = constant "G_VARIANTCLASS_MAYBE" uint32_t
and array = constant "G_VARIANTCLASS_ARRAY" uint32_t
and tuple = constant "G_VARIANTCLASS_TUPLE" uint32_t
and dict_entry = constant "G_VARIANTCLASS_DICT_ENTRY" uint32_t
let variantclass : [`Boolean|`Byte|`Int16|`Uint16|`Int32|`Uint32|`Int64|`Uint64|`Handle|`Double|`String|`Object_path|`Signature|`Variant|`Maybe|`Array|`Tuple|`Dict_entry] typ = enum "variantclass" [
`Boolean, boolean;
`Byte, byte;
`Int16, int16;
`Uint16, uint16;
`Int32, int32;
`Uint32, uint32;
`Int64, int64;
`Uint64, uint64;
`Handle, handle;
`Double, double;
`String, string;
`Object_path, object_path;
`Signature, signature;
`Variant, variant;
`Maybe, maybe;
`Array, array;
`Tuple, tuple;
`Dict_entry, dict_entry
]
let failed = constant "G_VARIANTPARSEERROR_FAILED" uint32_t
and basic_type_expected = constant "G_VARIANTPARSEERROR_BASIC_TYPE_EXPECTED" uint32_t
and cannot_infer_type = constant "G_VARIANTPARSEERROR_CANNOT_INFER_TYPE" uint32_t
and definite_type_expected = constant "G_VARIANTPARSEERROR_DEFINITE_TYPE_EXPECTED" uint32_t
and input_not_at_end = constant "G_VARIANTPARSEERROR_INPUT_NOT_AT_END" uint32_t
and invalid_character = constant "G_VARIANTPARSEERROR_INVALID_CHARACTER" uint32_t
and invalid_format_string = constant "G_VARIANTPARSEERROR_INVALID_FORMAT_STRING" uint32_t
and invalid_object_path = constant "G_VARIANTPARSEERROR_INVALID_OBJECT_PATH" uint32_t
and invalid_signature = constant "G_VARIANTPARSEERROR_INVALID_SIGNATURE" uint32_t
and invalid_type_string = constant "G_VARIANTPARSEERROR_INVALID_TYPE_STRING" uint32_t
and no_common_type = constant "G_VARIANTPARSEERROR_NO_COMMON_TYPE" uint32_t
and number_out_of_range = constant "G_VARIANTPARSEERROR_NUMBER_OUT_OF_RANGE" uint32_t
and number_too_big = constant "G_VARIANTPARSEERROR_NUMBER_TOO_BIG" uint32_t
and type_error = constant "G_VARIANTPARSEERROR_TYPE_ERROR" uint32_t
and unexpected_token = constant "G_VARIANTPARSEERROR_UNEXPECTED_TOKEN" uint32_t
and unknown_keyword = constant "G_VARIANTPARSEERROR_UNKNOWN_KEYWORD" uint32_t
and unterminated_string_constant = constant "G_VARIANTPARSEERROR_UNTERMINATED_STRING_CONSTANT" uint32_t
and value_expected = constant "G_VARIANTPARSEERROR_VALUE_EXPECTED" uint32_t
let variantparseerror : [`Failed|`Basic_type_expected|`Cannot_infer_type|`Definite_type_expected|`Input_not_at_end|`Invalid_character|`Invalid_format_string|`Invalid_object_path|`Invalid_signature|`Invalid_type_string|`No_common_type|`Number_out_of_range|`Number_too_big|`Type_error|`Unexpected_token|`Unknown_keyword|`Unterminated_string_constant|`Value_expected] typ = enum "variantparseerror" [
`Failed, failed;
`Basic_type_expected, basic_type_expected;
`Cannot_infer_type, cannot_infer_type;
`Definite_type_expected, definite_type_expected;
`Input_not_at_end, input_not_at_end;
`Invalid_character, invalid_character;
`Invalid_format_string, invalid_format_string;
`Invalid_object_path, invalid_object_path;
`Invalid_signature, invalid_signature;
`Invalid_type_string, invalid_type_string;
`No_common_type, no_common_type;
`Number_out_of_range, number_out_of_range;
`Number_too_big, number_too_big;
`Type_error, type_error;
`Unexpected_token, unexpected_token;
`Unknown_keyword, unknown_keyword;
`Unterminated_string_constant, unterminated_string_constant;
`Value_expected, value_expected
]
let _WIN32_MSG_HANDLE = 19981206
