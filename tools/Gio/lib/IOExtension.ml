open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "IOExtension"

let get_name =
  foreign "g_io_extension_get_name" (ptr t_typ @-> returning (string))

let get_priority =
  foreign "g_io_extension_get_priority" (ptr t_typ @-> returning (int32_t))

(*Not implemented g_io_extension_get_type return type gType not handled*)
