open Ctypes

type t = Resolving | Resolved | Connecting | Connected | Proxy_negotiating | Proxy_negotiated | Tls_handshaking | Tls_handshaked | Complete

val of_value:
  Unsigned.uint32 -> t

val to_value:
  t -> Unsigned.uint32

val t_view: t typ

