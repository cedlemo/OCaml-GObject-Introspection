open Ctypes
open Foreign

let _ANALYZER_ANALYZING = Int32.of_string "1"

let _ASCII_DTOSTR_BUF_SIZE = Int32.of_string "39"

type asciitype = Alnum | Alpha | Cntrl | Digit | Graph | Lower | Print | Punct | Space | Upper | Xdigit
type asciitype_list = asciitype list
let asciitype_of_value v =
if v = Unsigned.UInt32.of_int 1 then Alnum
else if v = Unsigned.UInt32.of_int 2 then Alpha
else if v = Unsigned.UInt32.of_int 4 then Cntrl
else if v = Unsigned.UInt32.of_int 8 then Digit
else if v = Unsigned.UInt32.of_int 16 then Graph
else if v = Unsigned.UInt32.of_int 32 then Lower
else if v = Unsigned.UInt32.of_int 64 then Print
else if v = Unsigned.UInt32.of_int 128 then Punct
else if v = Unsigned.UInt32.of_int 256 then Space
else if v = Unsigned.UInt32.of_int 512 then Upper
else if v = Unsigned.UInt32.of_int 1024 then Xdigit
else raise (Invalid_argument "Unexpected AsciiType value")
let asciitype_to_value = function
| Alnum -> Unsigned.UInt32.of_int 1
| Alpha -> Unsigned.UInt32.of_int 2
| Cntrl -> Unsigned.UInt32.of_int 4
| Digit -> Unsigned.UInt32.of_int 8
| Graph -> Unsigned.UInt32.of_int 16
| Lower -> Unsigned.UInt32.of_int 32
| Print -> Unsigned.UInt32.of_int 64
| Punct -> Unsigned.UInt32.of_int 128
| Space -> Unsigned.UInt32.of_int 256
| Upper -> Unsigned.UInt32.of_int 512
| Xdigit -> Unsigned.UInt32.of_int 1024
let asciitype_list_of_value v =
let open Unsigned.UInt32 in
let flags = [] in
if ((logand v (of_int 1)) != zero) then ignore (Alnum :: flags);
if ((logand v (of_int 2)) != zero) then ignore (Alpha :: flags);
if ((logand v (of_int 4)) != zero) then ignore (Cntrl :: flags);
if ((logand v (of_int 8)) != zero) then ignore (Digit :: flags);
if ((logand v (of_int 16)) != zero) then ignore (Graph :: flags);
if ((logand v (of_int 32)) != zero) then ignore (Lower :: flags);
if ((logand v (of_int 64)) != zero) then ignore (Print :: flags);
if ((logand v (of_int 128)) != zero) then ignore (Punct :: flags);
if ((logand v (of_int 256)) != zero) then ignore (Space :: flags);
if ((logand v (of_int 512)) != zero) then ignore (Upper :: flags);
if ((logand v (of_int 1024)) != zero) then ignore (Xdigit :: flags);
flags
let asciitype_list_to_value flags =
let open Unsigned.UInt32 in
let rec logor_flags l acc =
match l with
| [] -> acc
| f :: q -> let v = asciitype_to_value f in
let acc' = logor acc v in
logor_flags q acc'
in
logor_flags flags zero
let asciitype_list = view 
~read:asciitype_list_of_value 
~write:asciitype_list_to_value 
uint32_t

let _BIG_ENDIAN = Int32.of_string "4321"

type bookmarkfileerror = Invalid_uri | Invalid_value | App_not_registered | Uri_not_found | Read | Unknown_encoding | Write | File_not_found
let bookmarkfileerror_of_value v =
if v = Unsigned.UInt32.of_int 0 then Invalid_uri
else if v = Unsigned.UInt32.of_int 1 then Invalid_value
else if v = Unsigned.UInt32.of_int 2 then App_not_registered
else if v = Unsigned.UInt32.of_int 3 then Uri_not_found
else if v = Unsigned.UInt32.of_int 4 then Read
else if v = Unsigned.UInt32.of_int 5 then Unknown_encoding
else if v = Unsigned.UInt32.of_int 6 then Write
else if v = Unsigned.UInt32.of_int 7 then File_not_found
else raise (Invalid_argument "Unexpected BookmarkFileError value")
let bookmarkfileerror_to_value = function
| Invalid_uri -> Unsigned.UInt32.of_int 0
| Invalid_value -> Unsigned.UInt32.of_int 1
| App_not_registered -> Unsigned.UInt32.of_int 2
| Uri_not_found -> Unsigned.UInt32.of_int 3
| Read -> Unsigned.UInt32.of_int 4
| Unknown_encoding -> Unsigned.UInt32.of_int 5
| Write -> Unsigned.UInt32.of_int 6
| File_not_found -> Unsigned.UInt32.of_int 7
let bookmarkfileerror = view 
~read:bookmarkfileerror_of_value 
~write:bookmarkfileerror_to_value 
uint32_t

let _CSET_A_2_Z = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"

let _CSET_DIGITS = "0123456789"

let _CSET_a_2_z = "abcdefghijklmnopqrstuvwxyz"

type checksumtype = Md5 | Sha1 | Sha256 | Sha512 | Sha384
let checksumtype_of_value v =
if v = Unsigned.UInt32.of_int 0 then Md5
else if v = Unsigned.UInt32.of_int 1 then Sha1
else if v = Unsigned.UInt32.of_int 2 then Sha256
else if v = Unsigned.UInt32.of_int 3 then Sha512
else if v = Unsigned.UInt32.of_int 4 then Sha384
else raise (Invalid_argument "Unexpected ChecksumType value")
let checksumtype_to_value = function
| Md5 -> Unsigned.UInt32.of_int 0
| Sha1 -> Unsigned.UInt32.of_int 1
| Sha256 -> Unsigned.UInt32.of_int 2
| Sha512 -> Unsigned.UInt32.of_int 3
| Sha384 -> Unsigned.UInt32.of_int 4
let checksumtype = view 
~read:checksumtype_of_value 
~write:checksumtype_to_value 
uint32_t

type converterror = No_conversion | Illegal_sequence | Failed | Partial_input | Bad_uri | Not_absolute_path | No_memory
let converterror_of_value v =
if v = Unsigned.UInt32.of_int 0 then No_conversion
else if v = Unsigned.UInt32.of_int 1 then Illegal_sequence
else if v = Unsigned.UInt32.of_int 2 then Failed
else if v = Unsigned.UInt32.of_int 3 then Partial_input
else if v = Unsigned.UInt32.of_int 4 then Bad_uri
else if v = Unsigned.UInt32.of_int 5 then Not_absolute_path
else if v = Unsigned.UInt32.of_int 6 then No_memory
else raise (Invalid_argument "Unexpected ConvertError value")
let converterror_to_value = function
| No_conversion -> Unsigned.UInt32.of_int 0
| Illegal_sequence -> Unsigned.UInt32.of_int 1
| Failed -> Unsigned.UInt32.of_int 2
| Partial_input -> Unsigned.UInt32.of_int 3
| Bad_uri -> Unsigned.UInt32.of_int 4
| Not_absolute_path -> Unsigned.UInt32.of_int 5
| No_memory -> Unsigned.UInt32.of_int 6
let converterror = view 
~read:converterror_of_value 
~write:converterror_to_value 
uint32_t

let _DATALIST_FLAGS_MASK = Int32.of_string "3"

let _DATE_BAD_DAY = Int32.of_string "0"

let _DATE_BAD_JULIAN = Int32.of_string "0"

let _DATE_BAD_YEAR = Int32.of_string "0"

let _DIR_SEPARATOR = Int32.of_string "92"

let _DIR_SEPARATOR_S = "\\"

type datedmy = Day | Month | Year
let datedmy_of_value v =
if v = Unsigned.UInt32.of_int 0 then Day
else if v = Unsigned.UInt32.of_int 1 then Month
else if v = Unsigned.UInt32.of_int 2 then Year
else raise (Invalid_argument "Unexpected DateDMY value")
let datedmy_to_value = function
| Day -> Unsigned.UInt32.of_int 0
| Month -> Unsigned.UInt32.of_int 1
| Year -> Unsigned.UInt32.of_int 2
let datedmy = view 
~read:datedmy_of_value 
~write:datedmy_to_value 
uint32_t

type datemonth = Bad_month | January | February | March | April | May | June | July | August | September | October | November | December
let datemonth_of_value v =
if v = Unsigned.UInt32.of_int 0 then Bad_month
else if v = Unsigned.UInt32.of_int 1 then January
else if v = Unsigned.UInt32.of_int 2 then February
else if v = Unsigned.UInt32.of_int 3 then March
else if v = Unsigned.UInt32.of_int 4 then April
else if v = Unsigned.UInt32.of_int 5 then May
else if v = Unsigned.UInt32.of_int 6 then June
else if v = Unsigned.UInt32.of_int 7 then July
else if v = Unsigned.UInt32.of_int 8 then August
else if v = Unsigned.UInt32.of_int 9 then September
else if v = Unsigned.UInt32.of_int 10 then October
else if v = Unsigned.UInt32.of_int 11 then November
else if v = Unsigned.UInt32.of_int 12 then December
else raise (Invalid_argument "Unexpected DateMonth value")
let datemonth_to_value = function
| Bad_month -> Unsigned.UInt32.of_int 0
| January -> Unsigned.UInt32.of_int 1
| February -> Unsigned.UInt32.of_int 2
| March -> Unsigned.UInt32.of_int 3
| April -> Unsigned.UInt32.of_int 4
| May -> Unsigned.UInt32.of_int 5
| June -> Unsigned.UInt32.of_int 6
| July -> Unsigned.UInt32.of_int 7
| August -> Unsigned.UInt32.of_int 8
| September -> Unsigned.UInt32.of_int 9
| October -> Unsigned.UInt32.of_int 10
| November -> Unsigned.UInt32.of_int 11
| December -> Unsigned.UInt32.of_int 12
let datemonth = view 
~read:datemonth_of_value 
~write:datemonth_to_value 
uint32_t

type dateweekday = Bad_weekday | Monday | Tuesday | Wednesday | Thursday | Friday | Saturday | Sunday
let dateweekday_of_value v =
if v = Unsigned.UInt32.of_int 0 then Bad_weekday
else if v = Unsigned.UInt32.of_int 1 then Monday
else if v = Unsigned.UInt32.of_int 2 then Tuesday
else if v = Unsigned.UInt32.of_int 3 then Wednesday
else if v = Unsigned.UInt32.of_int 4 then Thursday
else if v = Unsigned.UInt32.of_int 5 then Friday
else if v = Unsigned.UInt32.of_int 6 then Saturday
else if v = Unsigned.UInt32.of_int 7 then Sunday
else raise (Invalid_argument "Unexpected DateWeekday value")
let dateweekday_to_value = function
| Bad_weekday -> Unsigned.UInt32.of_int 0
| Monday -> Unsigned.UInt32.of_int 1
| Tuesday -> Unsigned.UInt32.of_int 2
| Wednesday -> Unsigned.UInt32.of_int 3
| Thursday -> Unsigned.UInt32.of_int 4
| Friday -> Unsigned.UInt32.of_int 5
| Saturday -> Unsigned.UInt32.of_int 6
| Sunday -> Unsigned.UInt32.of_int 7
let dateweekday = view 
~read:dateweekday_of_value 
~write:dateweekday_to_value 
uint32_t

let _E = 2.718282

type errortype = Unknown | Unexp_eof | Unexp_eof_in_string | Unexp_eof_in_comment | Non_digit_in_const | Digit_radix | Float_radix | Float_malformed
let errortype_of_value v =
if v = Unsigned.UInt32.of_int 0 then Unknown
else if v = Unsigned.UInt32.of_int 1 then Unexp_eof
else if v = Unsigned.UInt32.of_int 2 then Unexp_eof_in_string
else if v = Unsigned.UInt32.of_int 3 then Unexp_eof_in_comment
else if v = Unsigned.UInt32.of_int 4 then Non_digit_in_const
else if v = Unsigned.UInt32.of_int 5 then Digit_radix
else if v = Unsigned.UInt32.of_int 6 then Float_radix
else if v = Unsigned.UInt32.of_int 7 then Float_malformed
else raise (Invalid_argument "Unexpected ErrorType value")
let errortype_to_value = function
| Unknown -> Unsigned.UInt32.of_int 0
| Unexp_eof -> Unsigned.UInt32.of_int 1
| Unexp_eof_in_string -> Unsigned.UInt32.of_int 2
| Unexp_eof_in_comment -> Unsigned.UInt32.of_int 3
| Non_digit_in_const -> Unsigned.UInt32.of_int 4
| Digit_radix -> Unsigned.UInt32.of_int 5
| Float_radix -> Unsigned.UInt32.of_int 6
| Float_malformed -> Unsigned.UInt32.of_int 7
let errortype = view 
~read:errortype_of_value 
~write:errortype_to_value 
uint32_t

type fileerror = Exist | Isdir | Acces | Nametoolong | Noent | Notdir | Nxio | Nodev | Rofs | Txtbsy | Fault | Loop | Nospc | Nomem | Mfile | Nfile | Badf | Inval | Pipe | Again | Intr | Io | Perm | Nosys | Failed
let fileerror_of_value v =
if v = Unsigned.UInt32.of_int 0 then Exist
else if v = Unsigned.UInt32.of_int 1 then Isdir
else if v = Unsigned.UInt32.of_int 2 then Acces
else if v = Unsigned.UInt32.of_int 3 then Nametoolong
else if v = Unsigned.UInt32.of_int 4 then Noent
else if v = Unsigned.UInt32.of_int 5 then Notdir
else if v = Unsigned.UInt32.of_int 6 then Nxio
else if v = Unsigned.UInt32.of_int 7 then Nodev
else if v = Unsigned.UInt32.of_int 8 then Rofs
else if v = Unsigned.UInt32.of_int 9 then Txtbsy
else if v = Unsigned.UInt32.of_int 10 then Fault
else if v = Unsigned.UInt32.of_int 11 then Loop
else if v = Unsigned.UInt32.of_int 12 then Nospc
else if v = Unsigned.UInt32.of_int 13 then Nomem
else if v = Unsigned.UInt32.of_int 14 then Mfile
else if v = Unsigned.UInt32.of_int 15 then Nfile
else if v = Unsigned.UInt32.of_int 16 then Badf
else if v = Unsigned.UInt32.of_int 17 then Inval
else if v = Unsigned.UInt32.of_int 18 then Pipe
else if v = Unsigned.UInt32.of_int 19 then Again
else if v = Unsigned.UInt32.of_int 20 then Intr
else if v = Unsigned.UInt32.of_int 21 then Io
else if v = Unsigned.UInt32.of_int 22 then Perm
else if v = Unsigned.UInt32.of_int 23 then Nosys
else if v = Unsigned.UInt32.of_int 24 then Failed
else raise (Invalid_argument "Unexpected FileError value")
let fileerror_to_value = function
| Exist -> Unsigned.UInt32.of_int 0
| Isdir -> Unsigned.UInt32.of_int 1
| Acces -> Unsigned.UInt32.of_int 2
| Nametoolong -> Unsigned.UInt32.of_int 3
| Noent -> Unsigned.UInt32.of_int 4
| Notdir -> Unsigned.UInt32.of_int 5
| Nxio -> Unsigned.UInt32.of_int 6
| Nodev -> Unsigned.UInt32.of_int 7
| Rofs -> Unsigned.UInt32.of_int 8
| Txtbsy -> Unsigned.UInt32.of_int 9
| Fault -> Unsigned.UInt32.of_int 10
| Loop -> Unsigned.UInt32.of_int 11
| Nospc -> Unsigned.UInt32.of_int 12
| Nomem -> Unsigned.UInt32.of_int 13
| Mfile -> Unsigned.UInt32.of_int 14
| Nfile -> Unsigned.UInt32.of_int 15
| Badf -> Unsigned.UInt32.of_int 16
| Inval -> Unsigned.UInt32.of_int 17
| Pipe -> Unsigned.UInt32.of_int 18
| Again -> Unsigned.UInt32.of_int 19
| Intr -> Unsigned.UInt32.of_int 20
| Io -> Unsigned.UInt32.of_int 21
| Perm -> Unsigned.UInt32.of_int 22
| Nosys -> Unsigned.UInt32.of_int 23
| Failed -> Unsigned.UInt32.of_int 24
let fileerror = view 
~read:fileerror_of_value 
~write:fileerror_to_value 
uint32_t

