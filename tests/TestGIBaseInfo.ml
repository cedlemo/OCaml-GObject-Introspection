open TestUtils
open OUnit2

let test_gibaseinfo_get_type test_ctxt =
  let namespace = "Gtk" in
  let repo = load_namespace namespace in
  let info_name = "init" in
  match GIRepository.find_by_name repo namespace info_name with
  | None -> assert_equal_string info_name "No base info found"
  | Some (base_info) -> let info_type = GIBaseInfo.get_type base_info
  in assert_equal ~printer: (fun s ->
    GIBaseInfo.baseinfo_type_get_name s
  ) GIBaseInfo.Function info_type

let test_gibaseinfo_equal test_ctxt =
  let namespace = "Gtk" in
  let repo = load_namespace namespace in
  match GIRepository.get_info repo namespace 10 with
  | None -> assert_equal true false
  | Some (rand_info) -> let info_name = GIBaseInfo.get_name rand_info in
  match GIRepository.find_by_name repo namespace info_name with
  | None -> assert_equal_string info_name "No base info found"
  | Some (info) -> let is_equal = GIBaseInfo.equal rand_info info in
  assert_equal_boolean true is_equal


let tests =
  "GObject Introspection BaseInfo tests" >:::
    [
     "GIBaseInfo get type" >:: test_gibaseinfo_get_type;
     "GIBaseInfo equal" >:: test_gibaseinfo_equal
    ]
