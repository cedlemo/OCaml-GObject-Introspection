open Ctypes
open Foreign

type t = Srv | Mx | Txt | Soa | Ns

let of_value v =
  if v = Unsigned.UInt32.of_int 1 then Srv
  else if v = Unsigned.UInt32.of_int 2 then Mx
  else if v = Unsigned.UInt32.of_int 3 then Txt
  else if v = Unsigned.UInt32.of_int 4 then Soa
  else if v = Unsigned.UInt32.of_int 5 then Ns
  else raise (Invalid_argument "Unexpected Resolver_record_type value")

let to_value =  function
  | Srv -> Unsigned.UInt32.of_int 1
  | Mx -> Unsigned.UInt32.of_int 2
  | Txt -> Unsigned.UInt32.of_int 3
  | Soa -> Unsigned.UInt32.of_int 4
  | Ns -> Unsigned.UInt32.of_int 5

let t_view = view ~read:of_value ~write:to_value uint32_t

