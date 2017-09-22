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

let test_loader_with_bad_namespace test_ctxt =
  match Loader.load "bad_namespace" () with
  | None -> assert_equal true true
  | Some _ -> assert_equal_string "It should not" "load anything"

let test_loader_with_good_namespace test_ctxt =
  match Loader.load "Gtk" () with
  | None -> assert_equal false true
  | Some _ -> assert_equal true true

let test_loader namespace fn =
  match Loader.load namespace () with
  | None -> assert_equal_string "Please provide " "a good namespace"
  | Some loader -> fn loader

let test_loader_get_namespace test_ctxt =
  test_loader "Gtk" (fun loader ->
      assert_equal_string "Gtk" (Loader.get_namespace loader)
    )

let test_loader_get_version_good test_ctxt =
  let version = "3.0" in
  match Loader.load "Gtk" ?version:(Some version) () with
  | None -> assert_equal_string "Please provide " "a good namespace"
  | Some loader -> let v = Loader.get_version loader in
    assert_equal_string version v

let test_loader_get_version_bad test_ctxt =
  let version = "123.0" in
  match Loader.load "Gtk" ?version:(Some version) () with
  | None -> assert_equal true true
  | Some loader -> let v = Loader.get_version loader in
    assert_equal_string "3.0" v

let test_loader_generate_dir test_ctxt =
test_loader "Gtk" (fun loader ->
    Loader.generate_dir loader;
    assert_file_exists "Gtk";
    assert_equal_boolean true (Sys.is_directory "Gtk");
    Unix.rmdir "Gtk";
    )

open Loader

let test_loader_generate_main_module_files test_ctxt =
  let open Binding_utils in
  test_loader "GLib" (fun loader ->
      let _ = Loader.generate_directories loader in
      let sources = Loader.generate_module_files loader "Core" in
      let mli = File.mli sources in
      let ml = File.ml sources in
      let mli_descr = File.descr mli in
      let ml_descr = File.descr ml in
      let _ = Printf.fprintf mli_descr "test" in
      let _ = Printf.fprintf ml_descr "test" in
      let test_close_and_remove file =
        let filename = File.name file in
        assert_file_exists filename;
        File.close file;
        Sys.remove filename;
      in
      test_close_and_remove ml;
      test_close_and_remove mli;
    )

let test_loader_warning_for_deprecated test_ctxt =
  let sources = Test_utils.tmp_sources test_ctxt in
  let mli_content = "(* !!! DEPRECATED : test. *)" in
  let _ = Loader.warning_for_deprecated "test" sources in
  let _ = Binding_utils.File.close_sources sources in
  let mli = Binding_utils.File.(mli sources |> name ) in
  check_file_and_content mli mli_content

let tests =
  "GObject Introspection Loader tests" >:::
  [
    "GObject Introspection Loader with bad namespace" >:: test_loader_with_bad_namespace;
    "GObject Introspection Loader with good namespace" >:: test_loader_with_good_namespace;
    "GObject Introspection Loader get namespace" >:: test_loader_get_namespace;
    "GObject Introspection Loader get version good" >:: test_loader_get_version_good;
    "GObject Introspection Loader get version bad" >:: test_loader_get_version_bad;
    "GObject Introspection Loader generate dir" >:: test_loader_generate_dir;
    "GObject Introspection Loader generate main module files" >:: test_loader_generate_main_module_files;
    "GObject Introspection Loader warning for deprecated" >:: test_loader_warning_for_deprecated
  ]
