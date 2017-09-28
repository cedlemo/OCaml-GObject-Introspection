open Ctypes

type t
val t_typ : t structure typ
val equal:
t structure ptr -> (* interface *) t structure ptr -> bool

val free:
t structure ptr -> unit


