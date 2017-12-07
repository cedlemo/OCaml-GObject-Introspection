open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "DBus_subtree_vtable"

let f_enumerate = field t_typ "enumerate" (ptr void)
(*Struct field DBus_subtree_vtable : callback tag not implemented*)
(*Struct field DBus_subtree_vtable : callback tag not implemented*)
(*Struct field DBus_subtree_vtable : C Array type for Types.Array tag tag not implemented*)
let _ = seal t_typ

