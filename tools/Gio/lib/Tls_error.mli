open Ctypes

type t = Unavailable | Misc | Bad_certificate | Not_tls | Handshake | Certificate_required | Eof

val of_value:
  Unsigned.uint32 -> t

val to_value:
  t -> Unsigned.uint32

val t_view: t typ

