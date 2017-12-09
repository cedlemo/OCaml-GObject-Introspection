open Ctypes
open Foreign

type t = Invalid | Path | Interface | Member | Error_name | Reply_serial | Destination | Sender | Signature | Num_unix_fds

let of_value v =
  if v = Unsigned.UInt32.of_int 0 then Invalid
  else if v = Unsigned.UInt32.of_int 1 then Path
  else if v = Unsigned.UInt32.of_int 2 then Interface
  else if v = Unsigned.UInt32.of_int 3 then Member
  else if v = Unsigned.UInt32.of_int 4 then Error_name
  else if v = Unsigned.UInt32.of_int 5 then Reply_serial
  else if v = Unsigned.UInt32.of_int 6 then Destination
  else if v = Unsigned.UInt32.of_int 7 then Sender
  else if v = Unsigned.UInt32.of_int 8 then Signature
  else if v = Unsigned.UInt32.of_int 9 then Num_unix_fds
  else raise (Invalid_argument "Unexpected DBus_message_header_field value")

let to_value = function
  | Invalid -> Unsigned.UInt32.of_int 0
  | Path -> Unsigned.UInt32.of_int 1
  | Interface -> Unsigned.UInt32.of_int 2
  | Member -> Unsigned.UInt32.of_int 3
  | Error_name -> Unsigned.UInt32.of_int 4
  | Reply_serial -> Unsigned.UInt32.of_int 5
  | Destination -> Unsigned.UInt32.of_int 6
  | Sender -> Unsigned.UInt32.of_int 7
  | Signature -> Unsigned.UInt32.of_int 8
  | Num_unix_fds -> Unsigned.UInt32.of_int 9

let t_view = view ~read:of_value ~write:to_value uint32_t

