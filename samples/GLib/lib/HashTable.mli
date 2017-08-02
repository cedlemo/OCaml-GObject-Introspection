open Ctypes

type t
val t_typ : t structure typ
val add:
t structure ptr -> t structure ptr -> unit ptr -> bool
val contains:
t structure ptr -> t structure ptr -> unit ptr -> bool
val destroy:
t structure ptr -> t structure ptr -> unit
val insert:
t structure ptr -> t structure ptr -> unit ptr -> unit ptr -> bool
val lookup:
t structure ptr -> t structure ptr -> unit ptr -> unit ptr
(* Not implemented g_hash_table_lookup_extended argument types not handled . *)
val remove:
t structure ptr -> t structure ptr -> unit ptr -> bool
val remove_all:
t structure ptr -> t structure ptr -> unit
val replace:
t structure ptr -> t structure ptr -> unit ptr -> unit ptr -> bool
val size:
t structure ptr -> t structure ptr -> Unsigned.uint32
val steal:
t structure ptr -> t structure ptr -> unit ptr -> bool
val steal_all:
t structure ptr -> t structure ptr -> unit
val unref:
t structure ptr -> t structure ptr -> unit

