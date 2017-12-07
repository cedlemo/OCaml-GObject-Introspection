open Ctypes

type t = Binding | Bound | Listening | Listened

val of_value:
  Unsigned.uint32 -> t

val to_value:
  t -> Unsigned.uint32

val t_view: t typ

