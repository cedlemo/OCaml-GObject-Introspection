open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "DBus_error_entry"

let f_error_code = field t_typ "error_code" (int32_t)
let f_dbus_error_name = field t_typ "dbus_error_name" (string)
let _ = seal t_typ

