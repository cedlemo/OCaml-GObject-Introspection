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

type glist
let glist : glist structure typ = structure "GList"
let glist_data  = field glist "data" (ptr void)
let glist_next  = field glist "next" (ptr_opt glist)
let glist_prev  = field glist "prev" (ptr_opt glist)
let () = seal glist

let g_list_next l_ptr =
  getf (!@l_ptr) glist_next

let g_list_data l_ptr =
  getf (!@l_ptr) glist_data

(* TODO: Fix pb *)
let glist_of_strings_to_list glist_ptr =
  let rec loop acc p =
    match p with
    | None -> List.rev acc
    | Some p' -> let data = g_list_data p' in
      let next = g_list_next p' in
      match coerce (ptr void) string_opt data with
      | None -> loop ("toto" :: acc) next
      | Some s -> loop (s :: acc) next
  in loop [] glist_ptr

type gslist
let gslist : gslist structure typ = structure "GSList"
let gslist_data  = field gslist "data" (ptr void)
let gslist_next  = field gslist "next" (ptr_opt gslist)
let () = seal gslist

let g_slist_next l_ptr =
  getf (!@l_ptr) gslist_next

let g_slist_data l_ptr =
  getf (!@l_ptr) gslist_data

let gslist_of_strings_to_list gslist_ptr =
  let rec loop acc p =
    match p with
    | None -> List.rev acc
    | Some p' -> let data = g_slist_data p' in
      let next = g_slist_next p' in
      match coerce (ptr void) string_opt data with
      | None -> loop acc next
      | Some s -> loop (s :: acc) next
  in loop [] gslist_ptr
