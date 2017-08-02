open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "Error"
let f_domain = field t_typ "domain" (uint32_t)
let f_code = field t_typ "code" (int32_t)
let f_message = field t_typ "message" (string)
(* Not implemented g_error_new_literal return type not handled . *)
(* Not implemented g_error_copy return type not handled . *)
let free =
foreign "g_error_free" (ptr t_typ @-> returning (void))
let matches =
foreign "g_error_matches" (ptr t_typ @-> uint32_t @-> int32_t @-> returning (bool))

