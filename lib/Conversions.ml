open Ctypes
open Foreign

type carray_of_strings = char ptr ptr
let carray_of_strings : carray_of_strings typ = ptr (ptr char)

let carray_of_strings_to_list : char ptr ptr -> string list =
  let rec loop acc p =
    match coerce (ptr char) string_opt !@p with
    | None -> List.rev acc
    | Some s -> loop (s :: acc) (p +@ 1)
in loop []

external carrayof_strings_to_array : carray_of_strings -> string array = "caml_copy_string_array"
