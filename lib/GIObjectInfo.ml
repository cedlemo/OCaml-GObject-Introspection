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
open Conversions

type t
let objectinfo : t structure typ = structure "GIObjectInfo"

let get_abstract =
  foreign "g_object_info_get_abstract"
    (ptr objectinfo @-> returning bool)

let get_fundamental =
  foreign "g_object_info_get_fundamental"
    (ptr objectinfo @-> returning bool)

let get_parent info =
  let get_parent_raw =
    foreign "g_object_info_get_parent"
      (ptr objectinfo @-> returning (ptr GIBaseInfo.baseinfo)) in
  let info' = get_parent_raw info in
  GIBaseInfo.add_unref_finaliser_to_base_info info'

let get_type_name =
  foreign "g_object_info_get_type_name"
    (ptr objectinfo @-> returning string)

let get_type_init =
  foreign "g_object_info_get_type_init"
    (ptr objectinfo @-> returning string)

(* TODO : check that the info can be casted to object info ? *)
let cast_baseinfo_to_objectinfo info =
  coerce (ptr GIBaseInfo.baseinfo) (ptr objectinfo) info

let cast_objectinfo_to_baseinfo info =
  coerce (ptr objectinfo) (ptr GIBaseInfo.baseinfo) info

let add_unref_finaliser_to_object_info info =
  let _ = Gc.finalise (fun i ->
      let i' = cast_objectinfo_to_baseinfo i in
      GIBaseInfo.base_info_unref i') info
  in info

let objectinfo_of_baseinfo info =
  let _ = GIBaseInfo.base_info_ref info in
  let info' = cast_baseinfo_to_objectinfo info in
  add_unref_finaliser_to_object_info info'

let baseinfo_of_objectinfo info =
  let info' = cast_objectinfo_to_baseinfo info in
  let _ = GIBaseInfo.base_info_ref info' in
  let _ = Gc.finalise (fun i ->
      GIBaseInfo.base_info_unref i) info' in
  info'