type filetest = Is_regular | Is_symlink | Is_dir | Is_executable | Exists
type filetest_list = filetest list
let filetest_of_value v =
if v = Unsigned.UInt32.of_int 1 then Is_regular
else if v = Unsigned.UInt32.of_int 2 then Is_symlink
else if v = Unsigned.UInt32.of_int 4 then Is_dir
else if v = Unsigned.UInt32.of_int 8 then Is_executable
else if v = Unsigned.UInt32.of_int 16 then Exists
else raise (Invalid_argument "Unexpected FileTest value")
let filetest_to_value = function
| Is_regular -> Unsigned.UInt32.of_int 1
| Is_symlink -> Unsigned.UInt32.of_int 2
| Is_dir -> Unsigned.UInt32.of_int 4
| Is_executable -> Unsigned.UInt32.of_int 8
| Exists -> Unsigned.UInt32.of_int 16
let filetest_list_of_value v =
let open Unsigned.UInt32 in
let flags = [] in
if ((logand v (of_int 1)) != zero) then ignore (Is_regular :: flags);
if ((logand v (of_int 2)) != zero) then ignore (Is_symlink :: flags);
if ((logand v (of_int 4)) != zero) then ignore (Is_dir :: flags);
if ((logand v (of_int 8)) != zero) then ignore (Is_executable :: flags);
if ((logand v (of_int 16)) != zero) then ignore (Exists :: flags);
flags
let filetest_list_to_value flags =
let open Unsigned.UInt32 in
let rec logor_flags l acc =
match l with
| [] -> acc
| f :: q -> let v = filetest_to_value f in
let acc' = logor acc v in
logor_flags q acc'
in
logor_flags flags zero
let filetest_list = view 
~read:filetest_list_of_value 
~write:filetest_list_to_value 
uint32_t

type formatsizeflags = Default | Long_format | Iec_units
type formatsizeflags_list = formatsizeflags list
let formatsizeflags_of_value v =
if v = Unsigned.UInt32.of_int 0 then Default
else if v = Unsigned.UInt32.of_int 1 then Long_format
else if v = Unsigned.UInt32.of_int 2 then Iec_units
else raise (Invalid_argument "Unexpected FormatSizeFlags value")
let formatsizeflags_to_value = function
| Default -> Unsigned.UInt32.of_int 0
| Long_format -> Unsigned.UInt32.of_int 1
| Iec_units -> Unsigned.UInt32.of_int 2
let formatsizeflags_list_of_value v =
let open Unsigned.UInt32 in
let flags = [] in
if ((logand v (of_int 0)) != zero) then ignore (Default :: flags);
if ((logand v (of_int 1)) != zero) then ignore (Long_format :: flags);
if ((logand v (of_int 2)) != zero) then ignore (Iec_units :: flags);
flags
let formatsizeflags_list_to_value flags =
let open Unsigned.UInt32 in
let rec logor_flags l acc =
match l with
| [] -> acc
| f :: q -> let v = formatsizeflags_to_value f in
let acc' = logor acc v in
logor_flags q acc'
in
logor_flags flags zero
let formatsizeflags_list = view 
~read:formatsizeflags_list_of_value 
~write:formatsizeflags_list_to_value 
uint32_t

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

let _HAVE_GINT64 = Int32.of_string "1"

let _HAVE_GNUC_VARARGS = Int32.of_string "1"

let _HAVE_GNUC_VISIBILITY = Int32.of_string "1"

let _HAVE_GROWING_STACK = Int32.of_string "0"

let _HAVE_ISO_VARARGS = Int32.of_string "1"

let _HOOK_FLAG_USER_SHIFT = Int32.of_string "4"

type hookflagmask = Active | In_call | Mask
type hookflagmask_list = hookflagmask list
let hookflagmask_of_value v =
if v = Unsigned.UInt32.of_int 1 then Active
else if v = Unsigned.UInt32.of_int 2 then In_call
else if v = Unsigned.UInt32.of_int 15 then Mask
else raise (Invalid_argument "Unexpected HookFlagMask value")
let hookflagmask_to_value = function
| Active -> Unsigned.UInt32.of_int 1
| In_call -> Unsigned.UInt32.of_int 2
| Mask -> Unsigned.UInt32.of_int 15
let hookflagmask_list_of_value v =
let open Unsigned.UInt32 in
let flags = [] in
if ((logand v (of_int 1)) != zero) then ignore (Active :: flags);
if ((logand v (of_int 2)) != zero) then ignore (In_call :: flags);
if ((logand v (of_int 15)) != zero) then ignore (Mask :: flags);
flags
let hookflagmask_list_to_value flags =
let open Unsigned.UInt32 in
let rec logor_flags l acc =
match l with
| [] -> acc
| f :: q -> let v = hookflagmask_to_value f in
let acc' = logor acc v in
logor_flags q acc'
in
logor_flags flags zero
let hookflagmask_list = view 
~read:hookflagmask_list_of_value 
~write:hookflagmask_list_to_value 
uint32_t

let _IEEE754_DOUBLE_BIAS = Int32.of_string "1023"

let _IEEE754_FLOAT_BIAS = Int32.of_string "127"

type iochannelerror = Fbig | Inval | Io | Isdir | Nospc | Nxio | Overflow | Pipe | Failed
let iochannelerror_of_value v =
if v = Unsigned.UInt32.of_int 0 then Fbig
else if v = Unsigned.UInt32.of_int 1 then Inval
else if v = Unsigned.UInt32.of_int 2 then Io
else if v = Unsigned.UInt32.of_int 3 then Isdir
else if v = Unsigned.UInt32.of_int 4 then Nospc
else if v = Unsigned.UInt32.of_int 5 then Nxio
else if v = Unsigned.UInt32.of_int 6 then Overflow
else if v = Unsigned.UInt32.of_int 7 then Pipe
else if v = Unsigned.UInt32.of_int 8 then Failed
else raise (Invalid_argument "Unexpected IOChannelError value")
let iochannelerror_to_value = function
| Fbig -> Unsigned.UInt32.of_int 0
| Inval -> Unsigned.UInt32.of_int 1
| Io -> Unsigned.UInt32.of_int 2
| Isdir -> Unsigned.UInt32.of_int 3
| Nospc -> Unsigned.UInt32.of_int 4
| Nxio -> Unsigned.UInt32.of_int 5
| Overflow -> Unsigned.UInt32.of_int 6
| Pipe -> Unsigned.UInt32.of_int 7
| Failed -> Unsigned.UInt32.of_int 8
let iochannelerror = view 
~read:iochannelerror_of_value 
~write:iochannelerror_to_value 
uint32_t

type iocondition = In | Out | Pri | Err | Hup | Nval
type iocondition_list = iocondition list
let iocondition_of_value v =
if v = Unsigned.UInt32.of_int 1 then In
else if v = Unsigned.UInt32.of_int 4 then Out
else if v = Unsigned.UInt32.of_int 2 then Pri
else if v = Unsigned.UInt32.of_int 8 then Err
else if v = Unsigned.UInt32.of_int 16 then Hup
else if v = Unsigned.UInt32.of_int 32 then Nval
else raise (Invalid_argument "Unexpected IOCondition value")
let iocondition_to_value = function
| In -> Unsigned.UInt32.of_int 1
| Out -> Unsigned.UInt32.of_int 4
| Pri -> Unsigned.UInt32.of_int 2
| Err -> Unsigned.UInt32.of_int 8
| Hup -> Unsigned.UInt32.of_int 16
| Nval -> Unsigned.UInt32.of_int 32
let iocondition_list_of_value v =
let open Unsigned.UInt32 in
let flags = [] in
if ((logand v (of_int 1)) != zero) then ignore (In :: flags);
if ((logand v (of_int 4)) != zero) then ignore (Out :: flags);
if ((logand v (of_int 2)) != zero) then ignore (Pri :: flags);
if ((logand v (of_int 8)) != zero) then ignore (Err :: flags);
if ((logand v (of_int 16)) != zero) then ignore (Hup :: flags);
if ((logand v (of_int 32)) != zero) then ignore (Nval :: flags);
flags
let iocondition_list_to_value flags =
let open Unsigned.UInt32 in
let rec logor_flags l acc =
match l with
| [] -> acc
| f :: q -> let v = iocondition_to_value f in
let acc' = logor acc v in
logor_flags q acc'
in
logor_flags flags zero
let iocondition_list = view 
~read:iocondition_list_of_value 
~write:iocondition_list_to_value 
uint32_t

type ioerror = None | Again | Inval | Unknown
let ioerror_of_value v =
if v = Unsigned.UInt32.of_int 0 then None
else if v = Unsigned.UInt32.of_int 1 then Again
else if v = Unsigned.UInt32.of_int 2 then Inval
else if v = Unsigned.UInt32.of_int 3 then Unknown
else raise (Invalid_argument "Unexpected IOError value")
let ioerror_to_value = function
| None -> Unsigned.UInt32.of_int 0
| Again -> Unsigned.UInt32.of_int 1
| Inval -> Unsigned.UInt32.of_int 2
| Unknown -> Unsigned.UInt32.of_int 3
let ioerror = view 
~read:ioerror_of_value 
~write:ioerror_to_value 
uint32_t

type ioflags = Append | Nonblock | Is_readable | Is_writable | Is_writeable | Is_seekable | Mask | Get_mask | Set_mask
type ioflags_list = ioflags list
let ioflags_of_value v =
if v = Unsigned.UInt32.of_int 1 then Append
else if v = Unsigned.UInt32.of_int 2 then Nonblock
else if v = Unsigned.UInt32.of_int 4 then Is_readable
else if v = Unsigned.UInt32.of_int 8 then Is_writable
else if v = Unsigned.UInt32.of_int 8 then Is_writeable
else if v = Unsigned.UInt32.of_int 16 then Is_seekable
else if v = Unsigned.UInt32.of_int 31 then Mask
else if v = Unsigned.UInt32.of_int 31 then Get_mask
else if v = Unsigned.UInt32.of_int 3 then Set_mask
else raise (Invalid_argument "Unexpected IOFlags value")
let ioflags_to_value = function
| Append -> Unsigned.UInt32.of_int 1
| Nonblock -> Unsigned.UInt32.of_int 2
| Is_readable -> Unsigned.UInt32.of_int 4
| Is_writable -> Unsigned.UInt32.of_int 8
| Is_writeable -> Unsigned.UInt32.of_int 8
| Is_seekable -> Unsigned.UInt32.of_int 16
| Mask -> Unsigned.UInt32.of_int 31
| Get_mask -> Unsigned.UInt32.of_int 31
| Set_mask -> Unsigned.UInt32.of_int 3
let ioflags_list_of_value v =
let open Unsigned.UInt32 in
let flags = [] in
if ((logand v (of_int 1)) != zero) then ignore (Append :: flags);
if ((logand v (of_int 2)) != zero) then ignore (Nonblock :: flags);
if ((logand v (of_int 4)) != zero) then ignore (Is_readable :: flags);
if ((logand v (of_int 8)) != zero) then ignore (Is_writable :: flags);
if ((logand v (of_int 8)) != zero) then ignore (Is_writeable :: flags);
if ((logand v (of_int 16)) != zero) then ignore (Is_seekable :: flags);
if ((logand v (of_int 31)) != zero) then ignore (Mask :: flags);
if ((logand v (of_int 31)) != zero) then ignore (Get_mask :: flags);
if ((logand v (of_int 3)) != zero) then ignore (Set_mask :: flags);
flags
let ioflags_list_to_value flags =
let open Unsigned.UInt32 in
let rec logor_flags l acc =
match l with
| [] -> acc
| f :: q -> let v = ioflags_to_value f in
let acc' = logor acc v in
logor_flags q acc'
in
logor_flags flags zero
let ioflags_list = view 
~read:ioflags_list_of_value 
~write:ioflags_list_to_value 
uint32_t

type iostatus = Error | Normal | Eof | Again
let iostatus_of_value v =
if v = Unsigned.UInt32.of_int 0 then Error
else if v = Unsigned.UInt32.of_int 1 then Normal
else if v = Unsigned.UInt32.of_int 2 then Eof
else if v = Unsigned.UInt32.of_int 3 then Again
else raise (Invalid_argument "Unexpected IOStatus value")
let iostatus_to_value = function
| Error -> Unsigned.UInt32.of_int 0
| Normal -> Unsigned.UInt32.of_int 1
| Eof -> Unsigned.UInt32.of_int 2
| Again -> Unsigned.UInt32.of_int 3
let iostatus = view 
~read:iostatus_of_value 
~write:iostatus_to_value 
uint32_t

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

type keyfileerror = Unknown_encoding | Parse | Not_found | Key_not_found | Group_not_found | Invalid_value
let keyfileerror_of_value v =
if v = Unsigned.UInt32.of_int 0 then Unknown_encoding
else if v = Unsigned.UInt32.of_int 1 then Parse
else if v = Unsigned.UInt32.of_int 2 then Not_found
else if v = Unsigned.UInt32.of_int 3 then Key_not_found
else if v = Unsigned.UInt32.of_int 4 then Group_not_found
else if v = Unsigned.UInt32.of_int 5 then Invalid_value
else raise (Invalid_argument "Unexpected KeyFileError value")
let keyfileerror_to_value = function
| Unknown_encoding -> Unsigned.UInt32.of_int 0
| Parse -> Unsigned.UInt32.of_int 1
| Not_found -> Unsigned.UInt32.of_int 2
| Key_not_found -> Unsigned.UInt32.of_int 3
| Group_not_found -> Unsigned.UInt32.of_int 4
| Invalid_value -> Unsigned.UInt32.of_int 5
let keyfileerror = view 
~read:keyfileerror_of_value 
~write:keyfileerror_to_value 
uint32_t

type keyfileflags = None | Keep_comments | Keep_translations
type keyfileflags_list = keyfileflags list
let keyfileflags_of_value v =
if v = Unsigned.UInt32.of_int 0 then None
else if v = Unsigned.UInt32.of_int 1 then Keep_comments
else if v = Unsigned.UInt32.of_int 2 then Keep_translations
else raise (Invalid_argument "Unexpected KeyFileFlags value")
let keyfileflags_to_value = function
| None -> Unsigned.UInt32.of_int 0
| Keep_comments -> Unsigned.UInt32.of_int 1
| Keep_translations -> Unsigned.UInt32.of_int 2
let keyfileflags_list_of_value v =
let open Unsigned.UInt32 in
let flags = [] in
if ((logand v (of_int 0)) != zero) then ignore (None :: flags);
if ((logand v (of_int 1)) != zero) then ignore (Keep_comments :: flags);
if ((logand v (of_int 2)) != zero) then ignore (Keep_translations :: flags);
flags
let keyfileflags_list_to_value flags =
let open Unsigned.UInt32 in
let rec logor_flags l acc =
match l with
| [] -> acc
| f :: q -> let v = keyfileflags_to_value f in
let acc' = logor acc v in
logor_flags q acc'
in
logor_flags flags zero
let keyfileflags_list = view 
~read:keyfileflags_list_of_value 
~write:keyfileflags_list_to_value 
uint32_t

