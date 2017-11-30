open Ctypes
open Foreign

type t = Md5 | Sha1 | Sha256 | Sha512 | Sha384

let of_value v =
  if v = Unsigned.UInt32.of_int 0 then Md5
  else if v = Unsigned.UInt32.of_int 1 then Sha1
  else if v = Unsigned.UInt32.of_int 2 then Sha256
  else if v = Unsigned.UInt32.of_int 3 then Sha512
  else if v = Unsigned.UInt32.of_int 4 then Sha384
  else raise (Invalid_argument "Unexpected Checksum_type value")

let to_value =  function
  | Md5 -> Unsigned.UInt32.of_int 0
  | Sha1 -> Unsigned.UInt32.of_int 1
  | Sha256 -> Unsigned.UInt32.of_int 2
  | Sha512 -> Unsigned.UInt32.of_int 3
  | Sha384 -> Unsigned.UInt32.of_int 4

let t_view = view ~read:of_value ~write:to_value uint32_t

