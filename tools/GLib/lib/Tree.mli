open Ctypes

type t
val t_typ : t structure typ

val destroy:
  t structure ptr -> unit
val height:
  t structure ptr -> int32
val insert:
  t structure ptr -> unit ptr option -> unit ptr option -> unit
val lookup:
  t structure ptr -> unit ptr option -> unit ptr option
val lookup_extended:
  t structure ptr -> unit ptr option -> unit ptr option -> unit ptr option -> bool
val nnodes:
  t structure ptr -> int32
val remove:
  t structure ptr -> unit ptr option -> bool
val replace:
  t structure ptr -> unit ptr option -> unit ptr option -> unit
val steal:
  t structure ptr -> unit ptr option -> bool
val unref:
  t structure ptr -> unit