let _LITTLE_ENDIAN = Int32.of_string "1234"

let _LN10 = 2.302585

let _LN2 = 0.693147

let _LOG_2_BASE_10 = 0.30103

let _LOG_DOMAIN = 0

let _LOG_FATAL_MASK = Int32.of_string "0"

let _LOG_LEVEL_USER_SHIFT = Int32.of_string "8"

type loglevelflags = Flag_recursion | Flag_fatal | Level_error | Level_critical | Level_warning | Level_message | Level_info | Level_debug | Level_mask
type loglevelflags_list = loglevelflags list
let loglevelflags_of_value v =
if v = Int32.of_int 1 then Flag_recursion
else if v = Int32.of_int 2 then Flag_fatal
else if v = Int32.of_int 4 then Level_error
else if v = Int32.of_int 8 then Level_critical
else if v = Int32.of_int 16 then Level_warning
else if v = Int32.of_int 32 then Level_message
else if v = Int32.of_int 64 then Level_info
else if v = Int32.of_int 128 then Level_debug
else if v = Int32.of_int (-4) then Level_mask
else raise (Invalid_argument "Unexpected LogLevelFlags value")
let loglevelflags_to_value = function
| Flag_recursion -> Int32.of_int 1
| Flag_fatal -> Int32.of_int 2
| Level_error -> Int32.of_int 4
| Level_critical -> Int32.of_int 8
| Level_warning -> Int32.of_int 16
| Level_message -> Int32.of_int 32
| Level_info -> Int32.of_int 64
| Level_debug -> Int32.of_int 128
| Level_mask -> Int32.of_int (-4)
let loglevelflags_list_of_value v =
let open Int32 in
let flags = [] in
if ((logand v (of_int 1)) != zero) then ignore (Flag_recursion :: flags);
if ((logand v (of_int 2)) != zero) then ignore (Flag_fatal :: flags);
if ((logand v (of_int 4)) != zero) then ignore (Level_error :: flags);
if ((logand v (of_int 8)) != zero) then ignore (Level_critical :: flags);
if ((logand v (of_int 16)) != zero) then ignore (Level_warning :: flags);
if ((logand v (of_int 32)) != zero) then ignore (Level_message :: flags);
if ((logand v (of_int 64)) != zero) then ignore (Level_info :: flags);
if ((logand v (of_int 128)) != zero) then ignore (Level_debug :: flags);
if ((logand v (of_int (-4))) != zero) then ignore (Level_mask :: flags);
flags
let loglevelflags_list_to_value flags =
let open Int32 in
let rec logor_flags l acc =
match l with
| [] -> acc
| f :: q -> let v = loglevelflags_to_value f in
let acc' = logor acc v in
logor_flags q acc'
in
logor_flags flags zero
let loglevelflags_list = view 
~read:loglevelflags_list_of_value 
~write:loglevelflags_list_to_value 
int32_t

type logwriteroutput = Handled | Unhandled
let logwriteroutput_of_value v =
if v = Unsigned.UInt32.of_int 1 then Handled
else if v = Unsigned.UInt32.of_int 0 then Unhandled
else raise (Invalid_argument "Unexpected LogWriterOutput value")
let logwriteroutput_to_value = function
| Handled -> Unsigned.UInt32.of_int 1
| Unhandled -> Unsigned.UInt32.of_int 0
let logwriteroutput = view 
~read:logwriteroutput_of_value 
~write:logwriteroutput_to_value 
uint32_t

let _MAJOR_VERSION = Int32.of_string "2"

let _MAXINT16 = 32767

let _MAXINT32 = Int32.of_string "2147483647"

let _MAXINT64 = 9223372036854775807L

let _MAXINT8 = 127

let _MAXUINT16 = Unsigned.UInt16.of_int 65535

let _MAXUINT32 = Unsigned.UInt32.of_string "4294967295"

let _MAXUINT64 = Unsigned.UInt64.of_string "18446744073709551615"

let _MAXUINT8 = Unsigned.UInt8.of_int 255

let _MICRO_VERSION = Int32.of_string "1"

let _MININT16 = -32768

let _MININT32 = Int32.of_string "-2147483648"

let _MININT64 = -9223372036854775808L

let _MININT8 = -128

let _MINOR_VERSION = Int32.of_string "52"

let _MODULE_SUFFIX = "so"

type markupcollecttype = Invalid | String | Strdup | Boolean | Tristate | Optional
type markupcollecttype_list = markupcollecttype list
let markupcollecttype_of_value v =
if v = Unsigned.UInt32.of_int 0 then Invalid
else if v = Unsigned.UInt32.of_int 1 then String
else if v = Unsigned.UInt32.of_int 2 then Strdup
else if v = Unsigned.UInt32.of_int 3 then Boolean
else if v = Unsigned.UInt32.of_int 4 then Tristate
else if v = Unsigned.UInt32.of_int 65536 then Optional
else raise (Invalid_argument "Unexpected MarkupCollectType value")
let markupcollecttype_to_value = function
| Invalid -> Unsigned.UInt32.of_int 0
| String -> Unsigned.UInt32.of_int 1
| Strdup -> Unsigned.UInt32.of_int 2
| Boolean -> Unsigned.UInt32.of_int 3
| Tristate -> Unsigned.UInt32.of_int 4
| Optional -> Unsigned.UInt32.of_int 65536
let markupcollecttype_list_of_value v =
let open Unsigned.UInt32 in
let flags = [] in
if ((logand v (of_int 0)) != zero) then ignore (Invalid :: flags);
if ((logand v (of_int 1)) != zero) then ignore (String :: flags);
if ((logand v (of_int 2)) != zero) then ignore (Strdup :: flags);
if ((logand v (of_int 3)) != zero) then ignore (Boolean :: flags);
if ((logand v (of_int 4)) != zero) then ignore (Tristate :: flags);
if ((logand v (of_int 65536)) != zero) then ignore (Optional :: flags);
flags
let markupcollecttype_list_to_value flags =
let open Unsigned.UInt32 in
let rec logor_flags l acc =
match l with
| [] -> acc
| f :: q -> let v = markupcollecttype_to_value f in
let acc' = logor acc v in
logor_flags q acc'
in
logor_flags flags zero
let markupcollecttype_list = view 
~read:markupcollecttype_list_of_value 
~write:markupcollecttype_list_to_value 
uint32_t

type markuperror = Bad_utf8 | Empty | Parse | Unknown_element | Unknown_attribute | Invalid_content | Missing_attribute
let markuperror_of_value v =
if v = Unsigned.UInt32.of_int 0 then Bad_utf8
else if v = Unsigned.UInt32.of_int 1 then Empty
else if v = Unsigned.UInt32.of_int 2 then Parse
else if v = Unsigned.UInt32.of_int 3 then Unknown_element
else if v = Unsigned.UInt32.of_int 4 then Unknown_attribute
else if v = Unsigned.UInt32.of_int 5 then Invalid_content
else if v = Unsigned.UInt32.of_int 6 then Missing_attribute
else raise (Invalid_argument "Unexpected MarkupError value")
let markuperror_to_value = function
| Bad_utf8 -> Unsigned.UInt32.of_int 0
| Empty -> Unsigned.UInt32.of_int 1
| Parse -> Unsigned.UInt32.of_int 2
| Unknown_element -> Unsigned.UInt32.of_int 3
| Unknown_attribute -> Unsigned.UInt32.of_int 4
| Invalid_content -> Unsigned.UInt32.of_int 5
| Missing_attribute -> Unsigned.UInt32.of_int 6
let markuperror = view 
~read:markuperror_of_value 
~write:markuperror_to_value 
uint32_t

type markupparseflags = Do_not_use_this_unsupported_flag | Treat_cdata_as_text | Prefix_error_position | Ignore_qualified
type markupparseflags_list = markupparseflags list
let markupparseflags_of_value v =
if v = Unsigned.UInt32.of_int 1 then Do_not_use_this_unsupported_flag
else if v = Unsigned.UInt32.of_int 2 then Treat_cdata_as_text
else if v = Unsigned.UInt32.of_int 4 then Prefix_error_position
else if v = Unsigned.UInt32.of_int 8 then Ignore_qualified
else raise (Invalid_argument "Unexpected MarkupParseFlags value")
let markupparseflags_to_value = function
| Do_not_use_this_unsupported_flag -> Unsigned.UInt32.of_int 1
| Treat_cdata_as_text -> Unsigned.UInt32.of_int 2
| Prefix_error_position -> Unsigned.UInt32.of_int 4
| Ignore_qualified -> Unsigned.UInt32.of_int 8
let markupparseflags_list_of_value v =
let open Unsigned.UInt32 in
let flags = [] in
if ((logand v (of_int 1)) != zero) then ignore (Do_not_use_this_unsupported_flag :: flags);
if ((logand v (of_int 2)) != zero) then ignore (Treat_cdata_as_text :: flags);
if ((logand v (of_int 4)) != zero) then ignore (Prefix_error_position :: flags);
if ((logand v (of_int 8)) != zero) then ignore (Ignore_qualified :: flags);
flags
let markupparseflags_list_to_value flags =
let open Unsigned.UInt32 in
let rec logor_flags l acc =
match l with
| [] -> acc
| f :: q -> let v = markupparseflags_to_value f in
let acc' = logor acc v in
logor_flags q acc'
in
logor_flags flags zero
let markupparseflags_list = view 
~read:markupparseflags_list_of_value 
~write:markupparseflags_list_to_value 
uint32_t

type normalizemode = Default | Nfd | Default_compose | Nfc | All | Nfkd | All_compose | Nfkc
let normalizemode_of_value v =
if v = Unsigned.UInt32.of_int 0 then Default
else if v = Unsigned.UInt32.of_int 0 then Nfd
else if v = Unsigned.UInt32.of_int 1 then Default_compose
else if v = Unsigned.UInt32.of_int 1 then Nfc
else if v = Unsigned.UInt32.of_int 2 then All
else if v = Unsigned.UInt32.of_int 2 then Nfkd
else if v = Unsigned.UInt32.of_int 3 then All_compose
else if v = Unsigned.UInt32.of_int 3 then Nfkc
else raise (Invalid_argument "Unexpected NormalizeMode value")
let normalizemode_to_value = function
| Default -> Unsigned.UInt32.of_int 0
| Nfd -> Unsigned.UInt32.of_int 0
| Default_compose -> Unsigned.UInt32.of_int 1
| Nfc -> Unsigned.UInt32.of_int 1
| All -> Unsigned.UInt32.of_int 2
| Nfkd -> Unsigned.UInt32.of_int 2
| All_compose -> Unsigned.UInt32.of_int 3
| Nfkc -> Unsigned.UInt32.of_int 3
let normalizemode = view 
~read:normalizemode_of_value 
~write:normalizemode_to_value 
uint32_t

let _OPTION_REMAINING = ""

type oncestatus = Notcalled | Progress | Ready
let oncestatus_of_value v =
if v = Unsigned.UInt32.of_int 0 then Notcalled
else if v = Unsigned.UInt32.of_int 1 then Progress
else if v = Unsigned.UInt32.of_int 2 then Ready
else raise (Invalid_argument "Unexpected OnceStatus value")
let oncestatus_to_value = function
| Notcalled -> Unsigned.UInt32.of_int 0
| Progress -> Unsigned.UInt32.of_int 1
| Ready -> Unsigned.UInt32.of_int 2
let oncestatus = view 
~read:oncestatus_of_value 
~write:oncestatus_to_value 
uint32_t

type optionarg = None | String | Int | Callback | Filename | String_array | Filename_array | Double | Int64
let optionarg_of_value v =
if v = Unsigned.UInt32.of_int 0 then None
else if v = Unsigned.UInt32.of_int 1 then String
else if v = Unsigned.UInt32.of_int 2 then Int
else if v = Unsigned.UInt32.of_int 3 then Callback
else if v = Unsigned.UInt32.of_int 4 then Filename
else if v = Unsigned.UInt32.of_int 5 then String_array
else if v = Unsigned.UInt32.of_int 6 then Filename_array
else if v = Unsigned.UInt32.of_int 7 then Double
else if v = Unsigned.UInt32.of_int 8 then Int64
else raise (Invalid_argument "Unexpected OptionArg value")
let optionarg_to_value = function
| None -> Unsigned.UInt32.of_int 0
| String -> Unsigned.UInt32.of_int 1
| Int -> Unsigned.UInt32.of_int 2
| Callback -> Unsigned.UInt32.of_int 3
| Filename -> Unsigned.UInt32.of_int 4
| String_array -> Unsigned.UInt32.of_int 5
| Filename_array -> Unsigned.UInt32.of_int 6
| Double -> Unsigned.UInt32.of_int 7
| Int64 -> Unsigned.UInt32.of_int 8
let optionarg = view 
~read:optionarg_of_value 
~write:optionarg_to_value 
uint32_t

type optionerror = Unknown_option | Bad_value | Failed
let optionerror_of_value v =
if v = Unsigned.UInt32.of_int 0 then Unknown_option
else if v = Unsigned.UInt32.of_int 1 then Bad_value
else if v = Unsigned.UInt32.of_int 2 then Failed
else raise (Invalid_argument "Unexpected OptionError value")
let optionerror_to_value = function
| Unknown_option -> Unsigned.UInt32.of_int 0
| Bad_value -> Unsigned.UInt32.of_int 1
| Failed -> Unsigned.UInt32.of_int 2
let optionerror = view 
~read:optionerror_of_value 
~write:optionerror_to_value 
uint32_t

type optionflags = None | Hidden | In_main | Reverse | No_arg | Filename | Optional_arg | Noalias
type optionflags_list = optionflags list
let optionflags_of_value v =
if v = Unsigned.UInt32.of_int 0 then None
else if v = Unsigned.UInt32.of_int 1 then Hidden
else if v = Unsigned.UInt32.of_int 2 then In_main
else if v = Unsigned.UInt32.of_int 4 then Reverse
else if v = Unsigned.UInt32.of_int 8 then No_arg
else if v = Unsigned.UInt32.of_int 16 then Filename
else if v = Unsigned.UInt32.of_int 32 then Optional_arg
else if v = Unsigned.UInt32.of_int 64 then Noalias
else raise (Invalid_argument "Unexpected OptionFlags value")
let optionflags_to_value = function
| None -> Unsigned.UInt32.of_int 0
| Hidden -> Unsigned.UInt32.of_int 1
| In_main -> Unsigned.UInt32.of_int 2
| Reverse -> Unsigned.UInt32.of_int 4
| No_arg -> Unsigned.UInt32.of_int 8
| Filename -> Unsigned.UInt32.of_int 16
| Optional_arg -> Unsigned.UInt32.of_int 32
| Noalias -> Unsigned.UInt32.of_int 64
let optionflags_list_of_value v =
let open Unsigned.UInt32 in
let flags = [] in
if ((logand v (of_int 0)) != zero) then ignore (None :: flags);
if ((logand v (of_int 1)) != zero) then ignore (Hidden :: flags);
if ((logand v (of_int 2)) != zero) then ignore (In_main :: flags);
if ((logand v (of_int 4)) != zero) then ignore (Reverse :: flags);
if ((logand v (of_int 8)) != zero) then ignore (No_arg :: flags);
if ((logand v (of_int 16)) != zero) then ignore (Filename :: flags);
if ((logand v (of_int 32)) != zero) then ignore (Optional_arg :: flags);
if ((logand v (of_int 64)) != zero) then ignore (Noalias :: flags);
flags
let optionflags_list_to_value flags =
let open Unsigned.UInt32 in
let rec logor_flags l acc =
match l with
| [] -> acc
| f :: q -> let v = optionflags_to_value f in
let acc' = logor acc v in
logor_flags q acc'
in
logor_flags flags zero
let optionflags_list = view 
~read:optionflags_list_of_value 
~write:optionflags_list_to_value 
uint32_t

