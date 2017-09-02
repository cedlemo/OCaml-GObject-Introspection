open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "Markup_parse_context"
(* Not implemented g_markup_parse_context_new argument types not handled . *)
let end_parse =
foreign "g_markup_parse_context_end_parse" (ptr t_typ  @-> ptr_opt (ptr Error.t_typ) @-> returning (bool))
let free =
foreign "g_markup_parse_context_free" (ptr t_typ @-> returning (void))
let get_element =
foreign "g_markup_parse_context_get_element" (ptr t_typ @-> returning (string))
let get_position =
foreign "g_markup_parse_context_get_position" (ptr t_typ @-> ptr_opt int32_t @-> ptr_opt int32_t @-> returning (void))
let get_user_data =
foreign "g_markup_parse_context_get_user_data" (ptr t_typ @-> returning (ptr_opt void))
let parse =
foreign "g_markup_parse_context_parse" (ptr t_typ @-> string @-> int64_t  @-> ptr_opt (ptr Error.t_typ) @-> returning (bool))
let pop =
foreign "g_markup_parse_context_pop" (ptr t_typ @-> returning (ptr_opt void))
let push =
foreign "g_markup_parse_context_push" (ptr t_typ @-> ptr Markup_parser.t_typ @-> ptr_opt void @-> returning (void))
let ref =
foreign "g_markup_parse_context_ref" (ptr t_typ @-> returning (ptr t_typ))
let unref =
foreign "g_markup_parse_context_unref" (ptr t_typ @-> returning (void))

