open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "Resource"

let new_from_data arg1 =
  let new_from_data_raw =
    foreign "g_resource_new_from_data" (ptr Bytes.t_typ @-> ptr_opt (ptr_opt Error.t_typ) @-> returning (ptr t_typ))
  in
  let err_ptr_ptr = allocate (ptr_opt Error.t_typ) None in
  let value = new_from_data_raw arg1 (Some err_ptr_ptr) in
  match (!@ err_ptr_ptr) with
   | None -> Ok value
   | Some _ -> let err_ptr = !@ err_ptr_ptr in
     let _ = Gc.finalise (function | Some e -> Error.free e | None -> () ) err_ptr in
     Error (err_ptr)

let _register =
  foreign "g_resources_register" (ptr t_typ @-> returning (void))

let _unregister =
  foreign "g_resources_unregister" (ptr t_typ @-> returning (void))

(*Not implemented g_resource_enumerate_children return type C Array type for Types.Array tag not handled*)
(*Not implemented g_resource_get_info argument typeArg_info.InOut or Arg_info.Out not handled*)
let lookup_data arg1 arg2 arg3 =
  let lookup_data_raw =
    foreign "g_resource_lookup_data" (ptr t_typ @-> string @-> Resource_lookup_flags.t_list_view @-> ptr_opt (ptr_opt Error.t_typ) @-> returning (ptr Bytes.t_typ))
  in
  let err_ptr_ptr = allocate (ptr_opt Error.t_typ) None in
  let value = lookup_data_raw arg1 arg2 arg3 (Some err_ptr_ptr) in
  match (!@ err_ptr_ptr) with
   | None -> Ok value
   | Some _ -> let err_ptr = !@ err_ptr_ptr in
     let _ = Gc.finalise (function | Some e -> Error.free e | None -> () ) err_ptr in
     Error (err_ptr)

(*Not implemented g_resource_open_stream return type object not handled*)
let ref =
  foreign "g_resource_ref" (ptr t_typ @-> returning (ptr t_typ))

let unref =
  foreign "g_resource_unref" (ptr t_typ @-> returning (void))

let load arg1 =
  let load_raw =
    foreign "g_resource_load" (string @-> ptr_opt (ptr_opt Error.t_typ) @-> returning (ptr t_typ))
  in
  let err_ptr_ptr = allocate (ptr_opt Error.t_typ) None in
  let value = load_raw arg1 (Some err_ptr_ptr) in
  match (!@ err_ptr_ptr) with
   | None -> Ok value
   | Some _ -> let err_ptr = !@ err_ptr_ptr in
     let _ = Gc.finalise (function | Some e -> Error.free e | None -> () ) err_ptr in
     Error (err_ptr)

