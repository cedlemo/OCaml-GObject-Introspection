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

open TestUtils
open OUnit2

let test_loader_with_bad_namespace test_ctxt =
  match Loader.load "bad_namespace" () with
  | None -> assert_equal true true
  | Some _ -> assert_equal_string "It should not" "load anything"

let test_loader_with_good_namespace test_ctxt =
  match Loader.load "Gtk" () with
  | None -> assert_equal false true
  | Some _ -> assert_equal true true

let tests =
  "GObject Introspection Loader tests" >:::
  [
    "GObject Introspection Loader with bad namespace" >:: test_loader_with_bad_namespace;
    "GObject Introspection Loader with good namespace" >:: test_loader_with_good_namespace
  ]
