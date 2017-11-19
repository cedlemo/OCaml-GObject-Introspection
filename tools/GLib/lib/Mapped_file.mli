open Ctypes

type t
val t_typ : t structure typ

val create:
  string -> bool -> (t structure ptr, Error.t structure ptr option) result

val new_from_fd:
  int32 -> bool -> (t structure ptr, Error.t structure ptr option) result

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