let _PDP_ENDIAN = Int32.of_string "3412"

let _PI = 3.141593

let _PID_FORMAT = "i"

let _PI_2 = 1.570796

let _PI_4 = 0.785398

let _POLLFD_FORMAT = "%d"

let _PRIORITY_DEFAULT = Int32.of_string "0"

let _PRIORITY_DEFAULT_IDLE = Int32.of_string "200"

let _PRIORITY_HIGH = Int32.of_string "-100"

let _PRIORITY_HIGH_IDLE = Int32.of_string "100"

let _PRIORITY_LOW = Int32.of_string "300"

type regexcompileflags = Caseless | Multiline | Dotall | Extended | Anchored | Dollar_endonly | Ungreedy | Raw | No_auto_capture | Optimize | Firstline | Dupnames | Newline_cr | Newline_lf | Newline_crlf | Newline_anycrlf | Bsr_anycrlf | Javascript_compat
type regexcompileflags_list = regexcompileflags list
let regexcompileflags_of_value v =
if v = Unsigned.UInt32.of_int 1 then Caseless
else if v = Unsigned.UInt32.of_int 2 then Multiline
else if v = Unsigned.UInt32.of_int 4 then Dotall
else if v = Unsigned.UInt32.of_int 8 then Extended
else if v = Unsigned.UInt32.of_int 16 then Anchored
else if v = Unsigned.UInt32.of_int 32 then Dollar_endonly
else if v = Unsigned.UInt32.of_int 512 then Ungreedy
else if v = Unsigned.UInt32.of_int 2048 then Raw
else if v = Unsigned.UInt32.of_int 4096 then No_auto_capture
else if v = Unsigned.UInt32.of_int 8192 then Optimize
else if v = Unsigned.UInt32.of_int 262144 then Firstline
else if v = Unsigned.UInt32.of_int 524288 then Dupnames
else if v = Unsigned.UInt32.of_int 1048576 then Newline_cr
else if v = Unsigned.UInt32.of_int 2097152 then Newline_lf
else if v = Unsigned.UInt32.of_int 3145728 then Newline_crlf
else if v = Unsigned.UInt32.of_int 5242880 then Newline_anycrlf
else if v = Unsigned.UInt32.of_int 8388608 then Bsr_anycrlf
else if v = Unsigned.UInt32.of_int 33554432 then Javascript_compat
else raise (Invalid_argument "Unexpected RegexCompileFlags value")
let regexcompileflags_to_value = function
| Caseless -> Unsigned.UInt32.of_int 1
| Multiline -> Unsigned.UInt32.of_int 2
| Dotall -> Unsigned.UInt32.of_int 4
| Extended -> Unsigned.UInt32.of_int 8
| Anchored -> Unsigned.UInt32.of_int 16
| Dollar_endonly -> Unsigned.UInt32.of_int 32
| Ungreedy -> Unsigned.UInt32.of_int 512
| Raw -> Unsigned.UInt32.of_int 2048
| No_auto_capture -> Unsigned.UInt32.of_int 4096
| Optimize -> Unsigned.UInt32.of_int 8192
| Firstline -> Unsigned.UInt32.of_int 262144
| Dupnames -> Unsigned.UInt32.of_int 524288
| Newline_cr -> Unsigned.UInt32.of_int 1048576
| Newline_lf -> Unsigned.UInt32.of_int 2097152
| Newline_crlf -> Unsigned.UInt32.of_int 3145728
| Newline_anycrlf -> Unsigned.UInt32.of_int 5242880
| Bsr_anycrlf -> Unsigned.UInt32.of_int 8388608
| Javascript_compat -> Unsigned.UInt32.of_int 33554432
let regexcompileflags_list_of_value v =
let open Unsigned.UInt32 in
let flags = [] in
if ((logand v (of_int 1)) != zero) then ignore (Caseless :: flags);
if ((logand v (of_int 2)) != zero) then ignore (Multiline :: flags);
if ((logand v (of_int 4)) != zero) then ignore (Dotall :: flags);
if ((logand v (of_int 8)) != zero) then ignore (Extended :: flags);
if ((logand v (of_int 16)) != zero) then ignore (Anchored :: flags);
if ((logand v (of_int 32)) != zero) then ignore (Dollar_endonly :: flags);
if ((logand v (of_int 512)) != zero) then ignore (Ungreedy :: flags);
if ((logand v (of_int 2048)) != zero) then ignore (Raw :: flags);
if ((logand v (of_int 4096)) != zero) then ignore (No_auto_capture :: flags);
if ((logand v (of_int 8192)) != zero) then ignore (Optimize :: flags);
if ((logand v (of_int 262144)) != zero) then ignore (Firstline :: flags);
if ((logand v (of_int 524288)) != zero) then ignore (Dupnames :: flags);
if ((logand v (of_int 1048576)) != zero) then ignore (Newline_cr :: flags);
if ((logand v (of_int 2097152)) != zero) then ignore (Newline_lf :: flags);
if ((logand v (of_int 3145728)) != zero) then ignore (Newline_crlf :: flags);
if ((logand v (of_int 5242880)) != zero) then ignore (Newline_anycrlf :: flags);
if ((logand v (of_int 8388608)) != zero) then ignore (Bsr_anycrlf :: flags);
if ((logand v (of_int 33554432)) != zero) then ignore (Javascript_compat :: flags);
flags
let regexcompileflags_list_to_value flags =
let open Unsigned.UInt32 in
let rec logor_flags l acc =
match l with
| [] -> acc
| f :: q -> let v = regexcompileflags_to_value f in
let acc' = logor acc v in
logor_flags q acc'
in
logor_flags flags zero
let regexcompileflags_list = view 
~read:regexcompileflags_list_of_value 
~write:regexcompileflags_list_to_value 
uint32_t

type regexerror = Compile | Optimize | Replace | Match | Internal | Stray_backslash | Missing_control_char | Unrecognized_escape | Quantifiers_out_of_order | Quantifier_too_big | Unterminated_character_class | Invalid_escape_in_character_class | Range_out_of_order | Nothing_to_repeat | Unrecognized_character | Posix_named_class_outside_class | Unmatched_parenthesis | Inexistent_subpattern_reference | Unterminated_comment | Expression_too_large | Memory_error | Variable_length_lookbehind | Malformed_condition | Too_many_conditional_branches | Assertion_expected | Unknown_posix_class_name | Posix_collating_elements_not_supported | Hex_code_too_large | Invalid_condition | Single_byte_match_in_lookbehind | Infinite_loop | Missing_subpattern_name_terminator | Duplicate_subpattern_name | Malformed_property | Unknown_property | Subpattern_name_too_long | Too_many_subpatterns | Invalid_octal_value | Too_many_branches_in_define | Define_repetion | Inconsistent_newline_options | Missing_back_reference | Invalid_relative_reference | Backtracking_control_verb_argument_forbidden | Unknown_backtracking_control_verb | Number_too_big | Missing_subpattern_name | Missing_digit | Invalid_data_character | Extra_subpattern_name | Backtracking_control_verb_argument_required | Invalid_control_char | Missing_name | Not_supported_in_class | Too_many_forward_references | Name_too_long | Character_value_too_large
let regexerror_of_value v =
if v = Unsigned.UInt32.of_int 0 then Compile
else if v = Unsigned.UInt32.of_int 1 then Optimize
else if v = Unsigned.UInt32.of_int 2 then Replace
else if v = Unsigned.UInt32.of_int 3 then Match
else if v = Unsigned.UInt32.of_int 4 then Internal
else if v = Unsigned.UInt32.of_int 101 then Stray_backslash
else if v = Unsigned.UInt32.of_int 102 then Missing_control_char
else if v = Unsigned.UInt32.of_int 103 then Unrecognized_escape
else if v = Unsigned.UInt32.of_int 104 then Quantifiers_out_of_order
else if v = Unsigned.UInt32.of_int 105 then Quantifier_too_big
else if v = Unsigned.UInt32.of_int 106 then Unterminated_character_class
else if v = Unsigned.UInt32.of_int 107 then Invalid_escape_in_character_class
else if v = Unsigned.UInt32.of_int 108 then Range_out_of_order
else if v = Unsigned.UInt32.of_int 109 then Nothing_to_repeat
else if v = Unsigned.UInt32.of_int 112 then Unrecognized_character
else if v = Unsigned.UInt32.of_int 113 then Posix_named_class_outside_class
else if v = Unsigned.UInt32.of_int 114 then Unmatched_parenthesis
else if v = Unsigned.UInt32.of_int 115 then Inexistent_subpattern_reference
else if v = Unsigned.UInt32.of_int 118 then Unterminated_comment
else if v = Unsigned.UInt32.of_int 120 then Expression_too_large
else if v = Unsigned.UInt32.of_int 121 then Memory_error
else if v = Unsigned.UInt32.of_int 125 then Variable_length_lookbehind
else if v = Unsigned.UInt32.of_int 126 then Malformed_condition
else if v = Unsigned.UInt32.of_int 127 then Too_many_conditional_branches
else if v = Unsigned.UInt32.of_int 128 then Assertion_expected
else if v = Unsigned.UInt32.of_int 130 then Unknown_posix_class_name
else if v = Unsigned.UInt32.of_int 131 then Posix_collating_elements_not_supported
else if v = Unsigned.UInt32.of_int 134 then Hex_code_too_large
else if v = Unsigned.UInt32.of_int 135 then Invalid_condition
else if v = Unsigned.UInt32.of_int 136 then Single_byte_match_in_lookbehind
else if v = Unsigned.UInt32.of_int 140 then Infinite_loop
else if v = Unsigned.UInt32.of_int 142 then Missing_subpattern_name_terminator
else if v = Unsigned.UInt32.of_int 143 then Duplicate_subpattern_name
else if v = Unsigned.UInt32.of_int 146 then Malformed_property
else if v = Unsigned.UInt32.of_int 147 then Unknown_property
else if v = Unsigned.UInt32.of_int 148 then Subpattern_name_too_long
else if v = Unsigned.UInt32.of_int 149 then Too_many_subpatterns
else if v = Unsigned.UInt32.of_int 151 then Invalid_octal_value
else if v = Unsigned.UInt32.of_int 154 then Too_many_branches_in_define
else if v = Unsigned.UInt32.of_int 155 then Define_repetion
else if v = Unsigned.UInt32.of_int 156 then Inconsistent_newline_options
else if v = Unsigned.UInt32.of_int 157 then Missing_back_reference
else if v = Unsigned.UInt32.of_int 158 then Invalid_relative_reference
else if v = Unsigned.UInt32.of_int 159 then Backtracking_control_verb_argument_forbidden
else if v = Unsigned.UInt32.of_int 160 then Unknown_backtracking_control_verb
else if v = Unsigned.UInt32.of_int 161 then Number_too_big
else if v = Unsigned.UInt32.of_int 162 then Missing_subpattern_name
else if v = Unsigned.UInt32.of_int 163 then Missing_digit
else if v = Unsigned.UInt32.of_int 164 then Invalid_data_character
else if v = Unsigned.UInt32.of_int 165 then Extra_subpattern_name
else if v = Unsigned.UInt32.of_int 166 then Backtracking_control_verb_argument_required
else if v = Unsigned.UInt32.of_int 168 then Invalid_control_char
else if v = Unsigned.UInt32.of_int 169 then Missing_name
else if v = Unsigned.UInt32.of_int 171 then Not_supported_in_class
else if v = Unsigned.UInt32.of_int 172 then Too_many_forward_references
else if v = Unsigned.UInt32.of_int 175 then Name_too_long
else if v = Unsigned.UInt32.of_int 176 then Character_value_too_large
else raise (Invalid_argument "Unexpected RegexError value")
let regexerror_to_value = function
| Compile -> Unsigned.UInt32.of_int 0
| Optimize -> Unsigned.UInt32.of_int 1
| Replace -> Unsigned.UInt32.of_int 2
| Match -> Unsigned.UInt32.of_int 3
| Internal -> Unsigned.UInt32.of_int 4
| Stray_backslash -> Unsigned.UInt32.of_int 101
| Missing_control_char -> Unsigned.UInt32.of_int 102
| Unrecognized_escape -> Unsigned.UInt32.of_int 103
| Quantifiers_out_of_order -> Unsigned.UInt32.of_int 104
| Quantifier_too_big -> Unsigned.UInt32.of_int 105
| Unterminated_character_class -> Unsigned.UInt32.of_int 106
| Invalid_escape_in_character_class -> Unsigned.UInt32.of_int 107
| Range_out_of_order -> Unsigned.UInt32.of_int 108
| Nothing_to_repeat -> Unsigned.UInt32.of_int 109
| Unrecognized_character -> Unsigned.UInt32.of_int 112
| Posix_named_class_outside_class -> Unsigned.UInt32.of_int 113
| Unmatched_parenthesis -> Unsigned.UInt32.of_int 114
| Inexistent_subpattern_reference -> Unsigned.UInt32.of_int 115
| Unterminated_comment -> Unsigned.UInt32.of_int 118
| Expression_too_large -> Unsigned.UInt32.of_int 120
| Memory_error -> Unsigned.UInt32.of_int 121
| Variable_length_lookbehind -> Unsigned.UInt32.of_int 125
| Malformed_condition -> Unsigned.UInt32.of_int 126
| Too_many_conditional_branches -> Unsigned.UInt32.of_int 127
| Assertion_expected -> Unsigned.UInt32.of_int 128
| Unknown_posix_class_name -> Unsigned.UInt32.of_int 130
| Posix_collating_elements_not_supported -> Unsigned.UInt32.of_int 131
| Hex_code_too_large -> Unsigned.UInt32.of_int 134
| Invalid_condition -> Unsigned.UInt32.of_int 135
| Single_byte_match_in_lookbehind -> Unsigned.UInt32.of_int 136
| Infinite_loop -> Unsigned.UInt32.of_int 140
| Missing_subpattern_name_terminator -> Unsigned.UInt32.of_int 142
| Duplicate_subpattern_name -> Unsigned.UInt32.of_int 143
| Malformed_property -> Unsigned.UInt32.of_int 146
| Unknown_property -> Unsigned.UInt32.of_int 147
| Subpattern_name_too_long -> Unsigned.UInt32.of_int 148
| Too_many_subpatterns -> Unsigned.UInt32.of_int 149
| Invalid_octal_value -> Unsigned.UInt32.of_int 151
| Too_many_branches_in_define -> Unsigned.UInt32.of_int 154
| Define_repetion -> Unsigned.UInt32.of_int 155
| Inconsistent_newline_options -> Unsigned.UInt32.of_int 156
| Missing_back_reference -> Unsigned.UInt32.of_int 157
| Invalid_relative_reference -> Unsigned.UInt32.of_int 158
| Backtracking_control_verb_argument_forbidden -> Unsigned.UInt32.of_int 159
| Unknown_backtracking_control_verb -> Unsigned.UInt32.of_int 160
| Number_too_big -> Unsigned.UInt32.of_int 161
| Missing_subpattern_name -> Unsigned.UInt32.of_int 162
| Missing_digit -> Unsigned.UInt32.of_int 163
| Invalid_data_character -> Unsigned.UInt32.of_int 164
| Extra_subpattern_name -> Unsigned.UInt32.of_int 165
| Backtracking_control_verb_argument_required -> Unsigned.UInt32.of_int 166
| Invalid_control_char -> Unsigned.UInt32.of_int 168
| Missing_name -> Unsigned.UInt32.of_int 169
| Not_supported_in_class -> Unsigned.UInt32.of_int 171
| Too_many_forward_references -> Unsigned.UInt32.of_int 172
| Name_too_long -> Unsigned.UInt32.of_int 175
| Character_value_too_large -> Unsigned.UInt32.of_int 176
let regexerror = view 
~read:regexerror_of_value 
~write:regexerror_to_value 
uint32_t

