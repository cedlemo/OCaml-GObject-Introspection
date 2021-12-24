open Test_utils
open OUnit2
open GObject_introspection

let input_lines ch =
  let rec aux acc =
    match input_line ch with
    | exception End_of_file -> List.rev acc
    | line -> aux (line :: acc)
  in
  aux []

let test_get_version _ =
  let major = Version.get_major_version () |> string_of_int in
  let minor = Version.get_minor_version () |> string_of_int in
  let micro = Version.get_micro_version () |> string_of_int in
  let version = String.concat "." [ major; minor; micro ] in
  let run cmd =
    let inp = Unix.open_process_in cmd in
    let r =
      Fun.protect (fun () -> input_lines inp) ~finally:(fun () -> close_in inp)
    in
    List.hd r
  in
  let modversion =
    run "pkg-config --libs gobject-introspection-1.0 --modversion"
  in
  assert_equal_string version modversion

let tests =
  "GObject Introspection Version tests"
  >::: [ "Test get_version" >:: test_get_version ]
