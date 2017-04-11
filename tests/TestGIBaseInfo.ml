open TestUtils
open OUnit2

let namespace = "Gio"
let repo = GIRepository.get_default ()
let typelib = GIRepository.require repo namespace
let info_name = "app_info_create_from_commandline"

let test_gibaseinfo_get_type test_ctxt =
  match GIRepository.find_by_name (Some repo) namespace info_name with
  | None -> assert_equal_string info_name "No base info found"
  | Some (base_info) -> let info_type = GIBaseInfo.get_type base_info
  in assert_equal_string "function"  (GIBaseInfo.baseinfo_type_get_name info_type)

let test_gibaseinfo_equal test_ctxt =
  match GIRepository.get_info repo namespace 10 with
  | None -> assert_equal true false
  | Some (rand_info) -> let info_name = GIBaseInfo.get_name rand_info in
  match GIRepository.find_by_name (Some repo) namespace info_name with
  | None -> assert_equal_string info_name "No base info found"
  | Some (info) -> let is_equal = GIBaseInfo.equal rand_info info in
  assert_equal_boolean true is_equal

let test_gibaseinfo_get_namespace test_ctxt =
  match GIRepository.find_by_name (Some repo) namespace info_name with
  | None -> assert_equal_string info_name "No base info found"
  | Some (base_info) -> let info_namespace = GIBaseInfo.get_namespace base_info
  in assert_equal_string namespace info_namespace

(* TODO: fix error *)
let test_gibaseinfo_get_container test_ctxt =
  let info_name = "Button" in
  match GIRepository.find_by_name (Some repo) namespace info_name with
  | None -> assert_equal_string info_name "No base info found"
  | Some (base_info) -> let container = GIBaseInfo.get_container base_info
  in let container_name = GIBaseInfo.get_name container in
  assert_equal_string "nope" container_name

let tests =
  "GObject Introspection BaseInfo tests" >:::
    [
     "GIBaseInfo get type" >:: test_gibaseinfo_get_type;
     "GIBaseInfo equal" >:: test_gibaseinfo_equal;
     "GIBaseInfo get namespace" >:: test_gibaseinfo_get_namespace(*;
     "GIBaseInfo get container" >:: test_gibaseinfo_get_container *)
    ]
