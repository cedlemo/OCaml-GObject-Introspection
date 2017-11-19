open Ctypes

type t
val t_typ : t structure typ

val close:
  t structure ptr -> unit

val read_name:
  t structure ptr -> string

val rewind:
  t structure ptr -> unit

val make_tmp:
  string option -> (string option, Error.t structure ptr option) result

