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
let constantinfo: t structure typ = structure "GIConstantInfo"

let get_type info =
  let get_type_raw =
    foreign "g_constant_info_get_type"
      (ptr constantinfo @-> returning (ptr GITypeInfo.typeinfo)) in
  let info' = get_type_raw info in
  GITypeInfo.add_unref_finaliser_to_type_info info'

(* TODO : check that the info can be casted to a constantinfo ? *)
let cast_baseinfo_to_constantinfo info =
  coerce (ptr GIBaseInfo.baseinfo) (ptr constantinfo) info

let cast_constantinfo_to_baseinfo info =
  coerce (ptr constantinfo) (ptr GIBaseInfo.baseinfo) info

let constantinfo_of_baseinfo info =
  let _ = GIBaseInfo.base_info_ref info in
  let info' = cast_baseinfo_to_constantinfo info in
  let _ = Gc.finalise (fun i ->
      let i' = cast_constantinfo_to_baseinfo i in
      GIBaseInfo.base_info_unref i') info' in
  info'

let baseinfo_of_constantinfo info =
  let info' = cast_constantinfo_to_baseinfo info in
  let _ = GIBaseInfo.base_info_ref info' in
  let _ = Gc.finalise (fun i ->
      GIBaseInfo.base_info_unref i) info' in
  info'
