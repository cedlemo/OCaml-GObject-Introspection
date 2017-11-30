open Ctypes
open Foreign

type t = Unknown_encoding | Parse | Not_found | Key_not_found | Group_not_found | Invalid_value

let of_value v =
  if v = Unsigned.UInt32.of_int 0 then Unknown_encoding
  else if v = Unsigned.UInt32.of_int 1 then Parse
  else if v = Unsigned.UInt32.of_int 2 then Not_found
  else if v = Unsigned.UInt32.of_int 3 then Key_not_found
  else if v = Unsigned.UInt32.of_int 4 then Group_not_found
  else if v = Unsigned.UInt32.of_int 5 then Invalid_value
  else raise (Invalid_argument "Unexpected Key_file_error value")

let to_value =  function
  | Unknown_encoding -> Unsigned.UInt32.of_int 0
  | Parse -> Unsigned.UInt32.of_int 1
  | Not_found -> Unsigned.UInt32.of_int 2
  | Key_not_found -> Unsigned.UInt32.of_int 3
  | Group_not_found -> Unsigned.UInt32.of_int 4
  | Invalid_value -> Unsigned.UInt32.of_int 5

let t_view = view ~read:of_value ~write:to_value uint32_t

