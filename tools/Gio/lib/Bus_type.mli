open Ctypes

type t = Starter | None | System | Session

val of_value:
  int32 -> t

val to_value:
  t -> int32

val t_view: t typ

