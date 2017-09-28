open Ctypes

type t
val t_typ : t structure typ
val _new:
t structure ptr -> (* interface *) Main_context.t structure ptr option -> bool -> (* interface *) t structure ptr

val get_context:
t structure ptr -> (* interface *) Main_context.t structure ptr

val is_running:
t structure ptr -> bool

val quit:
t structure ptr -> unit

val ref:
t structure ptr -> (* interface *) t structure ptr

val run:
t structure ptr -> unit

val unref:
t structure ptr -> unit


