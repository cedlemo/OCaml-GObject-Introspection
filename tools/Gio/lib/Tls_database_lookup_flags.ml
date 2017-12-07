open Ctypes
open Foreign

type t = None | Keypair

let of_value v =
  if v = Unsigned.UInt32.of_int 0 then None
  else if v = Unsigned.UInt32.of_int 1 then Keypair
  else raise (Invalid_argument "Unexpected Tls_database_lookup_flags value")

let to_value =  function
  | None -> Unsigned.UInt32.of_int 0
  | Keypair -> Unsigned.UInt32.of_int 1

let t_view = view ~read:of_value ~write:to_value uint32_t

