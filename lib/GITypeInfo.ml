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
let typeinfo : t structure typ = structure "GITypeInfo"

let to_string =
  foreign "g_info_type_to_string"
    (ptr typeinfo @-> returning string)

let is_pointer =
  foreign "g_type_info_is_pointer"
    (ptr typeinfo @-> returning bool)

let get_tag info =
  let get_tag_raw =
    foreign "g_type_info_get_tag"
      (ptr typeinfo @-> returning int) in
  let tag = get_tag_raw info in
  GITypes.tag_of_int tag

let get_array_length =
  foreign "g_type_info_get_array_length"
    (ptr typeinfo @-> returning int)

let get_array_fixed_size =
  foreign "g_type_info_get_array_fixed_size"
    (ptr typeinfo @-> returning int)

(* TODO : check that the info can be casted to arg info ? *)
let cast_baseinfo_to_typeinfo info =
  coerce (ptr GIBaseInfo.baseinfo) (ptr typeinfo) info

let cast_typeinfo_to_baseinfo info =
  coerce (ptr typeinfo) (ptr GIBaseInfo.baseinfo) info

let add_unref_finaliser_to_type_info info =
  let _ = Gc.finalise (fun i ->
      let i' = cast_typeinfo_to_baseinfo i in
      GIBaseInfo.base_info_unref i') info
  in info

let typeinfo_of_baseinfo info =
  let _ = GIBaseInfo.base_info_ref info in
  let info' = cast_baseinfo_to_typeinfo info in
  add_unref_finaliser_to_type_info info'

let baseinfo_of_typeinfo info =
  let info' = cast_typeinfo_to_baseinfo info in
  let _ = GIBaseInfo.base_info_ref info' in
  let _ = Gc.finalise (fun i ->
      GIBaseInfo.base_info_unref i) info' in
  info'