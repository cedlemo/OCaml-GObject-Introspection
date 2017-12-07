open Ctypes

type t = Unknown | Default | Tcp | Udp | Sctp

val of_value:
  int32 -> t

val to_value:
  t -> int32

val t_view: t typ

