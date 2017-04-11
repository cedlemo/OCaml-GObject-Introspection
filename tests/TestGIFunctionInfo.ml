open TestUtils
open OUnit2

let namespace = "GObject"
let repo = GIRepository.get_default ()
let typelib = GIRepository.require repo namespace

let test_gifunctioninfo_get_flags test_ctxt =
  let fn_name = "signal_name" in
  match GIRepository.find_by_name (Some repo) namespace fn_name with
  | None -> assert_equal_string fn_name "No base info found"
  | Some (base_info) -> match GIBaseInfo.get_type base_info with
    | GIBaseInfo.Function fn_info -> assert_equal GIFunctionInfo.Is_method
                                                  (GIFunctionInfo.get_flags fn_info)
    | _ -> assert_equal_string "Base info" "Wrong info type"

let test_gifunctioninfo_get_symbol test_ctxt =
  let fn_name = "signal_name" in
  match GIRepository.find_by_name (Some repo) namespace fn_name with
  | None -> assert_equal_string fn_name "No base info found"
  | Some (base_info) -> match GIBaseInfo.get_type base_info with
    | GIBaseInfo.Function fn_info -> assert_equal "g_signal_name"
                                                  (GIFunctionInfo.get_symbol fn_info)
    | _ -> assert_equal_string "Base info" "Wrong info type"

let tests =
  "GObject Introspection FunctionInfo tests" >:::
  [
    "GIFunctionInfo get flags" >:: test_gifunctioninfo_get_flags;
    "GIFunctionInfo get symbol" >:: test_gifunctioninfo_get_symbol
  ]