type regexmatchflags = Anchored | Notbol | Noteol | Notempty | Partial | Newline_cr | Newline_lf | Newline_crlf | Newline_any | Newline_anycrlf | Bsr_anycrlf | Bsr_any | Partial_soft | Partial_hard | Notempty_atstart
type regexmatchflags_list = regexmatchflags list
let regexmatchflags_of_value v =
if v = Unsigned.UInt32.of_int 16 then Anchored
else if v = Unsigned.UInt32.of_int 128 then Notbol
else if v = Unsigned.UInt32.of_int 256 then Noteol
else if v = Unsigned.UInt32.of_int 1024 then Notempty
else if v = Unsigned.UInt32.of_int 32768 then Partial
else if v = Unsigned.UInt32.of_int 1048576 then Newline_cr
else if v = Unsigned.UInt32.of_int 2097152 then Newline_lf
else if v = Unsigned.UInt32.of_int 3145728 then Newline_crlf
else if v = Unsigned.UInt32.of_int 4194304 then Newline_any
else if v = Unsigned.UInt32.of_int 5242880 then Newline_anycrlf
else if v = Unsigned.UInt32.of_int 8388608 then Bsr_anycrlf
else if v = Unsigned.UInt32.of_int 16777216 then Bsr_any
else if v = Unsigned.UInt32.of_int 32768 then Partial_soft
else if v = Unsigned.UInt32.of_int 134217728 then Partial_hard
else if v = Unsigned.UInt32.of_int 268435456 then Notempty_atstart
else raise (Invalid_argument "Unexpected RegexMatchFlags value")
let regexmatchflags_to_value = function
| Anchored -> Unsigned.UInt32.of_int 16
| Notbol -> Unsigned.UInt32.of_int 128
| Noteol -> Unsigned.UInt32.of_int 256
| Notempty -> Unsigned.UInt32.of_int 1024
| Partial -> Unsigned.UInt32.of_int 32768
| Newline_cr -> Unsigned.UInt32.of_int 1048576
| Newline_lf -> Unsigned.UInt32.of_int 2097152
| Newline_crlf -> Unsigned.UInt32.of_int 3145728
| Newline_any -> Unsigned.UInt32.of_int 4194304
| Newline_anycrlf -> Unsigned.UInt32.of_int 5242880
| Bsr_anycrlf -> Unsigned.UInt32.of_int 8388608
| Bsr_any -> Unsigned.UInt32.of_int 16777216
| Partial_soft -> Unsigned.UInt32.of_int 32768
| Partial_hard -> Unsigned.UInt32.of_int 134217728
| Notempty_atstart -> Unsigned.UInt32.of_int 268435456
let regexmatchflags_list_of_value v =
let open Unsigned.UInt32 in
let flags = [] in
if ((logand v (of_int 16)) != zero) then ignore (Anchored :: flags);
if ((logand v (of_int 128)) != zero) then ignore (Notbol :: flags);
if ((logand v (of_int 256)) != zero) then ignore (Noteol :: flags);
if ((logand v (of_int 1024)) != zero) then ignore (Notempty :: flags);
if ((logand v (of_int 32768)) != zero) then ignore (Partial :: flags);
if ((logand v (of_int 1048576)) != zero) then ignore (Newline_cr :: flags);
if ((logand v (of_int 2097152)) != zero) then ignore (Newline_lf :: flags);
if ((logand v (of_int 3145728)) != zero) then ignore (Newline_crlf :: flags);
if ((logand v (of_int 4194304)) != zero) then ignore (Newline_any :: flags);
if ((logand v (of_int 5242880)) != zero) then ignore (Newline_anycrlf :: flags);
if ((logand v (of_int 8388608)) != zero) then ignore (Bsr_anycrlf :: flags);
if ((logand v (of_int 16777216)) != zero) then ignore (Bsr_any :: flags);
if ((logand v (of_int 32768)) != zero) then ignore (Partial_soft :: flags);
if ((logand v (of_int 134217728)) != zero) then ignore (Partial_hard :: flags);
if ((logand v (of_int 268435456)) != zero) then ignore (Notempty_atstart :: flags);
flags
let regexmatchflags_list_to_value flags =
let open Unsigned.UInt32 in
let rec logor_flags l acc =
match l with
| [] -> acc
| f :: q -> let v = regexmatchflags_to_value f in
let acc' = logor acc v in
logor_flags q acc'
in
logor_flags flags zero
let regexmatchflags_list = view 
~read:regexmatchflags_list_of_value 
~write:regexmatchflags_list_to_value 
uint32_t

let _SEARCHPATH_SEPARATOR = Int32.of_string "59"

let _SEARCHPATH_SEPARATOR_S = ";"

let _SIZEOF_LONG = Int32.of_string "8"

let _SIZEOF_SIZE_T = Int32.of_string "8"

let _SIZEOF_SSIZE_T = Int32.of_string "8"

let _SIZEOF_VOID_P = Int32.of_string "8"

let _SOURCE_CONTINUE = true

let _SOURCE_REMOVE = false

let _SQRT2 = 1.414214

let _STR_DELIMITERS = "_-|> <."

let _SYSDEF_AF_INET = Int32.of_string "2"

let _SYSDEF_AF_INET6 = Int32.of_string "10"

let _SYSDEF_AF_UNIX = Int32.of_string "1"

let _SYSDEF_MSG_DONTROUTE = Int32.of_string "4"

let _SYSDEF_MSG_OOB = Int32.of_string "1"

let _SYSDEF_MSG_PEEK = Int32.of_string "2"

type seektype = Cur | Set | End
let seektype_of_value v =
if v = Unsigned.UInt32.of_int 0 then Cur
else if v = Unsigned.UInt32.of_int 1 then Set
else if v = Unsigned.UInt32.of_int 2 then End
else raise (Invalid_argument "Unexpected SeekType value")
let seektype_to_value = function
| Cur -> Unsigned.UInt32.of_int 0
| Set -> Unsigned.UInt32.of_int 1
| End -> Unsigned.UInt32.of_int 2
let seektype = view 
~read:seektype_of_value 
~write:seektype_to_value 
uint32_t

type shellerror = Bad_quoting | Empty_string | Failed
let shellerror_of_value v =
if v = Unsigned.UInt32.of_int 0 then Bad_quoting
else if v = Unsigned.UInt32.of_int 1 then Empty_string
else if v = Unsigned.UInt32.of_int 2 then Failed
else raise (Invalid_argument "Unexpected ShellError value")
let shellerror_to_value = function
| Bad_quoting -> Unsigned.UInt32.of_int 0
| Empty_string -> Unsigned.UInt32.of_int 1
| Failed -> Unsigned.UInt32.of_int 2
let shellerror = view 
~read:shellerror_of_value 
~write:shellerror_to_value 
uint32_t

type sliceconfig = Always_malloc | Bypass_magazines | Working_set_msecs | Color_increment | Chunk_sizes | Contention_counter
let sliceconfig_of_value v =
if v = Unsigned.UInt32.of_int 1 then Always_malloc
else if v = Unsigned.UInt32.of_int 2 then Bypass_magazines
else if v = Unsigned.UInt32.of_int 3 then Working_set_msecs
else if v = Unsigned.UInt32.of_int 4 then Color_increment
else if v = Unsigned.UInt32.of_int 5 then Chunk_sizes
else if v = Unsigned.UInt32.of_int 6 then Contention_counter
else raise (Invalid_argument "Unexpected SliceConfig value")
let sliceconfig_to_value = function
| Always_malloc -> Unsigned.UInt32.of_int 1
| Bypass_magazines -> Unsigned.UInt32.of_int 2
| Working_set_msecs -> Unsigned.UInt32.of_int 3
| Color_increment -> Unsigned.UInt32.of_int 4
| Chunk_sizes -> Unsigned.UInt32.of_int 5
| Contention_counter -> Unsigned.UInt32.of_int 6
let sliceconfig = view 
~read:sliceconfig_of_value 
~write:sliceconfig_to_value 
uint32_t

type spawnerror = Fork | Read | Chdir | Acces | Perm | Too_big | Noexec | Nametoolong | Noent | Nomem | Notdir | Loop | Txtbusy | Io | Nfile | Mfile | Inval | Isdir | Libbad | Failed
let spawnerror_of_value v =
if v = Unsigned.UInt32.of_int 0 then Fork
else if v = Unsigned.UInt32.of_int 1 then Read
else if v = Unsigned.UInt32.of_int 2 then Chdir
else if v = Unsigned.UInt32.of_int 3 then Acces
else if v = Unsigned.UInt32.of_int 4 then Perm
else if v = Unsigned.UInt32.of_int 5 then Too_big
else if v = Unsigned.UInt32.of_int 6 then Noexec
else if v = Unsigned.UInt32.of_int 7 then Nametoolong
else if v = Unsigned.UInt32.of_int 8 then Noent
else if v = Unsigned.UInt32.of_int 9 then Nomem
else if v = Unsigned.UInt32.of_int 10 then Notdir
else if v = Unsigned.UInt32.of_int 11 then Loop
else if v = Unsigned.UInt32.of_int 12 then Txtbusy
else if v = Unsigned.UInt32.of_int 13 then Io
else if v = Unsigned.UInt32.of_int 14 then Nfile
else if v = Unsigned.UInt32.of_int 15 then Mfile
else if v = Unsigned.UInt32.of_int 16 then Inval
else if v = Unsigned.UInt32.of_int 17 then Isdir
else if v = Unsigned.UInt32.of_int 18 then Libbad
else if v = Unsigned.UInt32.of_int 19 then Failed
else raise (Invalid_argument "Unexpected SpawnError value")
let spawnerror_to_value = function
| Fork -> Unsigned.UInt32.of_int 0
| Read -> Unsigned.UInt32.of_int 1
| Chdir -> Unsigned.UInt32.of_int 2
| Acces -> Unsigned.UInt32.of_int 3
| Perm -> Unsigned.UInt32.of_int 4
| Too_big -> Unsigned.UInt32.of_int 5
| Noexec -> Unsigned.UInt32.of_int 6
| Nametoolong -> Unsigned.UInt32.of_int 7
| Noent -> Unsigned.UInt32.of_int 8
| Nomem -> Unsigned.UInt32.of_int 9
| Notdir -> Unsigned.UInt32.of_int 10
| Loop -> Unsigned.UInt32.of_int 11
| Txtbusy -> Unsigned.UInt32.of_int 12
| Io -> Unsigned.UInt32.of_int 13
| Nfile -> Unsigned.UInt32.of_int 14
| Mfile -> Unsigned.UInt32.of_int 15
| Inval -> Unsigned.UInt32.of_int 16
| Isdir -> Unsigned.UInt32.of_int 17
| Libbad -> Unsigned.UInt32.of_int 18
| Failed -> Unsigned.UInt32.of_int 19
let spawnerror = view 
~read:spawnerror_of_value 
~write:spawnerror_to_value 
uint32_t

type spawnflags = Default | Leave_descriptors_open | Do_not_reap_child | Search_path | Stdout_to_dev_null | Stderr_to_dev_null | Child_inherits_stdin | File_and_argv_zero | Search_path_from_envp | Cloexec_pipes
type spawnflags_list = spawnflags list
let spawnflags_of_value v =
if v = Unsigned.UInt32.of_int 0 then Default
else if v = Unsigned.UInt32.of_int 1 then Leave_descriptors_open
else if v = Unsigned.UInt32.of_int 2 then Do_not_reap_child
else if v = Unsigned.UInt32.of_int 4 then Search_path
else if v = Unsigned.UInt32.of_int 8 then Stdout_to_dev_null
else if v = Unsigned.UInt32.of_int 16 then Stderr_to_dev_null
else if v = Unsigned.UInt32.of_int 32 then Child_inherits_stdin
else if v = Unsigned.UInt32.of_int 64 then File_and_argv_zero
else if v = Unsigned.UInt32.of_int 128 then Search_path_from_envp
else if v = Unsigned.UInt32.of_int 256 then Cloexec_pipes
else raise (Invalid_argument "Unexpected SpawnFlags value")
let spawnflags_to_value = function
| Default -> Unsigned.UInt32.of_int 0
| Leave_descriptors_open -> Unsigned.UInt32.of_int 1
| Do_not_reap_child -> Unsigned.UInt32.of_int 2
| Search_path -> Unsigned.UInt32.of_int 4
| Stdout_to_dev_null -> Unsigned.UInt32.of_int 8
| Stderr_to_dev_null -> Unsigned.UInt32.of_int 16
| Child_inherits_stdin -> Unsigned.UInt32.of_int 32
| File_and_argv_zero -> Unsigned.UInt32.of_int 64
| Search_path_from_envp -> Unsigned.UInt32.of_int 128
| Cloexec_pipes -> Unsigned.UInt32.of_int 256
let spawnflags_list_of_value v =
let open Unsigned.UInt32 in
let flags = [] in
if ((logand v (of_int 0)) != zero) then ignore (Default :: flags);
if ((logand v (of_int 1)) != zero) then ignore (Leave_descriptors_open :: flags);
if ((logand v (of_int 2)) != zero) then ignore (Do_not_reap_child :: flags);
if ((logand v (of_int 4)) != zero) then ignore (Search_path :: flags);
if ((logand v (of_int 8)) != zero) then ignore (Stdout_to_dev_null :: flags);
if ((logand v (of_int 16)) != zero) then ignore (Stderr_to_dev_null :: flags);
if ((logand v (of_int 32)) != zero) then ignore (Child_inherits_stdin :: flags);
if ((logand v (of_int 64)) != zero) then ignore (File_and_argv_zero :: flags);
if ((logand v (of_int 128)) != zero) then ignore (Search_path_from_envp :: flags);
if ((logand v (of_int 256)) != zero) then ignore (Cloexec_pipes :: flags);
flags
let spawnflags_list_to_value flags =
let open Unsigned.UInt32 in
let rec logor_flags l acc =
match l with
| [] -> acc
| f :: q -> let v = spawnflags_to_value f in
let acc' = logor acc v in
logor_flags q acc'
in
logor_flags flags zero
let spawnflags_list = view 
~read:spawnflags_list_of_value 
~write:spawnflags_list_to_value 
uint32_t

let _TIME_SPAN_DAY = 86400000000L

let _TIME_SPAN_HOUR = 3600000000L

let _TIME_SPAN_MILLISECOND = 1000L

let _TIME_SPAN_MINUTE = 60000000L

let _TIME_SPAN_SECOND = 1000000L

type testfiletype = Dist | Built
let testfiletype_of_value v =
if v = Unsigned.UInt32.of_int 0 then Dist
else if v = Unsigned.UInt32.of_int 1 then Built
else raise (Invalid_argument "Unexpected TestFileType value")
let testfiletype_to_value = function
| Dist -> Unsigned.UInt32.of_int 0
| Built -> Unsigned.UInt32.of_int 1
let testfiletype = view 
~read:testfiletype_of_value 
~write:testfiletype_to_value 
uint32_t

