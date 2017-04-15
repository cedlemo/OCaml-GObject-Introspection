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

open OUnit2
open GObjectIntrospection

let assert_equal_string str1 str2 =
  assert_equal ~printer: (fun s -> s) str1 str2

let assert_equal_boolean bool1 bool2 =
  assert_equal ~printer: (fun s -> string_of_bool s) bool1 bool2

let assert_equal_int int1 int2 =
  assert_equal ~printer: (fun s -> string_of_int s) int1 int2

let load_namespace namespace =
  let repo = GIRepository.get_default () in
  let _ = GIRepository.require repo namespace in
  repo
