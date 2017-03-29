open OUnit2
open GObjectIntrospection

let test_load_namespace test_ctxt =
  let namespace = "Gtk" in
  let repo = GIRepository.get_default () in
  let _ = GIRepository.require repo namespace in
  let c_prefix = GIRepository.get_c_prefix repo namespace in
  assert_equal ~printer: (fun s -> s) namespace c_prefix

let test_girepository_search_path test_ctxt =
  let _ = GIRepository.get_default () in
  let initial_search_path = (String.concat " " (GIRepository.get_search_path ())) in
  let with_search_path= "/home/cedlemo" in
  let _ = GIRepository.prepend_search_path with_search_path in
  let search_path = String.concat " " (GIRepository.get_search_path ()) in
  assert_equal ~printer: (fun s -> s) (String.concat " " [initial_search_path; with_search_path])
                                       search_path

let test_girepository_get_dependencies test_ctxt =
  let dependencies_check = "GObject-2.0 GLib-2.0" in
  let namespace = "Gio" in
  let repo = GIRepository.get_default () in
  let _ = GIRepository.require repo namespace in
  let dependencies = String.concat " " (GIRepository.get_dependencies repo namespace) in
  assert_equal ~printer: (fun s -> s) dependencies_check dependencies

let test_girepository_get_immediate_dependencies test_ctxt =
  let dependencies_check = "Atk-1.0 Gdk-3.0 xlib-2.0" in
  let namespace = "Gtk" in
  let repo = GIRepository.get_default () in
  let _ = GIRepository.require repo namespace in
  let dependencies = String.concat " " (GIRepository.get_immediate_dependencies repo namespace) in
  assert_equal ~printer: (fun s -> s) dependencies_check dependencies

let test_girepository_get_loaded_namespaces test_ctxt =
  let namespaces_check = "Gio GObject GLib" in
  let namespace = "Gio" in
  let repo = GIRepository.get_default () in
  let _ = GIRepository.require repo namespace in
  let namespaces = String.concat " " (GIRepository.get_loaded_namespaces repo) in
  assert_equal ~printer: (fun s -> s) namespaces_check namespaces

let gobject_introspection_tests =
  "GObject Introspection tests" >:::
    ["Load Gtk namespace" >:: test_load_namespace;
     "Search path tests" >:: test_girepository_search_path;
     "GLib dependencies tests" >:: test_girepository_get_dependencies;
     "Gtk immediate dependencies tests" >:: test_girepository_get_immediate_dependencies;
     "GLib get loaded namespaces tests" >:: test_girepository_get_loaded_namespaces
    ]

let () =
  run_test_tt_main gobject_introspection_tests
