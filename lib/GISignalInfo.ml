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
let signalinfo : t structure typ = structure "GISignalInfo"


let true_stops_emit =
  foreign "g_signal_info_true_stops_emit"
    (ptr signalinfo @-> returning bool)

(* TODO : check that the info can be casted to signal info ? *)
let cast_from_baseinfo info =
  coerce (ptr GIBaseInfo.baseinfo) (ptr signalinfo) info

let cast_to_baseinfo info =
  coerce (ptr signalinfo) (ptr GIBaseInfo.baseinfo) info

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

let cast_from_callableinfo info =
  coerce (ptr GICallableInfo.callableinfo) (ptr signalinfo) info

let cast_to_callableinfo info =
  coerce (ptr signalinfo) (ptr GICallableInfo.callableinfo) info

let to_callableinfo info =
  let info' = cast_to_baseinfo info in
  let _ = GIBaseInfo.base_info_ref info' in
  let info'' = cast_to_callableinfo info in
  GICallableInfo.add_unref_finaliser info''

let from_callableinfo info =
  let info' = GICallableInfo.cast_to_baseinfo info in
  let _ = GIBaseInfo.base_info_ref info' in
  let info'' = cast_from_callableinfo info in
  let _ = Gc.finalise (fun i ->
      let i' = cast_to_baseinfo i in
      GIBaseInfo.base_info_unref i') info'' in
  info''
