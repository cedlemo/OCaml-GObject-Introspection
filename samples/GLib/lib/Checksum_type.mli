open Ctypes

type t = Md5 | Sha1 | Sha256 | Sha512 | Sha384
val of_value:
Unsigned.uint32 -> t
val to_value:
t -> Unsigned.uint32
val t_view: t typ

