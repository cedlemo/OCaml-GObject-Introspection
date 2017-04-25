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
      | None -> loop acc next
      | Some s -> loop (s :: acc) next
  in loop [] glist_ptr

(**
 * https://developer.gnome.org/glib/stable/glib-Doubly-Linked-Lists.html#GList
 * https://developer.gnome.org/glib/stable/glib-Doubly-Linked-Lists.html#g-list-next
 * https://github.com/ocamllabs/ocaml-ctypes/wiki/ctypes-tutorial#structs-and-unions *)
