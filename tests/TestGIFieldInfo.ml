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

let namespace = "GLib"
let repo = GIRepository.get_default ()
let typelib = GIRepository.require (Some repo) namespace
let union_name = "Mutex"

let get_union_info () =
  match GIRepository.find_by_name (Some repo) namespace union_name with
  | None -> None
  | Some (base_info) ->
    match GIBaseInfo.get_type base_info with
    | GIBaseInfo.Union union_info -> Some union_info
    | _ -> None

let field_test fn =
  match get_union_info () with
  | None -> assert_equal_string union_name "No base info found"
  | Some (info) -> fn (GIUnionInfo.get_field info 0)

let test_field_get_flags test_ctxt =
  field_test (fun info ->
      let flags = GIFieldInfo.get_flags info in
      let rec check_flags = function
        | [] -> ()
        | f' :: q -> let _ = assert_equal ~printer:(fun f ->
            match f with
            | GIFieldInfo.Is_readable -> "readable"
            | GIFieldInfo.Is_writable -> "writable"
          ) GIFieldInfo.Is_readable f' in check_flags q
      in check_flags flags
    )

let test_field_is_readable test_ctxt =
  field_test (fun info ->
    let readable = GIFieldInfo.is_readable info in
    assert_equal_boolean true readable
    )


let test_field_get_offset test_ctxt =
  field_test (fun info ->
      let offset = GIFieldInfo.get_offset info in
      assert_equal_int 0 offset
    )

let test_field_get_size test_ctxt =
  field_test (fun info ->
      let size = GIFieldInfo.get_size info in
      assert_equal_int 0 size
    )


let tests =
  "GObject Introspection FiledInfo tests" >:::
  [
    "GIFieldInfo get flags" >:: test_field_get_flags;
    "GIFieldInfo is readable" >:: test_field_is_readable;
    "GIFieldInfo get offset" >:: test_field_get_offset;
    "GIFieldInfo get size" >:: test_field_get_size
  ]
