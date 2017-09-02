open Ctypes

type t
val t_typ : t structure typ
val add:
t structure ptr -> Test_case.t structure ptr -> unit
val add_suite:
t structure ptr -> t structure ptr -> unit

