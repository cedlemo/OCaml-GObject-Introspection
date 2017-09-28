open Ctypes
open Foreign

type t = Invalid_uri | Invalid_value | App_not_registered | Uri_not_found | Read | Unknown_encoding | Write | File_not_found
let of_value v =
if v = Unsigned.UInt32.of_int 0 then Invalid_uri
else if v = Unsigned.UInt32.of_int 1 then Invalid_value
else if v = Unsigned.UInt32.of_int 2 then App_not_registered
else if v = Unsigned.UInt32.of_int 3 then Uri_not_found
else if v = Unsigned.UInt32.of_int 4 then Read
else if v = Unsigned.UInt32.of_int 5 then Unknown_encoding
else if v = Unsigned.UInt32.of_int 6 then Write
else if v = Unsigned.UInt32.of_int 7 then File_not_found
else raise (Invalid_argument "Unexpected Bookmark_file_error value")
let to_value = function
| Invalid_uri -> Unsigned.UInt32.of_int 0
| Invalid_value -> Unsigned.UInt32.of_int 1
| App_not_registered -> Unsigned.UInt32.of_int 2
| Uri_not_found -> Unsigned.UInt32.of_int 3
| Read -> Unsigned.UInt32.of_int 4
| Unknown_encoding -> Unsigned.UInt32.of_int 5
| Write -> Unsigned.UInt32.of_int 6
| File_not_found -> Unsigned.UInt32.of_int 7
let t_view = view
~read:of_value
~write:to_value
uint32_t

