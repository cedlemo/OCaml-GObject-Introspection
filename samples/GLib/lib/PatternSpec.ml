open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "PatternSpec"
(* Not implemented g_pattern_spec_equal argument types not handled . *)
let free =
foreign "g_pattern_spec_free" (ptr t_typ @-> returning (void))

