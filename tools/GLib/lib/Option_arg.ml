open Ctypes
open Foreign

type t = None | String | Int | Callback | Filename | String_array | Filename_array | Double | Int64

let of_value v =
  if v = Unsigned.UInt32.of_int 0 then None
  else if v = Unsigned.UInt32.of_int 1 then String
  else if v = Unsigned.UInt32.of_int 2 then Int
  else if v = Unsigned.UInt32.of_int 3 then Callback
  else if v = Unsigned.UInt32.of_int 4 then Filename
  else if v = Unsigned.UInt32.of_int 5 then String_array
  else if v = Unsigned.UInt32.of_int 6 then Filename_array
  else if v = Unsigned.UInt32.of_int 7 then Double
  else if v = Unsigned.UInt32.of_int 8 then Int64
  else raise (Invalid_argument "Unexpected Option_arg value")

let to_value = function
  | None -> Unsigned.UInt32.of_int 0
  | String -> Unsigned.UInt32.of_int 1
  | Int -> Unsigned.UInt32.of_int 2
  | Callback -> Unsigned.UInt32.of_int 3
  | Filename -> Unsigned.UInt32.of_int 4
  | String_array -> Unsigned.UInt32.of_int 5
  | Filename_array -> Unsigned.UInt32.of_int 6
  | Double -> Unsigned.UInt32.of_int 7
  | Int64 -> Unsigned.UInt32.of_int 8

let t_view = view ~read:of_value ~write:to_value uint32_t

