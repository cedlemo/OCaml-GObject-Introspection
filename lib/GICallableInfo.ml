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

(** GIFunctionInfo — Struct representing a function. *)

open Ctypes
open Foreign
open Conversions

type t
let callableinfo : t structure typ = structure "GICallableInfo"

let can_throw_gerror =
  foreign "g_callable_info_can_throw_gerror"
    (ptr callableinfo @-> returning bool)

let get_n_args =
  foreign "g_callable_info_get_n_args"
    (ptr callableinfo @-> returning int)

let get_return_attribute =
  foreign "g_callable_info_get_return_attribute"
    (ptr callableinfo @-> returning string_opt)

let is_method =
  foreign "g_callable_info_is_method"
    (ptr callableinfo @-> returning bool)

let may_return_null =
  foreign "g_callable_info_may_return_null"
    (ptr callableinfo @-> returning bool)

let cast_baseinfo_to_callableinfo info =
  coerce (ptr GIBaseInfo.baseinfo) (ptr callableinfo) info

let cast_callableinfo_to_baseinfo info =
  coerce (ptr callableinfo) (ptr GIBaseInfo.baseinfo) info

let add_unref_finaliser_to_callable_info info =
  let _ = Gc.finalise (fun i ->
      let i' = cast_callableinfo_to_baseinfo i in
      GIBaseInfo.base_info_unref i') info
  in info

let callableinfo_of_baseinfo info =
  let _ = GIBaseInfo.base_info_ref info in
  let info' = cast_baseinfo_to_callableinfo info in
  add_unref_finaliser_to_callable_info info'

let baseinfo_of_callableinfo info =
  let info' = cast_callableinfo_to_baseinfo info in
  let _ = GIBaseInfo.base_info_ref info' in
  let _ = Gc.finalise (fun i ->
      GIBaseInfo.base_info_unref i) info' in
  info'

let cast_callableinfo_to_functioninfo info =
  coerce (ptr callableinfo) (ptr GIFunctionInfo.functioninfo) info

let cast_functioninfo_to_callableinfo info =
  coerce (ptr GIFunctionInfo.functioninfo) (ptr callableinfo) info

let functioninfo_of_callableinfo info =
  let info' = cast_callableinfo_to_baseinfo info in
  let _ = GIBaseInfo.base_info_ref info' in
  let info'' = cast_callableinfo_to_functioninfo info in
  GIFunctionInfo.add_unref_finaliser_to_function_info info''

let callableinfo_of_functioninfo info =
  let info' = GIFunctionInfo.cast_functioninfo_to_baseinfo info in
  let _ = GIBaseInfo.base_info_ref info' in
  let info'' = cast_functioninfo_to_callableinfo info in
  let _ = Gc.finalise (fun i ->
      let i' = cast_callableinfo_to_baseinfo i in
      GIBaseInfo.base_info_unref i') info'' in
  info''
