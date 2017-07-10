open Ctypes

type t
val t_typ : t structure typ
(* TODO Struct field ThreadPool : interface tag not implemented *)val f_user_data: (unit ptr, t structure) field
val f_exclusive: (bool, t structure) field

