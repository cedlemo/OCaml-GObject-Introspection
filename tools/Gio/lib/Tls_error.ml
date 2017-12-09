open Ctypes
open Foreign

type t = Unavailable | Misc | Bad_certificate | Not_tls | Handshake | Certificate_required | Eof

let of_value v =
  if v = Unsigned.UInt32.of_int 0 then Unavailable
  else if v = Unsigned.UInt32.of_int 1 then Misc
  else if v = Unsigned.UInt32.of_int 2 then Bad_certificate
  else if v = Unsigned.UInt32.of_int 3 then Not_tls
  else if v = Unsigned.UInt32.of_int 4 then Handshake
  else if v = Unsigned.UInt32.of_int 5 then Certificate_required
  else if v = Unsigned.UInt32.of_int 6 then Eof
  else raise (Invalid_argument "Unexpected Tls_error value")

let to_value = function
  | Unavailable -> Unsigned.UInt32.of_int 0
  | Misc -> Unsigned.UInt32.of_int 1
  | Bad_certificate -> Unsigned.UInt32.of_int 2
  | Not_tls -> Unsigned.UInt32.of_int 3
  | Handshake -> Unsigned.UInt32.of_int 4
  | Certificate_required -> Unsigned.UInt32.of_int 5
  | Eof -> Unsigned.UInt32.of_int 6

let t_view = view ~read:of_value ~write:to_value uint32_t

