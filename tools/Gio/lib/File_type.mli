open Ctypes

type t = Unknown | Regular | Directory | Symbolic_link | Special | Shortcut | Mountable

val of_value:
  Unsigned.uint32 -> t

val to_value:
  t -> Unsigned.uint32

val t_view: t typ

