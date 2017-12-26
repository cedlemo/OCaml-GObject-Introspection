open Ctypes

type t
val t_typ : t structure typ

(*Not implemented g_markup_parse_context_new type callback not implemented*)
val end_parse:
  t structure ptr -> (bool, Error.t structure ptr option) result
val free:
  t structure ptr -> unit
val get_element:
  t structure ptr -> string
val get_position:
  t structure ptr -> int32 ptr option -> int32 ptr option -> unit
val get_user_data:
  t structure ptr -> unit ptr option
val parse:
  t structure ptr -> string -> int64 -> (bool, Error.t structure ptr option) result
val pop:
  t structure ptr -> unit ptr option
val push:
  t structure ptr -> Markup_parser.t structure ptr -> unit ptr option -> unit
val ref:
  t structure ptr -> t structure ptr
val unref:
  t structure ptr -> unit
