open Ctypes

type t = Invalid | Method_call | Method_return | Error | Signal

val of_value:
  Unsigned.uint32 -> t

val to_value:
  t -> Unsigned.uint32

val t_view: t typ

