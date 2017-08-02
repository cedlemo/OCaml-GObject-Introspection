open Ctypes

type t
val t_typ : t structure typ
val close:
t structure ptr -> unit
val read_name:
t structure ptr -> string
val rewind:
t structure ptr -> unit
(* Not implemented g_dir_make_tmp return type not handled . *)

