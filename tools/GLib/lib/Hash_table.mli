open Ctypes

type t
val t_typ : t structure typ

val add:
  Hash_table.t structure ptr -> unit ptr option -> bool
val contains:
  Hash_table.t structure ptr -> unit ptr option -> bool
val destroy:
  Hash_table.t structure ptr -> unit
val insert:
  Hash_table.t structure ptr -> unit ptr option -> unit ptr option -> bool
val lookup:
  Hash_table.t structure ptr -> unit ptr option -> unit ptr option
(* Not implemented g_hash_table_lookup_extended - out argument not handled
Hash_table.t structure ptr -> unit ptr option -> (bool, unit ptr option, unit ptr option)
*)
val remove:
  Hash_table.t structure ptr -> unit ptr option -> bool
val remove_all:
  Hash_table.t structure ptr -> unit
val replace:
  Hash_table.t structure ptr -> unit ptr option -> unit ptr option -> bool
val size:
  Hash_table.t structure ptr -> Unsigned.uint32
val steal:
  Hash_table.t structure ptr -> unit ptr option -> bool
val steal_all:
  Hash_table.t structure ptr -> unit
val unref:
  Hash_table.t structure ptr -> unit
