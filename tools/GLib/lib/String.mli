open Ctypes

type t
val t_typ : t structure typ
val f_str: (string, t structure) field
val f_len: (Unsigned.uint64, t structure) field
val f_allocated_len: (Unsigned.uint64, t structure) field
val append:
t structure ptr -> string -> t structure ptr

val append_c:
t structure ptr -> int -> t structure ptr

val append_len:
t structure ptr -> string -> int64 -> t structure ptr

(*Not implemented g_string_append_unichar argument types not handled*)
val append_uri_escaped:
t structure ptr -> string -> string -> bool -> t structure ptr

val ascii_down:
t structure ptr -> t structure ptr

val ascii_up:
t structure ptr -> t structure ptr

val assign:
t structure ptr -> string -> t structure ptr

val down:
t structure ptr -> t structure ptr

val equal:
t structure ptr -> t structure ptr -> bool

val erase:
t structure ptr -> int64 -> int64 -> t structure ptr

val free:
t structure ptr -> bool -> string option

val free_to_bytes:
t structure ptr -> Bytes.t structure ptr

val hash:
t structure ptr -> Unsigned.uint32

val insert:
t structure ptr -> int64 -> string -> t structure ptr

val insert_c:
t structure ptr -> int64 -> int -> t structure ptr

val insert_len:
t structure ptr -> int64 -> string -> int64 -> t structure ptr

(*Not implemented g_string_insert_unichar argument types not handled*)
val overwrite:
t structure ptr -> Unsigned.uint64 -> string -> t structure ptr

val overwrite_len:
t structure ptr -> Unsigned.uint64 -> string -> int64 -> t structure ptr

val prepend:
t structure ptr -> string -> t structure ptr

val prepend_c:
t structure ptr -> int -> t structure ptr

val prepend_len:
t structure ptr -> string -> int64 -> t structure ptr

(*Not implemented g_string_prepend_unichar argument types not handled*)
val set_size:
t structure ptr -> Unsigned.uint64 -> t structure ptr

val truncate:
t structure ptr -> Unsigned.uint64 -> t structure ptr

val up:
t structure ptr -> t structure ptr


