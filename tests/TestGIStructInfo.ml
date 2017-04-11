open TestUtils
open OUnit2

let namespace = "GObject"
let repo = GIRepository.get_default ()
let typelib = GIRepository.require repo namespace
let struct_name = "Value"

let test_gistructinfo_from_baseinfo test_ctxt =
  match GIRepository.find_by_name (Some repo) namespace struct_name with
  | None -> assert_equal_string struct_name "No base info found"
  | Some (base_info) -> assert_equal_boolean true (
      match GIBaseInfo.get_type base_info with
      | GIBaseInfo.Struct struct_info -> true
      | _ -> false)

let tests =
  "GObject Introspection StructInfo tests" >:::
  [
    "GIStructInfo from baseinfo" >:: test_gistructinfo_from_baseinfo
  ]
