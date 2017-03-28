open OUnit2
open GObjectIntrospection

let test_load_namespace test_ctxt =
  let namespace = "Gtk" in
  let repo = GIRepository.get_default () in
  let tplib = GIRepository.require repo namespace in
  let c_prefix = GIRepository.get_c_prefix repo namespace in
  assert_equal ~printer: (fun s -> s) namespace c_prefix

let test_girepository_get_dependencies test_ctxt =
  let dependencies_check = "GObject-2.0 GLib-2.0" in
  let namespace = "Gio" in
  let repo = GIRepository.get_default () in
  let tplib = GIRepository.require repo namespace in
  let dependencies = String.concat " " (GIRepository.get_dependencies repo namespace) in
  assert_equal ~printer: (fun s -> s) dependencies_check dependencies

let gobject_introspection_tests =
  "GObject Introspection tests" >:::
    ["Load Gtk namespace" >:: test_load_namespace;
     "GLib dependencies tests" >:: test_girepository_get_dependencies]

let () =
  run_test_tt_main gobject_introspection_tests
