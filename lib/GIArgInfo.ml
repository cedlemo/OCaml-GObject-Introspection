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
  | value  -> let message = String.concat " " ["GIArgInfo get_direction value";
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

(* TODO : check that the info can be casted to arg info ? *)
let cast_baseinfo_to_arginfo info =
  coerce (ptr GIBaseInfo.baseinfo) (ptr arginfo) info

let cast_arginfo_to_baseinfo info =
  coerce (ptr arginfo) (ptr GIBaseInfo.baseinfo) info

let add_unref_finaliser_to_arg_info info =
  let _ = Gc.finalise (fun i ->
      let i' = cast_arginfo_to_baseinfo i in
      GIBaseInfo.base_info_unref i') info
  in info

let arginfo_of_baseinfo info =
  let _ = GIBaseInfo.base_info_ref info in
  let info' = cast_baseinfo_to_arginfo info in
  add_unref_finaliser_to_arg_info info'

let baseinfo_of_arginfo info =
  let info' = cast_arginfo_to_baseinfo info in
  let _ = GIBaseInfo.base_info_ref info' in
  let _ = Gc.finalise (fun i ->
      GIBaseInfo.base_info_unref i) info' in
  info'
