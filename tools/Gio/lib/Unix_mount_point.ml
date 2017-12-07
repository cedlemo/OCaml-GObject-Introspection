open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "Unix_mount_point"

let compare =
  foreign "g_unix_mount_point_compare" (ptr t_typ @-> ptr t_typ @-> returning (int32_t))

let copy =
  foreign "g_unix_mount_point_copy" (ptr t_typ @-> returning (ptr t_typ))

let free =
  foreign "g_unix_mount_point_free" (ptr t_typ @-> returning (void))

let get_device_path =
  foreign "g_unix_mount_point_get_device_path" (ptr t_typ @-> returning (string))

let get_fs_type =
  foreign "g_unix_mount_point_get_fs_type" (ptr t_typ @-> returning (string))

let get_mount_path =
  foreign "g_unix_mount_point_get_mount_path" (ptr t_typ @-> returning (string))

let get_options =
  foreign "g_unix_mount_point_get_options" (ptr t_typ @-> returning (string))

let guess_can_eject =
  foreign "g_unix_mount_point_guess_can_eject" (ptr t_typ @-> returning (bool))

(*Not implemented g_unix_mount_point_guess_icon return type interface not handled*)
let guess_name =
  foreign "g_unix_mount_point_guess_name" (ptr t_typ @-> returning (string))

(*Not implemented g_unix_mount_point_guess_symbolic_icon return type interface not handled*)
let is_loopback =
  foreign "g_unix_mount_point_is_loopback" (ptr t_typ @-> returning (bool))

let is_readonly =
  foreign "g_unix_mount_point_is_readonly" (ptr t_typ @-> returning (bool))

let is_user_mountable =
  foreign "g_unix_mount_point_is_user_mountable" (ptr t_typ @-> returning (bool))

