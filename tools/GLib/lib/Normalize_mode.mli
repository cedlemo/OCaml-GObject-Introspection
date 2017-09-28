open Ctypes

type t = Default | Nfd | Default_compose | Nfc | All | Nfkd | All_compose | Nfkc
val of_value:
Unsigned.uint32 -> t
val to_value:
t -> Unsigned.uint32
val t_view: t typ

