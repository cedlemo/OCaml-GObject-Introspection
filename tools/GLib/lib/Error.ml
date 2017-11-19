open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "Error"

let f_domain = field t_typ "domain" (uint32_t)
let f_code = field t_typ "code" (int32_t)
let f_message = field t_typ "message" (string)
let _ = seal t_typ

let new_literal =
  foreign "g_error_new_literal" (uint32_t @-> int32_t @-> string @-> returning (ptr t_typ))

let copy =
  foreign "g_error_copy" (ptr t_typ @-> returning (ptr t_typ))

let free =
  foreign "g_error_free" (ptr t_typ @-> returning (void))

let matches =
  foreign "g_error_matches" (ptr t_typ @-> uint32_t @-> int32_t @-> returning (bool))

