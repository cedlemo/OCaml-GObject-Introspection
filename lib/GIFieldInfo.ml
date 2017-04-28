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
let fieldinfo : t structure typ = structure "GIFieldInfo"

type flags =
  | Is_readable
  | Is_writable

let get_flags info =
  let get_flags_raw =
    foreign "g_field_info_get_flags"
      (ptr fieldinfo @-> returning int)
  in let flags = [] in
  let c_flags = get_flags_raw info in
  if ((c_flags land (1 lsl 0)) != 0) then ignore (Is_readable :: flags);
  if ((c_flags land (1 lsl 1)) != 0) then ignore (Is_writable :: flags);
  flags

(* TODO : check that the info can be casted to field info ? *)
let cast_baseinfo_to_fieldinfo info =
  coerce (ptr GIBaseInfo.baseinfo) (ptr fieldinfo) info

let cast_fieldinfo_to_baseinfo info =
  coerce (ptr fieldinfo) (ptr GIBaseInfo.baseinfo) info

let fieldinfo_of_baseinfo info =
  let _ = GIBaseInfo.base_info_ref info in
  let info' = cast_baseinfo_to_fieldinfo info in
  let _ = Gc.finalise (fun i ->
      let i' = cast_fieldinfo_to_baseinfo i in
      GIBaseInfo.base_info_unref i') info' in
  info'

let baseinfo_of_fieldinfo info =
  let info' = cast_fieldinfo_to_baseinfo info in
  let _ = GIBaseInfo.base_info_ref info' in
  let _ = Gc.finalise (fun i ->
      GIBaseInfo.base_info_unref i) info' in
  info'
