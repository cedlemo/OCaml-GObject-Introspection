open Ctypes

type t
val t_typ : t structure typ
(* Not implemented g_pattern_spec_equal argument types not handled . *)
val free:
t structure ptr -> unit

