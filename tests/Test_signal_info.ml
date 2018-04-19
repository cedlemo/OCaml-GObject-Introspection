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

open Test_utils
open OUnit2
open GObject_introspection

let namespace = "Gtk"
let typelib = Repository.require namespace ()
let object_name = "Window"
let signal_name = "activate-default"

let get_signal_info () =
  match Repository.find_by_name namespace object_name with
  | None -> None
  | Some (base_info) ->
    match Base_info.get_type base_info with
    | Base_info.Object -> (
        let object_info = Object_info.from_baseinfo base_info in
        match Object_info.find_signal object_info signal_name with
        | None -> None
        | Some info' -> Some info'
      )
    | _ -> None

let signal_test fn =
  match get_signal_info () with
  | None -> assert_equal_string object_name "No base info found"
  | Some (info) -> fn info

let test_true_stops_emit test_ctxt =
  signal_test (fun info ->
      let stops = Signal_info.true_stops_emit info in
      assert_equal_boolean false stops
    )

let test_get_flags test_ctxt =
  signal_test (fun info ->
      let flags = Signal_info.get_flags info in
      let rec check_flags = function
        | [] -> ()
        | f' :: q -> let _ = assert_equal ~printer:(fun f ->
            match f with
            | Signal_info.Run_first -> "Run_first"
            | Signal_info.Run_last -> "Run_last"
            | Signal_info.Run_cleanup -> "Run_cleanup"
            | Signal_info.No_recurse -> "No_recurse"
            | Signal_info.Detailed -> "Detailed"
            | Signal_info.Action -> "Action"
            | Signal_info.No_hooks -> "No_hooks"
            | Signal_info.Must_collect -> "Must_collect"
            | Signal_info.Deprecated -> "Deprecated"
          ) Signal_info.Run_first f' in check_flags q
      in check_flags flags
    )

let test_get_class_closure test_ctxt =
  signal_test (fun info ->
      match Signal_info.get_class_closure info with
      | None -> assert_equal_boolean true true
      | Some info' -> assert_equal_string "Class closure " " found"
    )

let tests =
  "GObject Introspection SignalInfo tests" >:::
  [
    "Signal_info true stops emit" >:: test_true_stops_emit;
    "Signal_info get flags" >:: test_get_flags;
    "GISingalInfo get class closure" >:: test_get_class_closure
  ]
