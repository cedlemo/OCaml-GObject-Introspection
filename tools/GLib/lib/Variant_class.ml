open Ctypes
open Foreign

type t = Boolean | Byte | Int16 | Uint16 | Int32 | Uint32 | Int64 | Uint64 | Handle | Double | String | Object_path | Signature | Variant | Maybe | Array | Tuple | Dict_entry

let of_value v =
  if v = Unsigned.UInt32.of_int 98 then Boolean
  else if v = Unsigned.UInt32.of_int 121 then Byte
  else if v = Unsigned.UInt32.of_int 110 then Int16
  else if v = Unsigned.UInt32.of_int 113 then Uint16
  else if v = Unsigned.UInt32.of_int 105 then Int32
  else if v = Unsigned.UInt32.of_int 117 then Uint32
  else if v = Unsigned.UInt32.of_int 120 then Int64
  else if v = Unsigned.UInt32.of_int 116 then Uint64
  else if v = Unsigned.UInt32.of_int 104 then Handle
  else if v = Unsigned.UInt32.of_int 100 then Double
  else if v = Unsigned.UInt32.of_int 115 then String
  else if v = Unsigned.UInt32.of_int 111 then Object_path
  else if v = Unsigned.UInt32.of_int 103 then Signature
  else if v = Unsigned.UInt32.of_int 118 then Variant
  else if v = Unsigned.UInt32.of_int 109 then Maybe
  else if v = Unsigned.UInt32.of_int 97 then Array
  else if v = Unsigned.UInt32.of_int 40 then Tuple
  else if v = Unsigned.UInt32.of_int 123 then Dict_entry
  else raise (Invalid_argument "Unexpected Variant_class value")

let to_value = function
  | Boolean -> Unsigned.UInt32.of_int 98
  | Byte -> Unsigned.UInt32.of_int 121
  | Int16 -> Unsigned.UInt32.of_int 110
  | Uint16 -> Unsigned.UInt32.of_int 113
  | Int32 -> Unsigned.UInt32.of_int 105
  | Uint32 -> Unsigned.UInt32.of_int 117
  | Int64 -> Unsigned.UInt32.of_int 120
  | Uint64 -> Unsigned.UInt32.of_int 116
  | Handle -> Unsigned.UInt32.of_int 104
  | Double -> Unsigned.UInt32.of_int 100
  | String -> Unsigned.UInt32.of_int 115
  | Object_path -> Unsigned.UInt32.of_int 111
  | Signature -> Unsigned.UInt32.of_int 103
  | Variant -> Unsigned.UInt32.of_int 118
  | Maybe -> Unsigned.UInt32.of_int 109
  | Array -> Unsigned.UInt32.of_int 97
  | Tuple -> Unsigned.UInt32.of_int 40
  | Dict_entry -> Unsigned.UInt32.of_int 123

let t_view = view ~read:of_value ~write:to_value uint32_t

