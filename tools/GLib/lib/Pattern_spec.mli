open Ctypes

type t
val t_typ : t structure typ

val equal:
  t structure ptr -> Pattern_spec.t structure ptr -> bool
val free:
  t structure ptr -> unit
