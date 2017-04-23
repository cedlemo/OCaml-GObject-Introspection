open Ctypes
open Foreign

type carray_of_strings = unit ptr
let carray_of_strings : carray_of_strings typ = ptr void

let g_strv_length =
  foreign "g_strv_length" (carray_of_strings @-> returning int)

let null_term_array_of_strings_to_list array_ptr =
  let len = g_strv_length array_ptr in
  let strings = [] in
  for i = 0 to (len - 1) do
    let ptr' = array_ptr +@ i in
    let char_ptr = Ctypes.coerce (ptr void) (ptr char) ptr' in
    ignore( (string_from_ptr char_ptr)::strings)
  done;
  strings

