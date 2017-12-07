open Ctypes
open Foreign

type t = Invalid | String | Byte_string | Boolean | Uint32 | Int32 | Uint64 | Int64 | Object | Stringv

let of_value v =
  if v = Unsigned.UInt32.of_int 0 then Invalid
  else if v = Unsigned.UInt32.of_int 1 then String
  else if v = Unsigned.UInt32.of_int 2 then Byte_string
  else if v = Unsigned.UInt32.of_int 3 then Boolean
  else if v = Unsigned.UInt32.of_int 4 then Uint32
  else if v = Unsigned.UInt32.of_int 5 then Int32
  else if v = Unsigned.UInt32.of_int 6 then Uint64
  else if v = Unsigned.UInt32.of_int 7 then Int64
  else if v = Unsigned.UInt32.of_int 8 then Object
  else if v = Unsigned.UInt32.of_int 9 then Stringv
  else raise (Invalid_argument "Unexpected File_attribute_type value")

let to_value =  function
  | Invalid -> Unsigned.UInt32.of_int 0
  | String -> Unsigned.UInt32.of_int 1
  | Byte_string -> Unsigned.UInt32.of_int 2
  | Boolean -> Unsigned.UInt32.of_int 3
  | Uint32 -> Unsigned.UInt32.of_int 4
  | Int32 -> Unsigned.UInt32.of_int 5
  | Uint64 -> Unsigned.UInt32.of_int 6
  | Int64 -> Unsigned.UInt32.of_int 7
  | Object -> Unsigned.UInt32.of_int 8
  | Stringv -> Unsigned.UInt32.of_int 9

let t_view = view ~read:of_value ~write:to_value uint32_t

