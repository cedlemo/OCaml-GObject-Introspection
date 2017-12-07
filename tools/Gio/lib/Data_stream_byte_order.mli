open Ctypes

type t = Big_endian | Little_endian | Host_endian

val of_value:
  Unsigned.uint32 -> t

val to_value:
  t -> Unsigned.uint32

val t_view: t typ

