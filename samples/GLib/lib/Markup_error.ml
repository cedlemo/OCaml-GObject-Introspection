open Ctypes
open Foreign

type t = Bad_utf8 | Empty | Parse | Unknown_element | Unknown_attribute | Invalid_content | Missing_attribute
let of_value v =
if v = Unsigned.UInt32.of_int 0 then Bad_utf8
else if v = Unsigned.UInt32.of_int 1 then Empty
else if v = Unsigned.UInt32.of_int 2 then Parse
else if v = Unsigned.UInt32.of_int 3 then Unknown_element
else if v = Unsigned.UInt32.of_int 4 then Unknown_attribute
else if v = Unsigned.UInt32.of_int 5 then Invalid_content
else if v = Unsigned.UInt32.of_int 6 then Missing_attribute
else raise (Invalid_argument "Unexpected Markup_error value")
let to_value = function
| Bad_utf8 -> Unsigned.UInt32.of_int 0
| Empty -> Unsigned.UInt32.of_int 1
| Parse -> Unsigned.UInt32.of_int 2
| Unknown_element -> Unsigned.UInt32.of_int 3
| Unknown_attribute -> Unsigned.UInt32.of_int 4
| Invalid_content -> Unsigned.UInt32.of_int 5
| Missing_attribute -> Unsigned.UInt32.of_int 6
let t_view = view 
~read:of_value 
~write:to_value 
uint32_t

