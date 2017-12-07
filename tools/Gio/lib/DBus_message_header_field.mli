open Ctypes

type t = Invalid | Path | Interface | Member | Error_name | Reply_serial | Destination | Sender | Signature | Num_unix_fds

val of_value:
  Unsigned.uint32 -> t

val to_value:
  t -> Unsigned.uint32

val t_view: t typ

