open Ctypes

type t = Invalid | Unix | Ipv4 | Ipv6

val of_value:
  Unsigned.uint32 -> t

val to_value:
  t -> Unsigned.uint32

val t_view: t typ