type testlogtype = None | Error | Start_binary | List_case | Skip_case | Start_case | Stop_case | Min_result | Max_result | Message | Start_suite | Stop_suite
let testlogtype_of_value v =
if v = Unsigned.UInt32.of_int 0 then None
else if v = Unsigned.UInt32.of_int 1 then Error
else if v = Unsigned.UInt32.of_int 2 then Start_binary
else if v = Unsigned.UInt32.of_int 3 then List_case
else if v = Unsigned.UInt32.of_int 4 then Skip_case
else if v = Unsigned.UInt32.of_int 5 then Start_case
else if v = Unsigned.UInt32.of_int 6 then Stop_case
else if v = Unsigned.UInt32.of_int 7 then Min_result
else if v = Unsigned.UInt32.of_int 8 then Max_result
else if v = Unsigned.UInt32.of_int 9 then Message
else if v = Unsigned.UInt32.of_int 10 then Start_suite
else if v = Unsigned.UInt32.of_int 11 then Stop_suite
else raise (Invalid_argument "Unexpected TestLogType value")
let testlogtype_to_value = function
| None -> Unsigned.UInt32.of_int 0
| Error -> Unsigned.UInt32.of_int 1
| Start_binary -> Unsigned.UInt32.of_int 2
| List_case -> Unsigned.UInt32.of_int 3
| Skip_case -> Unsigned.UInt32.of_int 4
| Start_case -> Unsigned.UInt32.of_int 5
| Stop_case -> Unsigned.UInt32.of_int 6
| Min_result -> Unsigned.UInt32.of_int 7
| Max_result -> Unsigned.UInt32.of_int 8
| Message -> Unsigned.UInt32.of_int 9
| Start_suite -> Unsigned.UInt32.of_int 10
| Stop_suite -> Unsigned.UInt32.of_int 11
let testlogtype = view 
~read:testlogtype_of_value 
~write:testlogtype_to_value 
uint32_t

type testsubprocessflags = Stdin | Stdout | Stderr
type testsubprocessflags_list = testsubprocessflags list
let testsubprocessflags_of_value v =
if v = Unsigned.UInt32.of_int 1 then Stdin
else if v = Unsigned.UInt32.of_int 2 then Stdout
else if v = Unsigned.UInt32.of_int 4 then Stderr
else raise (Invalid_argument "Unexpected TestSubprocessFlags value")
let testsubprocessflags_to_value = function
| Stdin -> Unsigned.UInt32.of_int 1
| Stdout -> Unsigned.UInt32.of_int 2
| Stderr -> Unsigned.UInt32.of_int 4
let testsubprocessflags_list_of_value v =
let open Unsigned.UInt32 in
let flags = [] in
if ((logand v (of_int 1)) != zero) then ignore (Stdin :: flags);
if ((logand v (of_int 2)) != zero) then ignore (Stdout :: flags);
if ((logand v (of_int 4)) != zero) then ignore (Stderr :: flags);
flags
let testsubprocessflags_list_to_value flags =
let open Unsigned.UInt32 in
let rec logor_flags l acc =
match l with
| [] -> acc
| f :: q -> let v = testsubprocessflags_to_value f in
let acc' = logor acc v in
logor_flags q acc'
in
logor_flags flags zero
let testsubprocessflags_list = view 
~read:testsubprocessflags_list_of_value 
~write:testsubprocessflags_list_to_value 
uint32_t

type testtrapflags = Silence_stdout | Silence_stderr | Inherit_stdin
type testtrapflags_list = testtrapflags list
let testtrapflags_of_value v =
if v = Unsigned.UInt32.of_int 128 then Silence_stdout
else if v = Unsigned.UInt32.of_int 256 then Silence_stderr
else if v = Unsigned.UInt32.of_int 512 then Inherit_stdin
else raise (Invalid_argument "Unexpected TestTrapFlags value")
let testtrapflags_to_value = function
| Silence_stdout -> Unsigned.UInt32.of_int 128
| Silence_stderr -> Unsigned.UInt32.of_int 256
| Inherit_stdin -> Unsigned.UInt32.of_int 512
let testtrapflags_list_of_value v =
let open Unsigned.UInt32 in
let flags = [] in
if ((logand v (of_int 128)) != zero) then ignore (Silence_stdout :: flags);
if ((logand v (of_int 256)) != zero) then ignore (Silence_stderr :: flags);
if ((logand v (of_int 512)) != zero) then ignore (Inherit_stdin :: flags);
flags
let testtrapflags_list_to_value flags =
let open Unsigned.UInt32 in
let rec logor_flags l acc =
match l with
| [] -> acc
| f :: q -> let v = testtrapflags_to_value f in
let acc' = logor acc v in
logor_flags q acc'
in
logor_flags flags zero
let testtrapflags_list = view 
~read:testtrapflags_list_of_value 
~write:testtrapflags_list_to_value 
uint32_t

type threaderror = Thread_error_again
let threaderror_of_value v =
if v = Unsigned.UInt32.of_int 0 then Thread_error_again
else raise (Invalid_argument "Unexpected ThreadError value")
let threaderror_to_value = function
| Thread_error_again -> Unsigned.UInt32.of_int 0
let threaderror = view 
~read:threaderror_of_value 
~write:threaderror_to_value 
uint32_t

type timetype = Standard | Daylight | Universal
let timetype_of_value v =
if v = Unsigned.UInt32.of_int 0 then Standard
else if v = Unsigned.UInt32.of_int 1 then Daylight
else if v = Unsigned.UInt32.of_int 2 then Universal
else raise (Invalid_argument "Unexpected TimeType value")
let timetype_to_value = function
| Standard -> Unsigned.UInt32.of_int 0
| Daylight -> Unsigned.UInt32.of_int 1
| Universal -> Unsigned.UInt32.of_int 2
let timetype = view 
~read:timetype_of_value 
~write:timetype_to_value 
uint32_t

type tokentype = Eof | Left_paren | Right_paren | Left_curly | Right_curly | Left_brace | Right_brace | Equal_sign | Comma | None | Error | Char | Binary | Octal | Int | Hex | Float | String | Symbol | Identifier | Identifier_null | Comment_single | Comment_multi
let tokentype_of_value v =
if v = Unsigned.UInt32.of_int 0 then Eof
else if v = Unsigned.UInt32.of_int 40 then Left_paren
else if v = Unsigned.UInt32.of_int 41 then Right_paren
else if v = Unsigned.UInt32.of_int 123 then Left_curly
else if v = Unsigned.UInt32.of_int 125 then Right_curly
else if v = Unsigned.UInt32.of_int 91 then Left_brace
else if v = Unsigned.UInt32.of_int 93 then Right_brace
else if v = Unsigned.UInt32.of_int 61 then Equal_sign
else if v = Unsigned.UInt32.of_int 44 then Comma
else if v = Unsigned.UInt32.of_int 256 then None
else if v = Unsigned.UInt32.of_int 257 then Error
else if v = Unsigned.UInt32.of_int 258 then Char
else if v = Unsigned.UInt32.of_int 259 then Binary
else if v = Unsigned.UInt32.of_int 260 then Octal
else if v = Unsigned.UInt32.of_int 261 then Int
else if v = Unsigned.UInt32.of_int 262 then Hex
else if v = Unsigned.UInt32.of_int 263 then Float
else if v = Unsigned.UInt32.of_int 264 then String
else if v = Unsigned.UInt32.of_int 265 then Symbol
else if v = Unsigned.UInt32.of_int 266 then Identifier
else if v = Unsigned.UInt32.of_int 267 then Identifier_null
else if v = Unsigned.UInt32.of_int 268 then Comment_single
else if v = Unsigned.UInt32.of_int 269 then Comment_multi
else raise (Invalid_argument "Unexpected TokenType value")
let tokentype_to_value = function
| Eof -> Unsigned.UInt32.of_int 0
| Left_paren -> Unsigned.UInt32.of_int 40
| Right_paren -> Unsigned.UInt32.of_int 41
| Left_curly -> Unsigned.UInt32.of_int 123
| Right_curly -> Unsigned.UInt32.of_int 125
| Left_brace -> Unsigned.UInt32.of_int 91
| Right_brace -> Unsigned.UInt32.of_int 93
| Equal_sign -> Unsigned.UInt32.of_int 61
| Comma -> Unsigned.UInt32.of_int 44
| None -> Unsigned.UInt32.of_int 256
| Error -> Unsigned.UInt32.of_int 257
| Char -> Unsigned.UInt32.of_int 258
| Binary -> Unsigned.UInt32.of_int 259
| Octal -> Unsigned.UInt32.of_int 260
| Int -> Unsigned.UInt32.of_int 261
| Hex -> Unsigned.UInt32.of_int 262
| Float -> Unsigned.UInt32.of_int 263
| String -> Unsigned.UInt32.of_int 264
| Symbol -> Unsigned.UInt32.of_int 265
| Identifier -> Unsigned.UInt32.of_int 266
| Identifier_null -> Unsigned.UInt32.of_int 267
| Comment_single -> Unsigned.UInt32.of_int 268
| Comment_multi -> Unsigned.UInt32.of_int 269
let tokentype = view 
~read:tokentype_of_value 
~write:tokentype_to_value 
uint32_t

type traverseflags = Leaves | Non_leaves | All | Mask | Leafs | Non_leafs
type traverseflags_list = traverseflags list
let traverseflags_of_value v =
if v = Unsigned.UInt32.of_int 1 then Leaves
else if v = Unsigned.UInt32.of_int 2 then Non_leaves
else if v = Unsigned.UInt32.of_int 3 then All
else if v = Unsigned.UInt32.of_int 3 then Mask
else if v = Unsigned.UInt32.of_int 1 then Leafs
else if v = Unsigned.UInt32.of_int 2 then Non_leafs
else raise (Invalid_argument "Unexpected TraverseFlags value")
let traverseflags_to_value = function
| Leaves -> Unsigned.UInt32.of_int 1
| Non_leaves -> Unsigned.UInt32.of_int 2
| All -> Unsigned.UInt32.of_int 3
| Mask -> Unsigned.UInt32.of_int 3
| Leafs -> Unsigned.UInt32.of_int 1
| Non_leafs -> Unsigned.UInt32.of_int 2
let traverseflags_list_of_value v =
let open Unsigned.UInt32 in
let flags = [] in
if ((logand v (of_int 1)) != zero) then ignore (Leaves :: flags);
if ((logand v (of_int 2)) != zero) then ignore (Non_leaves :: flags);
if ((logand v (of_int 3)) != zero) then ignore (All :: flags);
if ((logand v (of_int 3)) != zero) then ignore (Mask :: flags);
if ((logand v (of_int 1)) != zero) then ignore (Leafs :: flags);
if ((logand v (of_int 2)) != zero) then ignore (Non_leafs :: flags);
flags
let traverseflags_list_to_value flags =
let open Unsigned.UInt32 in
let rec logor_flags l acc =
match l with
| [] -> acc
| f :: q -> let v = traverseflags_to_value f in
let acc' = logor acc v in
logor_flags q acc'
in
logor_flags flags zero
let traverseflags_list = view 
~read:traverseflags_list_of_value 
~write:traverseflags_list_to_value 
uint32_t

type traversetype = In_order | Pre_order | Post_order | Level_order
let traversetype_of_value v =
if v = Unsigned.UInt32.of_int 0 then In_order
else if v = Unsigned.UInt32.of_int 1 then Pre_order
else if v = Unsigned.UInt32.of_int 2 then Post_order
else if v = Unsigned.UInt32.of_int 3 then Level_order
else raise (Invalid_argument "Unexpected TraverseType value")
let traversetype_to_value = function
| In_order -> Unsigned.UInt32.of_int 0
| Pre_order -> Unsigned.UInt32.of_int 1
| Post_order -> Unsigned.UInt32.of_int 2
| Level_order -> Unsigned.UInt32.of_int 3
let traversetype = view 
~read:traversetype_of_value 
~write:traversetype_to_value 
uint32_t

let _UNICHAR_MAX_DECOMPOSITION_LENGTH = Int32.of_string "18"

let _URI_RESERVED_CHARS_GENERIC_DELIMITERS = ":/?#[]@"

let _URI_RESERVED_CHARS_SUBCOMPONENT_DELIMITERS = "!$&'()*+,;="

let _USEC_PER_SEC = Int32.of_string "1000000"

type unicodebreaktype = Mandatory | Carriage_return | Line_feed | Combining_mark | Surrogate | Zero_width_space | Inseparable | Non_breaking_glue | Contingent | Space | After | Before | Before_and_after | Hyphen | Non_starter | Open_punctuation | Close_punctuation | Quotation | Exclamation | Ideographic | Numeric | Infix_separator | Symbol | Alphabetic | Prefix | Postfix | Complex_context | Ambiguous | Unknown | Next_line | Word_joiner | Hangul_l_jamo | Hangul_v_jamo | Hangul_t_jamo | Hangul_lv_syllable | Hangul_lvt_syllable | Close_paranthesis | Conditional_japanese_starter | Hebrew_letter | Regional_indicator | Emoji_base | Emoji_modifier | Zero_width_joiner
let unicodebreaktype_of_value v =
if v = Unsigned.UInt32.of_int 0 then Mandatory
else if v = Unsigned.UInt32.of_int 1 then Carriage_return
else if v = Unsigned.UInt32.of_int 2 then Line_feed
else if v = Unsigned.UInt32.of_int 3 then Combining_mark
else if v = Unsigned.UInt32.of_int 4 then Surrogate
else if v = Unsigned.UInt32.of_int 5 then Zero_width_space
else if v = Unsigned.UInt32.of_int 6 then Inseparable
else if v = Unsigned.UInt32.of_int 7 then Non_breaking_glue
else if v = Unsigned.UInt32.of_int 8 then Contingent
else if v = Unsigned.UInt32.of_int 9 then Space
else if v = Unsigned.UInt32.of_int 10 then After
else if v = Unsigned.UInt32.of_int 11 then Before
else if v = Unsigned.UInt32.of_int 12 then Before_and_after
else if v = Unsigned.UInt32.of_int 13 then Hyphen
else if v = Unsigned.UInt32.of_int 14 then Non_starter
else if v = Unsigned.UInt32.of_int 15 then Open_punctuation
else if v = Unsigned.UInt32.of_int 16 then Close_punctuation
else if v = Unsigned.UInt32.of_int 17 then Quotation
else if v = Unsigned.UInt32.of_int 18 then Exclamation
else if v = Unsigned.UInt32.of_int 19 then Ideographic
else if v = Unsigned.UInt32.of_int 20 then Numeric
else if v = Unsigned.UInt32.of_int 21 then Infix_separator
else if v = Unsigned.UInt32.of_int 22 then Symbol
else if v = Unsigned.UInt32.of_int 23 then Alphabetic
else if v = Unsigned.UInt32.of_int 24 then Prefix
else if v = Unsigned.UInt32.of_int 25 then Postfix
else if v = Unsigned.UInt32.of_int 26 then Complex_context
else if v = Unsigned.UInt32.of_int 27 then Ambiguous
else if v = Unsigned.UInt32.of_int 28 then Unknown
else if v = Unsigned.UInt32.of_int 29 then Next_line
else if v = Unsigned.UInt32.of_int 30 then Word_joiner
else if v = Unsigned.UInt32.of_int 31 then Hangul_l_jamo
else if v = Unsigned.UInt32.of_int 32 then Hangul_v_jamo
else if v = Unsigned.UInt32.of_int 33 then Hangul_t_jamo
else if v = Unsigned.UInt32.of_int 34 then Hangul_lv_syllable
else if v = Unsigned.UInt32.of_int 35 then Hangul_lvt_syllable
else if v = Unsigned.UInt32.of_int 36 then Close_paranthesis
else if v = Unsigned.UInt32.of_int 37 then Conditional_japanese_starter
else if v = Unsigned.UInt32.of_int 38 then Hebrew_letter
else if v = Unsigned.UInt32.of_int 39 then Regional_indicator
else if v = Unsigned.UInt32.of_int 40 then Emoji_base
else if v = Unsigned.UInt32.of_int 41 then Emoji_modifier
else if v = Unsigned.UInt32.of_int 42 then Zero_width_joiner
else raise (Invalid_argument "Unexpected UnicodeBreakType value")
let unicodebreaktype_to_value = function
| Mandatory -> Unsigned.UInt32.of_int 0
| Carriage_return -> Unsigned.UInt32.of_int 1
| Line_feed -> Unsigned.UInt32.of_int 2
| Combining_mark -> Unsigned.UInt32.of_int 3
| Surrogate -> Unsigned.UInt32.of_int 4
| Zero_width_space -> Unsigned.UInt32.of_int 5
| Inseparable -> Unsigned.UInt32.of_int 6
| Non_breaking_glue -> Unsigned.UInt32.of_int 7
| Contingent -> Unsigned.UInt32.of_int 8
| Space -> Unsigned.UInt32.of_int 9
| After -> Unsigned.UInt32.of_int 10
| Before -> Unsigned.UInt32.of_int 11
| Before_and_after -> Unsigned.UInt32.of_int 12
| Hyphen -> Unsigned.UInt32.of_int 13
| Non_starter -> Unsigned.UInt32.of_int 14
| Open_punctuation -> Unsigned.UInt32.of_int 15
| Close_punctuation -> Unsigned.UInt32.of_int 16
| Quotation -> Unsigned.UInt32.of_int 17
| Exclamation -> Unsigned.UInt32.of_int 18
| Ideographic -> Unsigned.UInt32.of_int 19
| Numeric -> Unsigned.UInt32.of_int 20
| Infix_separator -> Unsigned.UInt32.of_int 21
| Symbol -> Unsigned.UInt32.of_int 22
| Alphabetic -> Unsigned.UInt32.of_int 23
| Prefix -> Unsigned.UInt32.of_int 24
| Postfix -> Unsigned.UInt32.of_int 25
| Complex_context -> Unsigned.UInt32.of_int 26
| Ambiguous -> Unsigned.UInt32.of_int 27
| Unknown -> Unsigned.UInt32.of_int 28
| Next_line -> Unsigned.UInt32.of_int 29
| Word_joiner -> Unsigned.UInt32.of_int 30
| Hangul_l_jamo -> Unsigned.UInt32.of_int 31
| Hangul_v_jamo -> Unsigned.UInt32.of_int 32
| Hangul_t_jamo -> Unsigned.UInt32.of_int 33
| Hangul_lv_syllable -> Unsigned.UInt32.of_int 34
| Hangul_lvt_syllable -> Unsigned.UInt32.of_int 35
| Close_paranthesis -> Unsigned.UInt32.of_int 36
| Conditional_japanese_starter -> Unsigned.UInt32.of_int 37
| Hebrew_letter -> Unsigned.UInt32.of_int 38
| Regional_indicator -> Unsigned.UInt32.of_int 39
| Emoji_base -> Unsigned.UInt32.of_int 40
| Emoji_modifier -> Unsigned.UInt32.of_int 41
| Zero_width_joiner -> Unsigned.UInt32.of_int 42
let unicodebreaktype = view 
~read:unicodebreaktype_of_value 
~write:unicodebreaktype_to_value 
uint32_t

