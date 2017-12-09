open Ctypes
open Foreign

type t = Resolving | Resolved | Connecting | Connected | Proxy_negotiating | Proxy_negotiated | Tls_handshaking | Tls_handshaked | Complete

let of_value v =
  if v = Unsigned.UInt32.of_int 0 then Resolving
  else if v = Unsigned.UInt32.of_int 1 then Resolved
  else if v = Unsigned.UInt32.of_int 2 then Connecting
  else if v = Unsigned.UInt32.of_int 3 then Connected
  else if v = Unsigned.UInt32.of_int 4 then Proxy_negotiating
  else if v = Unsigned.UInt32.of_int 5 then Proxy_negotiated
  else if v = Unsigned.UInt32.of_int 6 then Tls_handshaking
  else if v = Unsigned.UInt32.of_int 7 then Tls_handshaked
  else if v = Unsigned.UInt32.of_int 8 then Complete
  else raise (Invalid_argument "Unexpected Socket_client_event value")

let to_value = function
  | Resolving -> Unsigned.UInt32.of_int 0
  | Resolved -> Unsigned.UInt32.of_int 1
  | Connecting -> Unsigned.UInt32.of_int 2
  | Connected -> Unsigned.UInt32.of_int 3
  | Proxy_negotiating -> Unsigned.UInt32.of_int 4
  | Proxy_negotiated -> Unsigned.UInt32.of_int 5
  | Tls_handshaking -> Unsigned.UInt32.of_int 6
  | Tls_handshaked -> Unsigned.UInt32.of_int 7
  | Complete -> Unsigned.UInt32.of_int 8

let t_view = view ~read:of_value ~write:to_value uint32_t

