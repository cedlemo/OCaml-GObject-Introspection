open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "MarkupParseContext"
(* Not implemented g_markup_parse_context_new argument types not handled . *)
let end_parse =
foreign "g_markup_parse_context_end_parse" (ptr t_typ @-> returning (bool))
let free =
foreign "g_markup_parse_context_free" (ptr t_typ @-> returning (void))
let get_element =
foreign "g_markup_parse_context_get_element" (ptr t_typ @-> returning (string))
let get_position =
foreign "g_markup_parse_context_get_position" (ptr t_typ @-> ptr int32_t @-> ptr int32_t @-> returning (void))
let get_user_data =
foreign "g_markup_parse_context_get_user_data" (ptr t_typ @-> returning (ptr void))
let parse =
foreign "g_markup_parse_context_parse" (ptr t_typ @-> string @-> int64_t @-> returning (bool))
let pop =
foreign "g_markup_parse_context_pop" (ptr t_typ @-> returning (ptr void))
(* Not implemented g_markup_parse_context_push argument types not handled . *)
(* Not implemented g_markup_parse_context_ref return type not handled . *)
let unref =
foreign "g_markup_parse_context_unref" (ptr t_typ @-> returning (void))

