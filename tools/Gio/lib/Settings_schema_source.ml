open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "Settings_schema_source"

let new_from_directory arg1 arg2 arg3 =
  let new_from_directory_raw =
    foreign "g_settings_schema_source_new_from_directory" (string @-> ptr_opt t_typ @-> bool @-> ptr_opt (ptr_opt Error.t_typ) @-> returning (ptr t_typ))
  in
  let err_ptr_ptr = allocate (ptr_opt Error.t_typ) None in
  let value = new_from_directory_raw arg1 arg2 arg3 (Some err_ptr_ptr) in
  match (!@ err_ptr_ptr) with
   | None -> Ok value
   | Some _ -> let err_ptr = !@ err_ptr_ptr in
     let _ = Gc.finalise (function | Some e -> Error.free e | None -> () ) err_ptr in
     Error (err_ptr)

(*Not implemented g_settings_schema_source_list_schemas argument typeArg_info.InOut or Arg_info.Out not handled*)
let lookup =
  foreign "g_settings_schema_source_lookup" (ptr t_typ @-> string @-> bool @-> returning (ptr_opt Settings_schema.t_typ))

let ref =
  foreign "g_settings_schema_source_ref" (ptr t_typ @-> returning (ptr t_typ))

let unref =
  foreign "g_settings_schema_source_unref" (ptr t_typ @-> returning (void))

let get_default =
  foreign "g_settings_schema_source_get_default" (void @-> returning (ptr t_typ))

