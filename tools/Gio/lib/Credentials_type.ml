open Ctypes
open Foreign

type t = Invalid | Linux_ucred | Freebsd_cmsgcred | Openbsd_sockpeercred | Solaris_ucred | Netbsd_unpcbid

let of_value v =
  if v = Unsigned.UInt32.of_int 0 then Invalid
  else if v = Unsigned.UInt32.of_int 1 then Linux_ucred
  else if v = Unsigned.UInt32.of_int 2 then Freebsd_cmsgcred
  else if v = Unsigned.UInt32.of_int 3 then Openbsd_sockpeercred
  else if v = Unsigned.UInt32.of_int 4 then Solaris_ucred
  else if v = Unsigned.UInt32.of_int 5 then Netbsd_unpcbid
  else raise (Invalid_argument "Unexpected Credentials_type value")

let to_value =  function
  | Invalid -> Unsigned.UInt32.of_int 0
  | Linux_ucred -> Unsigned.UInt32.of_int 1
  | Freebsd_cmsgcred -> Unsigned.UInt32.of_int 2
  | Openbsd_sockpeercred -> Unsigned.UInt32.of_int 3
  | Solaris_ucred -> Unsigned.UInt32.of_int 4
  | Netbsd_unpcbid -> Unsigned.UInt32.of_int 5

let t_view = view ~read:of_value ~write:to_value uint32_t