type unicodescript = Invalid_code | Common | Inherited | Arabic | Armenian | Bengali | Bopomofo | Cherokee | Coptic | Cyrillic | Deseret | Devanagari | Ethiopic | Georgian | Gothic | Greek | Gujarati | Gurmukhi | Han | Hangul | Hebrew | Hiragana | Kannada | Katakana | Khmer | Lao | Latin | Malayalam | Mongolian | Myanmar | Ogham | Old_italic | Oriya | Runic | Sinhala | Syriac | Tamil | Telugu | Thaana | Thai | Tibetan | Canadian_aboriginal | Yi | Tagalog | Hanunoo | Buhid | Tagbanwa | Braille | Cypriot | Limbu | Osmanya | Shavian | Linear_b | Tai_le | Ugaritic | New_tai_lue | Buginese | Glagolitic | Tifinagh | Syloti_nagri | Old_persian | Kharoshthi | Unknown | Balinese | Cuneiform | Phoenician | Phags_pa | Nko | Kayah_li | Lepcha | Rejang | Sundanese | Saurashtra | Cham | Ol_chiki | Vai | Carian | Lycian | Lydian | Avestan | Bamum | Egyptian_hieroglyphs | Imperial_aramaic | Inscriptional_pahlavi | Inscriptional_parthian | Javanese | Kaithi | Lisu | Meetei_mayek | Old_south_arabian | Old_turkic | Samaritan | Tai_tham | Tai_viet | Batak | Brahmi | Mandaic | Chakma | Meroitic_cursive | Meroitic_hieroglyphs | Miao | Sharada | Sora_sompeng | Takri | Bassa_vah | Caucasian_albanian | Duployan | Elbasan | Grantha | Khojki | Khudawadi | Linear_a | Mahajani | Manichaean | Mende_kikakui | Modi | Mro | Nabataean | Old_north_arabian | Old_permic | Pahawh_hmong | Palmyrene | Pau_cin_hau | Psalter_pahlavi | Siddham | Tirhuta | Warang_citi | Ahom | Anatolian_hieroglyphs | Hatran | Multani | Old_hungarian | Signwriting | Adlam | Bhaiksuki | Marchen | Newa | Osage | Tangut
let unicodescript_of_value v =
if v = Int32.of_int (-1) then Invalid_code
else if v = Int32.of_int 0 then Common
else if v = Int32.of_int 1 then Inherited
else if v = Int32.of_int 2 then Arabic
else if v = Int32.of_int 3 then Armenian
else if v = Int32.of_int 4 then Bengali
else if v = Int32.of_int 5 then Bopomofo
else if v = Int32.of_int 6 then Cherokee
else if v = Int32.of_int 7 then Coptic
else if v = Int32.of_int 8 then Cyrillic
else if v = Int32.of_int 9 then Deseret
else if v = Int32.of_int 10 then Devanagari
else if v = Int32.of_int 11 then Ethiopic
else if v = Int32.of_int 12 then Georgian
else if v = Int32.of_int 13 then Gothic
else if v = Int32.of_int 14 then Greek
else if v = Int32.of_int 15 then Gujarati
else if v = Int32.of_int 16 then Gurmukhi
else if v = Int32.of_int 17 then Han
else if v = Int32.of_int 18 then Hangul
else if v = Int32.of_int 19 then Hebrew
else if v = Int32.of_int 20 then Hiragana
else if v = Int32.of_int 21 then Kannada
else if v = Int32.of_int 22 then Katakana
else if v = Int32.of_int 23 then Khmer
else if v = Int32.of_int 24 then Lao
else if v = Int32.of_int 25 then Latin
else if v = Int32.of_int 26 then Malayalam
else if v = Int32.of_int 27 then Mongolian
else if v = Int32.of_int 28 then Myanmar
else if v = Int32.of_int 29 then Ogham
else if v = Int32.of_int 30 then Old_italic
else if v = Int32.of_int 31 then Oriya
else if v = Int32.of_int 32 then Runic
else if v = Int32.of_int 33 then Sinhala
else if v = Int32.of_int 34 then Syriac
else if v = Int32.of_int 35 then Tamil
else if v = Int32.of_int 36 then Telugu
else if v = Int32.of_int 37 then Thaana
else if v = Int32.of_int 38 then Thai
else if v = Int32.of_int 39 then Tibetan
else if v = Int32.of_int 40 then Canadian_aboriginal
else if v = Int32.of_int 41 then Yi
else if v = Int32.of_int 42 then Tagalog
else if v = Int32.of_int 43 then Hanunoo
else if v = Int32.of_int 44 then Buhid
else if v = Int32.of_int 45 then Tagbanwa
else if v = Int32.of_int 46 then Braille
else if v = Int32.of_int 47 then Cypriot
else if v = Int32.of_int 48 then Limbu
else if v = Int32.of_int 49 then Osmanya
else if v = Int32.of_int 50 then Shavian
else if v = Int32.of_int 51 then Linear_b
else if v = Int32.of_int 52 then Tai_le
else if v = Int32.of_int 53 then Ugaritic
else if v = Int32.of_int 54 then New_tai_lue
else if v = Int32.of_int 55 then Buginese
else if v = Int32.of_int 56 then Glagolitic
else if v = Int32.of_int 57 then Tifinagh
else if v = Int32.of_int 58 then Syloti_nagri
else if v = Int32.of_int 59 then Old_persian
else if v = Int32.of_int 60 then Kharoshthi
else if v = Int32.of_int 61 then Unknown
else if v = Int32.of_int 62 then Balinese
else if v = Int32.of_int 63 then Cuneiform
else if v = Int32.of_int 64 then Phoenician
else if v = Int32.of_int 65 then Phags_pa
else if v = Int32.of_int 66 then Nko
else if v = Int32.of_int 67 then Kayah_li
else if v = Int32.of_int 68 then Lepcha
else if v = Int32.of_int 69 then Rejang
else if v = Int32.of_int 70 then Sundanese
else if v = Int32.of_int 71 then Saurashtra
else if v = Int32.of_int 72 then Cham
else if v = Int32.of_int 73 then Ol_chiki
else if v = Int32.of_int 74 then Vai
else if v = Int32.of_int 75 then Carian
else if v = Int32.of_int 76 then Lycian
else if v = Int32.of_int 77 then Lydian
else if v = Int32.of_int 78 then Avestan
else if v = Int32.of_int 79 then Bamum
else if v = Int32.of_int 80 then Egyptian_hieroglyphs
else if v = Int32.of_int 81 then Imperial_aramaic
else if v = Int32.of_int 82 then Inscriptional_pahlavi
else if v = Int32.of_int 83 then Inscriptional_parthian
else if v = Int32.of_int 84 then Javanese
else if v = Int32.of_int 85 then Kaithi
else if v = Int32.of_int 86 then Lisu
else if v = Int32.of_int 87 then Meetei_mayek
else if v = Int32.of_int 88 then Old_south_arabian
else if v = Int32.of_int 89 then Old_turkic
else if v = Int32.of_int 90 then Samaritan
else if v = Int32.of_int 91 then Tai_tham
else if v = Int32.of_int 92 then Tai_viet
else if v = Int32.of_int 93 then Batak
else if v = Int32.of_int 94 then Brahmi
else if v = Int32.of_int 95 then Mandaic
else if v = Int32.of_int 96 then Chakma
else if v = Int32.of_int 97 then Meroitic_cursive
else if v = Int32.of_int 98 then Meroitic_hieroglyphs
else if v = Int32.of_int 99 then Miao
else if v = Int32.of_int 100 then Sharada
else if v = Int32.of_int 101 then Sora_sompeng
else if v = Int32.of_int 102 then Takri
else if v = Int32.of_int 103 then Bassa_vah
else if v = Int32.of_int 104 then Caucasian_albanian
else if v = Int32.of_int 105 then Duployan
else if v = Int32.of_int 106 then Elbasan
else if v = Int32.of_int 107 then Grantha
else if v = Int32.of_int 108 then Khojki
else if v = Int32.of_int 109 then Khudawadi
else if v = Int32.of_int 110 then Linear_a
else if v = Int32.of_int 111 then Mahajani
else if v = Int32.of_int 112 then Manichaean
else if v = Int32.of_int 113 then Mende_kikakui
else if v = Int32.of_int 114 then Modi
else if v = Int32.of_int 115 then Mro
else if v = Int32.of_int 116 then Nabataean
else if v = Int32.of_int 117 then Old_north_arabian
else if v = Int32.of_int 118 then Old_permic
else if v = Int32.of_int 119 then Pahawh_hmong
else if v = Int32.of_int 120 then Palmyrene
else if v = Int32.of_int 121 then Pau_cin_hau
else if v = Int32.of_int 122 then Psalter_pahlavi
else if v = Int32.of_int 123 then Siddham
else if v = Int32.of_int 124 then Tirhuta
else if v = Int32.of_int 125 then Warang_citi
else if v = Int32.of_int 126 then Ahom
else if v = Int32.of_int 127 then Anatolian_hieroglyphs
else if v = Int32.of_int 128 then Hatran
else if v = Int32.of_int 129 then Multani
else if v = Int32.of_int 130 then Old_hungarian
else if v = Int32.of_int 131 then Signwriting
else if v = Int32.of_int 132 then Adlam
else if v = Int32.of_int 133 then Bhaiksuki
else if v = Int32.of_int 134 then Marchen
else if v = Int32.of_int 135 then Newa
else if v = Int32.of_int 136 then Osage
else if v = Int32.of_int 137 then Tangut
else raise (Invalid_argument "Unexpected UnicodeScript value")
let unicodescript_to_value = function
| Invalid_code -> Int32.of_int (-1)
| Common -> Int32.of_int 0
| Inherited -> Int32.of_int 1
| Arabic -> Int32.of_int 2
| Armenian -> Int32.of_int 3
| Bengali -> Int32.of_int 4
| Bopomofo -> Int32.of_int 5
| Cherokee -> Int32.of_int 6
| Coptic -> Int32.of_int 7
| Cyrillic -> Int32.of_int 8
| Deseret -> Int32.of_int 9
| Devanagari -> Int32.of_int 10
| Ethiopic -> Int32.of_int 11
| Georgian -> Int32.of_int 12
| Gothic -> Int32.of_int 13
| Greek -> Int32.of_int 14
| Gujarati -> Int32.of_int 15
| Gurmukhi -> Int32.of_int 16
| Han -> Int32.of_int 17
| Hangul -> Int32.of_int 18
| Hebrew -> Int32.of_int 19
| Hiragana -> Int32.of_int 20
| Kannada -> Int32.of_int 21
| Katakana -> Int32.of_int 22
| Khmer -> Int32.of_int 23
| Lao -> Int32.of_int 24
| Latin -> Int32.of_int 25
| Malayalam -> Int32.of_int 26
| Mongolian -> Int32.of_int 27
| Myanmar -> Int32.of_int 28
| Ogham -> Int32.of_int 29
| Old_italic -> Int32.of_int 30
| Oriya -> Int32.of_int 31
| Runic -> Int32.of_int 32
| Sinhala -> Int32.of_int 33
| Syriac -> Int32.of_int 34
| Tamil -> Int32.of_int 35
| Telugu -> Int32.of_int 36
| Thaana -> Int32.of_int 37
| Thai -> Int32.of_int 38
| Tibetan -> Int32.of_int 39
| Canadian_aboriginal -> Int32.of_int 40
| Yi -> Int32.of_int 41
| Tagalog -> Int32.of_int 42
| Hanunoo -> Int32.of_int 43
| Buhid -> Int32.of_int 44
| Tagbanwa -> Int32.of_int 45
| Braille -> Int32.of_int 46
| Cypriot -> Int32.of_int 47
| Limbu -> Int32.of_int 48
| Osmanya -> Int32.of_int 49
| Shavian -> Int32.of_int 50
| Linear_b -> Int32.of_int 51
| Tai_le -> Int32.of_int 52
| Ugaritic -> Int32.of_int 53
| New_tai_lue -> Int32.of_int 54
| Buginese -> Int32.of_int 55
| Glagolitic -> Int32.of_int 56
| Tifinagh -> Int32.of_int 57
| Syloti_nagri -> Int32.of_int 58
| Old_persian -> Int32.of_int 59
| Kharoshthi -> Int32.of_int 60
| Unknown -> Int32.of_int 61
| Balinese -> Int32.of_int 62
| Cuneiform -> Int32.of_int 63
| Phoenician -> Int32.of_int 64
| Phags_pa -> Int32.of_int 65
| Nko -> Int32.of_int 66
| Kayah_li -> Int32.of_int 67
| Lepcha -> Int32.of_int 68
| Rejang -> Int32.of_int 69
| Sundanese -> Int32.of_int 70
| Saurashtra -> Int32.of_int 71
| Cham -> Int32.of_int 72
| Ol_chiki -> Int32.of_int 73
| Vai -> Int32.of_int 74
| Carian -> Int32.of_int 75
| Lycian -> Int32.of_int 76
| Lydian -> Int32.of_int 77
| Avestan -> Int32.of_int 78
| Bamum -> Int32.of_int 79
| Egyptian_hieroglyphs -> Int32.of_int 80
| Imperial_aramaic -> Int32.of_int 81
| Inscriptional_pahlavi -> Int32.of_int 82
| Inscriptional_parthian -> Int32.of_int 83
| Javanese -> Int32.of_int 84
| Kaithi -> Int32.of_int 85
| Lisu -> Int32.of_int 86
| Meetei_mayek -> Int32.of_int 87
| Old_south_arabian -> Int32.of_int 88
| Old_turkic -> Int32.of_int 89
| Samaritan -> Int32.of_int 90
| Tai_tham -> Int32.of_int 91
| Tai_viet -> Int32.of_int 92
| Batak -> Int32.of_int 93
| Brahmi -> Int32.of_int 94
| Mandaic -> Int32.of_int 95
| Chakma -> Int32.of_int 96
| Meroitic_cursive -> Int32.of_int 97
| Meroitic_hieroglyphs -> Int32.of_int 98
| Miao -> Int32.of_int 99
| Sharada -> Int32.of_int 100
| Sora_sompeng -> Int32.of_int 101
| Takri -> Int32.of_int 102
| Bassa_vah -> Int32.of_int 103
| Caucasian_albanian -> Int32.of_int 104
| Duployan -> Int32.of_int 105
| Elbasan -> Int32.of_int 106
| Grantha -> Int32.of_int 107
| Khojki -> Int32.of_int 108
| Khudawadi -> Int32.of_int 109
| Linear_a -> Int32.of_int 110
| Mahajani -> Int32.of_int 111
| Manichaean -> Int32.of_int 112
| Mende_kikakui -> Int32.of_int 113
| Modi -> Int32.of_int 114
| Mro -> Int32.of_int 115
| Nabataean -> Int32.of_int 116
| Old_north_arabian -> Int32.of_int 117
| Old_permic -> Int32.of_int 118
| Pahawh_hmong -> Int32.of_int 119
| Palmyrene -> Int32.of_int 120
| Pau_cin_hau -> Int32.of_int 121
| Psalter_pahlavi -> Int32.of_int 122
| Siddham -> Int32.of_int 123
| Tirhuta -> Int32.of_int 124
| Warang_citi -> Int32.of_int 125
| Ahom -> Int32.of_int 126
| Anatolian_hieroglyphs -> Int32.of_int 127
| Hatran -> Int32.of_int 128
| Multani -> Int32.of_int 129
| Old_hungarian -> Int32.of_int 130
| Signwriting -> Int32.of_int 131
| Adlam -> Int32.of_int 132
| Bhaiksuki -> Int32.of_int 133
| Marchen -> Int32.of_int 134
| Newa -> Int32.of_int 135
| Osage -> Int32.of_int 136
| Tangut -> Int32.of_int 137
let unicodescript = view 
~read:unicodescript_of_value 
~write:unicodescript_to_value 
int32_t

