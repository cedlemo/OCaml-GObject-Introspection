open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "DBus_node_info"

let f_ref_count = field t_typ "ref_count" (int32_t)
let f_path = field t_typ "path" (string)
(*Struct field DBus_node_info : C Array type for Types.Array tag tag not implemented*)
(*Struct field DBus_node_info : C Array type for Types.Array tag tag not implemented*)
(*Struct field DBus_node_info : C Array type for Types.Array tag tag not implemented*)
let _ = seal t_typ

let new_for_xml arg1 =
  let new_for_xml_raw =
    foreign "g_dbus_node_info_new_for_xml" (string @-> ptr_opt (ptr_opt Error.t_typ) @-> returning (ptr t_typ))
  in
  let err_ptr_ptr = allocate (ptr_opt Error.t_typ) None in
  let value = new_for_xml_raw arg1 (Some err_ptr_ptr) in
  match (!@ err_ptr_ptr) with
   | None -> Ok value
   | Some _ -> let err_ptr = !@ err_ptr_ptr in
     let _ = Gc.finalise (function | Some e -> Error.free e | None -> () ) err_ptr in
     Error (err_ptr)

let generate_xml =
  foreign "g_dbus_node_info_generate_xml" (ptr t_typ @-> uint32_t @-> ptr String.t_typ @-> returning (void))

let lookup_interface =
  foreign "g_dbus_node_info_lookup_interface" (ptr t_typ @-> string @-> returning (ptr DBus_interface_info.t_typ))

let ref =
  foreign "g_dbus_node_info_ref" (ptr t_typ @-> returning (ptr t_typ))

let unref =
  foreign "g_dbus_node_info_unref" (ptr t_typ @-> returning (void))

