open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "File_attribute_info"

let f_name = field t_typ "name" (string)
let f_type = field t_typ "type" (File_attribute_type.t_view)
let f_flags = field t_typ "flags" (File_attribute_info_flags.t_list_view)
let _ = seal t_typ

