open OUnit2
open GObjectIntrospection

let assert_equal_string str1 str2 =
  assert_equal ~printer: (fun s -> s) str1 str2

let assert_equal_boolean bool1 bool2 =
  assert_equal ~printer: (fun s -> string_of_bool s) bool1 bool2


let load_namespace namespace =
  let repo = GIRepository.get_default () in
  let _ = GIRepository.require repo namespace in
  repo
