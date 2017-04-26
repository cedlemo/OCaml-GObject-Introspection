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

type baseinfo
let baseinfo : baseinfo structure typ = structure "GIBaseInfo"

let ref =
  foreign "g_base_info_ref" (ptr baseinfo @-> returning (ptr baseinfo))

let unref =
  foreign "g_base_info_unref" (ptr baseinfo @-> returning void)

let get_name =
  foreign "g_base_info_get_name" (ptr baseinfo @-> returning string_opt)

let equal =
  foreign "g_base_info_equal" (ptr baseinfo @-> ptr baseinfo @-> returning bool)

let get_namespace =
  foreign "g_base_info_get_namespace" (ptr baseinfo @-> returning string)

let is_deprecated =
  foreign "g_base_info_is_deprecated" (ptr baseinfo @-> returning bool)
