open Ctypes

type t
val t_typ : t structure typ
val add:
  unit -> t structure ptr -> unit ptr option -> bool

val contains:
  unit -> t structure ptr -> unit ptr option -> bool

val destroy:
  unit -> t structure ptr -> unit

val insert:
  unit -> t structure ptr -> unit ptr option -> unit ptr option -> bool

val lookup:
  unit -> t structure ptr -> unit ptr option -> unit ptr option

(*Not implemented g_hash_table_lookup_extended argument typeArg_info.InOut or Arg_info.Out not handled*)
val remove:
  unit -> t structure ptr -> unit ptr option -> bool

val remove_all:
  unit -> t structure ptr -> unit

val replace:
  unit -> t structure ptr -> unit ptr option -> unit ptr option -> bool

val size:
  unit -> t structure ptr -> Unsigned.uint32

val steal:
  unit -> t structure ptr -> unit ptr option -> bool

val steal_all:
  unit -> t structure ptr -> unit

val unref:
  unit -> t structure ptr -> unit


