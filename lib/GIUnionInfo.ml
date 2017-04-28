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
let unioninfo : t structure typ = structure "GIUnionInfo"

let get_n_fields =
  foreign "g_union_info_get_n_fields"
    (ptr unioninfo @-> returning int)

let get_size =
  foreign "g_union_info_get_size"
    (ptr unioninfo @-> returning int)

let get_alignment =
  foreign "g_union_info_get_alignment"
    (ptr unioninfo @-> returning int)

(* TODO : check that the info can be casted to a structinfo ? *)
let cast_baseinfo_to_unioninfo info =
  coerce (ptr GIBaseInfo.baseinfo) (ptr unioninfo) info

let cast_unioninfo_to_baseinfo info =
  coerce (ptr unioninfo) (ptr GIBaseInfo.baseinfo) info

let unioninfo_of_baseinfo info =
  let _ = GIBaseInfo.base_info_ref info in
  let info' = cast_baseinfo_to_unioninfo info in
  let _ = Gc.finalise (fun i ->
      let i' = cast_unioninfo_to_baseinfo i in
      GIBaseInfo.base_info_unref i') info' in
  info'

let baseinfo_of_unioninfo info =
  let info' = cast_unioninfo_to_baseinfo info in
  let _ = GIBaseInfo.base_info_ref info' in
  let _ = Gc.finalise (fun i ->
      GIBaseInfo.base_info_unref i) info' in
  info'
