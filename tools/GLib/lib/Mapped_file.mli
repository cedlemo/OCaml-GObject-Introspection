open Ctypes

type t
val t_typ : t structure typ
val _new:
t structure ptr -> string -> bool -> Error.t structure ptr ptr option -> t structure ptr

val new_from_fd:
t structure ptr -> int32 -> bool -> Error.t structure ptr ptr option -> t structure ptr

val free:
t structure ptr -> unit

(*SKIPPED : g_mapped_file_get_bytes return type Bytes.t structure ptr*)
val get_contents:
t structure ptr -> string

val get_length:
t structure ptr -> Unsigned.uint64

val ref:
t structure ptr -> t structure ptr

val unref:
t structure ptr -> unit