type unicodetype = Control | Format | Unassigned | Private_use | Surrogate | Lowercase_letter | Modifier_letter | Other_letter | Titlecase_letter | Uppercase_letter | Spacing_mark | Enclosing_mark | Non_spacing_mark | Decimal_number | Letter_number | Other_number | Connect_punctuation | Dash_punctuation | Close_punctuation | Final_punctuation | Initial_punctuation | Other_punctuation | Open_punctuation | Currency_symbol | Modifier_symbol | Math_symbol | Other_symbol | Line_separator | Paragraph_separator | Space_separator
let unicodetype_of_value v =
if v = Unsigned.UInt32.of_int 0 then Control
else if v = Unsigned.UInt32.of_int 1 then Format
else if v = Unsigned.UInt32.of_int 2 then Unassigned
else if v = Unsigned.UInt32.of_int 3 then Private_use
else if v = Unsigned.UInt32.of_int 4 then Surrogate
else if v = Unsigned.UInt32.of_int 5 then Lowercase_letter
else if v = Unsigned.UInt32.of_int 6 then Modifier_letter
else if v = Unsigned.UInt32.of_int 7 then Other_letter
else if v = Unsigned.UInt32.of_int 8 then Titlecase_letter
else if v = Unsigned.UInt32.of_int 9 then Uppercase_letter
else if v = Unsigned.UInt32.of_int 10 then Spacing_mark
else if v = Unsigned.UInt32.of_int 11 then Enclosing_mark
else if v = Unsigned.UInt32.of_int 12 then Non_spacing_mark
else if v = Unsigned.UInt32.of_int 13 then Decimal_number
else if v = Unsigned.UInt32.of_int 14 then Letter_number
else if v = Unsigned.UInt32.of_int 15 then Other_number
else if v = Unsigned.UInt32.of_int 16 then Connect_punctuation
else if v = Unsigned.UInt32.of_int 17 then Dash_punctuation
else if v = Unsigned.UInt32.of_int 18 then Close_punctuation
else if v = Unsigned.UInt32.of_int 19 then Final_punctuation
else if v = Unsigned.UInt32.of_int 20 then Initial_punctuation
else if v = Unsigned.UInt32.of_int 21 then Other_punctuation
else if v = Unsigned.UInt32.of_int 22 then Open_punctuation
else if v = Unsigned.UInt32.of_int 23 then Currency_symbol
else if v = Unsigned.UInt32.of_int 24 then Modifier_symbol
else if v = Unsigned.UInt32.of_int 25 then Math_symbol
else if v = Unsigned.UInt32.of_int 26 then Other_symbol
else if v = Unsigned.UInt32.of_int 27 then Line_separator
else if v = Unsigned.UInt32.of_int 28 then Paragraph_separator
else if v = Unsigned.UInt32.of_int 29 then Space_separator
else raise (Invalid_argument "Unexpected UnicodeType value")
let unicodetype_to_value = function
| Control -> Unsigned.UInt32.of_int 0
| Format -> Unsigned.UInt32.of_int 1
| Unassigned -> Unsigned.UInt32.of_int 2
| Private_use -> Unsigned.UInt32.of_int 3
| Surrogate -> Unsigned.UInt32.of_int 4
| Lowercase_letter -> Unsigned.UInt32.of_int 5
| Modifier_letter -> Unsigned.UInt32.of_int 6
| Other_letter -> Unsigned.UInt32.of_int 7
| Titlecase_letter -> Unsigned.UInt32.of_int 8
| Uppercase_letter -> Unsigned.UInt32.of_int 9
| Spacing_mark -> Unsigned.UInt32.of_int 10
| Enclosing_mark -> Unsigned.UInt32.of_int 11
| Non_spacing_mark -> Unsigned.UInt32.of_int 12
| Decimal_number -> Unsigned.UInt32.of_int 13
| Letter_number -> Unsigned.UInt32.of_int 14
| Other_number -> Unsigned.UInt32.of_int 15
| Connect_punctuation -> Unsigned.UInt32.of_int 16
| Dash_punctuation -> Unsigned.UInt32.of_int 17
| Close_punctuation -> Unsigned.UInt32.of_int 18
| Final_punctuation -> Unsigned.UInt32.of_int 19
| Initial_punctuation -> Unsigned.UInt32.of_int 20
| Other_punctuation -> Unsigned.UInt32.of_int 21
| Open_punctuation -> Unsigned.UInt32.of_int 22
| Currency_symbol -> Unsigned.UInt32.of_int 23
| Modifier_symbol -> Unsigned.UInt32.of_int 24
| Math_symbol -> Unsigned.UInt32.of_int 25
| Other_symbol -> Unsigned.UInt32.of_int 26
| Line_separator -> Unsigned.UInt32.of_int 27
| Paragraph_separator -> Unsigned.UInt32.of_int 28
| Space_separator -> Unsigned.UInt32.of_int 29
let unicodetype = view 
~read:unicodetype_of_value 
~write:unicodetype_to_value 
uint32_t

type userdirectory = Directory_desktop | Directory_documents | Directory_download | Directory_music | Directory_pictures | Directory_public_share | Directory_templates | Directory_videos | N_directories
let userdirectory_of_value v =
if v = Unsigned.UInt32.of_int 0 then Directory_desktop
else if v = Unsigned.UInt32.of_int 1 then Directory_documents
else if v = Unsigned.UInt32.of_int 2 then Directory_download
else if v = Unsigned.UInt32.of_int 3 then Directory_music
else if v = Unsigned.UInt32.of_int 4 then Directory_pictures
else if v = Unsigned.UInt32.of_int 5 then Directory_public_share
else if v = Unsigned.UInt32.of_int 6 then Directory_templates
else if v = Unsigned.UInt32.of_int 7 then Directory_videos
else if v = Unsigned.UInt32.of_int 8 then N_directories
else raise (Invalid_argument "Unexpected UserDirectory value")
let userdirectory_to_value = function
| Directory_desktop -> Unsigned.UInt32.of_int 0
| Directory_documents -> Unsigned.UInt32.of_int 1
| Directory_download -> Unsigned.UInt32.of_int 2
| Directory_music -> Unsigned.UInt32.of_int 3
| Directory_pictures -> Unsigned.UInt32.of_int 4
| Directory_public_share -> Unsigned.UInt32.of_int 5
| Directory_templates -> Unsigned.UInt32.of_int 6
| Directory_videos -> Unsigned.UInt32.of_int 7
| N_directories -> Unsigned.UInt32.of_int 8
let userdirectory = view 
~read:userdirectory_of_value 
~write:userdirectory_to_value 
uint32_t

let _VA_COPY_AS_ARRAY = Int32.of_string "1"

let _VERSION_MIN_REQUIRED = Int32.of_string "2"

type variantclass = Boolean | Byte | Int16 | Uint16 | Int32 | Uint32 | Int64 | Uint64 | Handle | Double | String | Object_path | Signature | Variant | Maybe | Array | Tuple | Dict_entry
let variantclass_of_value v =
if v = Unsigned.UInt32.of_int 98 then Boolean
else if v = Unsigned.UInt32.of_int 121 then Byte
else if v = Unsigned.UInt32.of_int 110 then Int16
else if v = Unsigned.UInt32.of_int 113 then Uint16
else if v = Unsigned.UInt32.of_int 105 then Int32
else if v = Unsigned.UInt32.of_int 117 then Uint32
else if v = Unsigned.UInt32.of_int 120 then Int64
else if v = Unsigned.UInt32.of_int 116 then Uint64
else if v = Unsigned.UInt32.of_int 104 then Handle
else if v = Unsigned.UInt32.of_int 100 then Double
else if v = Unsigned.UInt32.of_int 115 then String
else if v = Unsigned.UInt32.of_int 111 then Object_path
else if v = Unsigned.UInt32.of_int 103 then Signature
else if v = Unsigned.UInt32.of_int 118 then Variant
else if v = Unsigned.UInt32.of_int 109 then Maybe
else if v = Unsigned.UInt32.of_int 97 then Array
else if v = Unsigned.UInt32.of_int 40 then Tuple
else if v = Unsigned.UInt32.of_int 123 then Dict_entry
else raise (Invalid_argument "Unexpected VariantClass value")
let variantclass_to_value = function
| Boolean -> Unsigned.UInt32.of_int 98
| Byte -> Unsigned.UInt32.of_int 121
| Int16 -> Unsigned.UInt32.of_int 110
| Uint16 -> Unsigned.UInt32.of_int 113
| Int32 -> Unsigned.UInt32.of_int 105
| Uint32 -> Unsigned.UInt32.of_int 117
| Int64 -> Unsigned.UInt32.of_int 120
| Uint64 -> Unsigned.UInt32.of_int 116
| Handle -> Unsigned.UInt32.of_int 104
| Double -> Unsigned.UInt32.of_int 100
| String -> Unsigned.UInt32.of_int 115
| Object_path -> Unsigned.UInt32.of_int 111
| Signature -> Unsigned.UInt32.of_int 103
| Variant -> Unsigned.UInt32.of_int 118
| Maybe -> Unsigned.UInt32.of_int 109
| Array -> Unsigned.UInt32.of_int 97
| Tuple -> Unsigned.UInt32.of_int 40
| Dict_entry -> Unsigned.UInt32.of_int 123
let variantclass = view 
~read:variantclass_of_value 
~write:variantclass_to_value 
uint32_t

type variantparseerror = Failed | Basic_type_expected | Cannot_infer_type | Definite_type_expected | Input_not_at_end | Invalid_character | Invalid_format_string | Invalid_object_path | Invalid_signature | Invalid_type_string | No_common_type | Number_out_of_range | Number_too_big | Type_error | Unexpected_token | Unknown_keyword | Unterminated_string_constant | Value_expected
let variantparseerror_of_value v =
if v = Unsigned.UInt32.of_int 0 then Failed
else if v = Unsigned.UInt32.of_int 1 then Basic_type_expected
else if v = Unsigned.UInt32.of_int 2 then Cannot_infer_type
else if v = Unsigned.UInt32.of_int 3 then Definite_type_expected
else if v = Unsigned.UInt32.of_int 4 then Input_not_at_end
else if v = Unsigned.UInt32.of_int 5 then Invalid_character
else if v = Unsigned.UInt32.of_int 6 then Invalid_format_string
else if v = Unsigned.UInt32.of_int 7 then Invalid_object_path
else if v = Unsigned.UInt32.of_int 8 then Invalid_signature
else if v = Unsigned.UInt32.of_int 9 then Invalid_type_string
else if v = Unsigned.UInt32.of_int 10 then No_common_type
else if v = Unsigned.UInt32.of_int 11 then Number_out_of_range
else if v = Unsigned.UInt32.of_int 12 then Number_too_big
else if v = Unsigned.UInt32.of_int 13 then Type_error
else if v = Unsigned.UInt32.of_int 14 then Unexpected_token
else if v = Unsigned.UInt32.of_int 15 then Unknown_keyword
else if v = Unsigned.UInt32.of_int 16 then Unterminated_string_constant
else if v = Unsigned.UInt32.of_int 17 then Value_expected
else raise (Invalid_argument "Unexpected VariantParseError value")
let variantparseerror_to_value = function
| Failed -> Unsigned.UInt32.of_int 0
| Basic_type_expected -> Unsigned.UInt32.of_int 1
| Cannot_infer_type -> Unsigned.UInt32.of_int 2
| Definite_type_expected -> Unsigned.UInt32.of_int 3
| Input_not_at_end -> Unsigned.UInt32.of_int 4
| Invalid_character -> Unsigned.UInt32.of_int 5
| Invalid_format_string -> Unsigned.UInt32.of_int 6
| Invalid_object_path -> Unsigned.UInt32.of_int 7
| Invalid_signature -> Unsigned.UInt32.of_int 8
| Invalid_type_string -> Unsigned.UInt32.of_int 9
| No_common_type -> Unsigned.UInt32.of_int 10
| Number_out_of_range -> Unsigned.UInt32.of_int 11
| Number_too_big -> Unsigned.UInt32.of_int 12
| Type_error -> Unsigned.UInt32.of_int 13
| Unexpected_token -> Unsigned.UInt32.of_int 14
| Unknown_keyword -> Unsigned.UInt32.of_int 15
| Unterminated_string_constant -> Unsigned.UInt32.of_int 16
| Value_expected -> Unsigned.UInt32.of_int 17
let variantparseerror = view 
~read:variantparseerror_of_value 
~write:variantparseerror_to_value 
uint32_t

let _WIN32_MSG_HANDLE = Int32.of_string "19981206"

