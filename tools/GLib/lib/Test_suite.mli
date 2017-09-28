open Ctypes

type t
val t_typ : t structure typ
val add:
t structure ptr -> (* interface *) Test_case.t structure ptr -> unit

val add_suite:
t structure ptr -> (* interface *) t structure ptr -> unit


