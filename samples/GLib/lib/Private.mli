open Ctypes

type t
val t_typ : t structure typ
val f_p: (unit ptr, t structure) field
(* TODO Struct field Private : interface tag not implemented *)val f_future: (Array.t structure, t structure) field

