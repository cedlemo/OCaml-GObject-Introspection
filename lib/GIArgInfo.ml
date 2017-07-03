(*
 * Copyright 2017 Cedric LE MOIGNE, cedlemo@gmx.com
 * This file is part of OCaml-GObject-Introspection.
 *
 * OCaml-GObject-Introspection is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * any later version.
 *
 * OCaml-GObject-Introspection is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with OCaml-GObject-Introspection.  If not, see <http://www.gnu.org/licenses/>.
 *)

open Ctypes
open Foreign

type t
let arginfo : t structure typ = structure "GIArgInfo"

type direction =
  | In
  | Out
  | InOut

let get_direction info =
  let get_direction_raw =
    foreign "g_arg_info_get_direction"
      (ptr arginfo @-> returning int)
  in match get_direction_raw info with
  | 0 -> In
  | 1 -> Out
  | 2 -> InOut
  | value -> let message = String.concat " " ["GIArgInfo get_direction value";
                                              string_of_int value;
                                              "should not have been reached"]
    in raise (Failure message)

let get_closure =
  foreign "g_arg_info_get_closure"
    (ptr arginfo @-> returning int)

let get_destroy =
  foreign "g_arg_info_get_destroy"
    (ptr arginfo @-> returning int)

type transfer =
  | Nothing
  | Container
  | Everything

let transfer_of_int = function
  | 0 -> Nothing
  | 1 -> Container
  | 2 -> Everything
  | value -> let message = String.concat " " ["GIArgInfo get_ownership_transfer value";
                                              string_of_int value;
                                              "should not have been reached"]
    in raise (Failure message)


let get_ownership_transfer info =
  let get_ownership_transfer_raw =
    foreign "g_arg_info_get_ownership_transfer"
      (ptr arginfo @-> returning int)
  in let transf_val = get_ownership_transfer_raw info
  in transfer_of_int transf_val

let may_be_null =
  foreign "g_arg_info_may_be_null"
    (ptr arginfo @-> returning bool)

let is_caller_allocates =
  foreign "g_arg_info_is_caller_allocates"
    (ptr arginfo @-> returning bool)

let is_optional =
  foreign "g_arg_info_is_optional"
    (ptr arginfo @-> returning bool)

let is_return_value =
  foreign "g_arg_info_is_return_value"
    (ptr arginfo @-> returning bool)

let is_skip =
  foreign "g_arg_info_is_skip"
    (ptr arginfo @-> returning bool)

type scope =
  | Invalid
  | Call
  | Async
  | Notified

let get_scope info =
  let get_scope_raw =
    foreign "g_arg_info_get_scope"
      (ptr arginfo @-> returning int)
  in match get_scope_raw info with
  | 0 -> Invalid
  | 1 -> Call
  | 2 -> Async
  | 3 -> Notified
  | value -> let message = String.concat " " ["GIArgInfo get_scope value";
                                              string_of_int value;
                                              "should not have been reached"]
    in raise (Failure message)

type param_flags =
  | Readable
  | Writable
  | Readwrite
  | Construct
  | Construct_only
  | Lax_validation
  | Static_name
  | Private
  | Static_nick
  | Static_blurb
  | Explicit_notify
  | Deprecated

let param_flags_of_int32 flag =
  if flag = (Int32.shift_left (Int32.of_int 1) 0) then Readable
  else if flag = (Int32.shift_left (Int32.of_int 1) 1) then Writable
  else if flag = (Int32.logor (Int32.shift_left (Int32.of_int 1) 0) (Int32.shift_left (Int32.of_int 1) 1)) then Readwrite
  else if flag = (Int32.shift_left (Int32.of_int 1) 2) then Construct
  else if flag = (Int32.shift_left (Int32.of_int 1) 3) then Construct_only
  else if flag = (Int32.shift_left (Int32.of_int 1) 4) then Lax_validation
  else if flag = (Int32.shift_left (Int32.of_int 1) 5) then Static_name
  else if flag = (Int32.shift_left (Int32.of_int 1) 6) then Static_nick
  else if flag = (Int32.shift_left (Int32.of_int 1) 7) then Static_blurb
  else if flag = (Int32.shift_left (Int32.of_int 1) 30) then Explicit_notify
  else if flag = (Int32.shift_left (Int32.of_int 1) 31) then Deprecated
  else let message = String.concat " " ["GIArgInfo get_scope value";
                                        Int32.to_string flag;
                                        "should not have been reached"]
    in raise (Failure message)

let param_flags_to_string = function
  | Readable -> "Readable"
  | Writable -> "Writable"
  | Readwrite -> "Readwrite"
  | Construct -> "Construct"
  | Construct_only -> "Construct_only"
  | Lax_validation -> "Lax_validation"
  | Static_name -> "Static_name"
  | Private -> "Private"
  | Static_nick -> "Static_nick"
  | Static_blurb -> "Static_blurb"
  | Explicit_notify -> "Explicit_notify"
  | Deprecated -> "Deprecated"

let get_type info =
  let get_type_raw =
    foreign "g_arg_info_get_type"
      (ptr arginfo @-> returning (ptr GITypeInfo.typeinfo)) in
  let info' = get_type_raw info in
  GITypeInfo.add_unref_finaliser info'

(* TODO : check that the info can be casted to arg info ? *)
let cast_from_baseinfo info =
  coerce (ptr GIBaseInfo.baseinfo) (ptr arginfo) info

let cast_to_baseinfo info =
  coerce (ptr arginfo) (ptr GIBaseInfo.baseinfo) info

let add_unref_finaliser info =
  let _ = Gc.finalise (fun i ->
      let i' = cast_to_baseinfo i in
      GIBaseInfo.base_info_unref i') info
  in info

let from_baseinfo info =
  let _ = GIBaseInfo.base_info_ref info in
  let info' = cast_from_baseinfo info in
  add_unref_finaliser info'

let to_baseinfo info =
  let info' = cast_to_baseinfo info in
  let _ = GIBaseInfo.base_info_ref info' in
  let _ = Gc.finalise (fun i ->
      GIBaseInfo.base_info_unref i) info' in
  info'
