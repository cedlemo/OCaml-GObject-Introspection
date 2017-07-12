open Ctypes

type t
val t_typ : t structure typ
val f_p: (unit ptr, t structure) field
(* TODO Struct field Cond : C Array type for GITypes.Array tag tag not implemented *)
