open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "IOExtension_point"

let get_extension_by_name =
  foreign "g_io_extension_point_get_extension_by_name" (ptr t_typ @-> string @-> returning (ptr IOExtension.t_typ))

let get_extensions =
  foreign "g_io_extension_point_get_extensions" (ptr t_typ @-> returning (ptr List.t_typ))

(*Not implemented g_io_extension_point_get_required_type return type gType not handled*)
(*Not implemented g_io_extension_point_set_required_type argument typegType not handled*)
(*Not implemented g_io_extension_point_implement argument typegType not handled*)
let lookup =
  foreign "g_io_extension_point_lookup" (string @-> returning (ptr t_typ))

let register =
  foreign "g_io_extension_point_register" (string @-> returning (ptr t_typ))

