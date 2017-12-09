open Ctypes
open Foreign

type t = None

let of_value v =
  if v = Unsigned.UInt32.of_int 0 then None
  else raise (Invalid_argument "Unexpected Tls_certificate_request_flags value")

let to_value = function
  | None -> Unsigned.UInt32.of_int 0

let t_view = view ~read:of_value ~write:to_value uint32_t

