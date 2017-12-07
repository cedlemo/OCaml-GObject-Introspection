open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "File_attribute_info_list"

let f_infos = field t_typ "infos" (ptr File_attribute_info.t_typ)
let f_n_infos = field t_typ "n_infos" (int32_t)
let _ = seal t_typ

let create =
  foreign "g_file_attribute_info_list_new" (void @-> returning (ptr t_typ))

let add =
  foreign "g_file_attribute_info_list_add" (ptr t_typ @-> string @-> File_attribute_type.t_view @-> File_attribute_info_flags.t_list_view @-> returning (void))

let dup =
  foreign "g_file_attribute_info_list_dup" (ptr t_typ @-> returning (ptr t_typ))

let lookup =
  foreign "g_file_attribute_info_list_lookup" (ptr t_typ @-> string @-> returning (ptr File_attribute_info.t_typ))

let ref =
  foreign "g_file_attribute_info_list_ref" (ptr t_typ @-> returning (ptr t_typ))

let unref =
  foreign "g_file_attribute_info_list_unref" (ptr t_typ @-> returning (void))

