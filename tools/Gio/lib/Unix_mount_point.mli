open Ctypes

type t
val t_typ : t structure typ

val compare:
  t structure ptr -> t structure ptr -> int32

val copy:
  t structure ptr -> t structure ptr

val free:
  t structure ptr -> unit

val get_device_path:
  t structure ptr -> string

val get_fs_type:
  t structure ptr -> string

val get_mount_path:
  t structure ptr -> string

val get_options:
  t structure ptr -> string

val guess_can_eject:
  t structure ptr -> bool

(*Not implemented g_unix_mount_point_guess_icon return type interface not handled*)
val guess_name:
  t structure ptr -> string

(*Not implemented g_unix_mount_point_guess_symbolic_icon return type interface not handled*)
val is_loopback:
  t structure ptr -> bool

val is_readonly:
  t structure ptr -> bool

val is_user_mountable:
  t structure ptr -> bool

