open Ctypes

type t
val t_typ : t structure typ
(* Not implemented g_markup_parse_context_new argument types not handled . *)
val end_parse:
t structure ptr -> bool
val free:
t structure ptr -> unit
val get_element:
t structure ptr -> string
val get_position:
t structure ptr -> int32 ptr -> int32 ptr -> unit
val get_user_data:
t structure ptr -> unit ptr
val parse:
t structure ptr -> string -> int64 -> bool
val pop:
t structure ptr -> unit ptr
(* Not implemented g_markup_parse_context_push argument types not handled . *)
(* Not implemented g_markup_parse_context_ref return type not handled . *)
val unref:
t structure ptr -> unit

