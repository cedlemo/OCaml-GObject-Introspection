open Ctypes

type t = Fbig | Inval | Io | Isdir | Nospc | Nxio | Overflow | Pipe | Failed

val of_value:
  Unsigned.uint32 -> t

val to_value:
  t -> Unsigned.uint32

val t_view: t typ

