open Ctypes

type t = Unknown_encoding | Parse | Not_found | Key_not_found | Group_not_found | Invalid_value
val of_value:
Unsigned.uint32 -> t
val to_value:
t -> Unsigned.uint32
val t_view: t typ

