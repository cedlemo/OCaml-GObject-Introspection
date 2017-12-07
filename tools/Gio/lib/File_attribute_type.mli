open Ctypes

type t = Invalid | String | Byte_string | Boolean | Uint32 | Int32 | Uint64 | Int64 | Object | Stringv

val of_value:
  Unsigned.uint32 -> t

val to_value:
  t -> Unsigned.uint32

val t_view: t typ

