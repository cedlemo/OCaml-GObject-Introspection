open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "Error"
let f_domain = field t_typ "domain" (uint32_t)
let f_code = field t_typ "code" (int32_t)
let f_message = field t_typ "message" (ptr string)

