(*
 * Copyright 2017-2019 Cedric LE MOIGNE, cedlemo@gmx.com
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
let vfuncinfo : t structure typ = structure "VFunc_info"

let get_offset =
  foreign "g_vfunc_info_get_offset"
    (ptr vfuncinfo @-> returning int)

let get_signal info =
  let get_signal_raw =
    foreign "g_vfunc_info_get_signal"
      (ptr vfuncinfo @-> returning (ptr_opt Callable_info.callableinfo)) in
  match get_signal_raw info with
  | None -> None
  | Some info' -> let info'' = Callable_info.add_unref_finaliser info' in
    Some info''

let all_flags : (int64 * Bindings.VFunc_info.flags) list= [
    Stubs.VFunc_info.gi_vfunc_must_chain_up, Must_chain_up;
    Stubs.VFunc_info.gi_vfunc_must_override, Must_override;
    Stubs.VFunc_info.gi_vfunc_must_not_override, Must_not_override;
    Stubs.VFunc_info.gi_vfunc_throws, Throws;
  ]

let flags_list_of_int64 v =
  let open Int64 in
  let rec build_flags_list allf acc =
    match allf with
    | [] -> acc
    | (i, f) :: q -> if ((logand v i) <> zero) then build_flags_list q (f :: acc)
       else build_flags_list q acc
  in build_flags_list all_flags []

let int64_of_flags_list (f : Bindings.VFunc_info.flags list) =
  let open Int64 in
  let bitwise_or = fun acc value ->
    let (i, _f) = List.find (fun (i', f') -> value = f') all_flags in logor acc i
  in
  List.fold_left bitwise_or Int64.zero f

let flags_list =
  view Stubs.VFunc_info.flags
    ~read:flags_list_of_int64
    ~write:int64_of_flags_list


(* let get_flags info =
  let get_flags_raw =
    foreign "g_vfunc_info_get_flags"
      (ptr vfuncinfo @-> returning int) in
  let flags = [] in
  let c_flags = get_flags_raw info in
  if ((c_flags land (1 lsl 0)) != 0) then ignore (Must_chain_up :: flags);
  if ((c_flags land (1 lsl 1)) != 0) then ignore (Must_override :: flags);
  if ((c_flags land (1 lsl 2)) != 0) then ignore (Must_not_override :: flags);
  if ((c_flags land (1 lsl 3)) != 0) then ignore (Throws :: flags);
  flags
*)
let get_flags =
  foreign "g_vfunc_info_get_flags"
      (ptr vfuncinfo @-> returning flags_list)

(* TODO : check that the info can be casted to vfunc info ? *)
let cast_from_baseinfo info =
  coerce (ptr Base_info.baseinfo) (ptr vfuncinfo) info

let cast_to_baseinfo info =
  coerce (ptr vfuncinfo) (ptr Base_info.baseinfo) info

let add_unref_finaliser info =
  let _ = Gc.finalise (fun i ->
      let i' = cast_to_baseinfo i in
      Base_info.base_info_unref i') info
  in info

let from_baseinfo info =
  let _ = Base_info.base_info_ref info in
  let info' = cast_from_baseinfo info in
  add_unref_finaliser info'

let to_baseinfo info =
  let info' = cast_to_baseinfo info in
  let _ = Base_info.base_info_ref info' in
  let _ = Gc.finalise (fun i ->
      Base_info.base_info_unref i) info' in
  info'

let cast_from_callableinfo info =
  coerce (ptr Callable_info.callableinfo) (ptr vfuncinfo) info

let cast_to_callableinfo info =
  coerce (ptr vfuncinfo) (ptr Callable_info.callableinfo) info

let to_callableinfo info =
  let info' = cast_to_baseinfo info in
  let _ = Base_info.base_info_ref info' in
  let info'' = cast_to_callableinfo info in
  Callable_info.add_unref_finaliser info''

let from_callableinfo info =
  let info' = Callable_info.cast_to_baseinfo info in
  let _ = Base_info.base_info_ref info' in
  let info'' = cast_from_callableinfo info in
  let _ = Gc.finalise (fun i ->
      let i' = cast_to_baseinfo i in
      Base_info.base_info_unref i') info'' in
  info''

