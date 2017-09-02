open Ctypes

type t = Bad_utf8 | Empty | Parse | Unknown_element | Unknown_attribute | Invalid_content | Missing_attribute
val of_value:
Unsigned.uint32 -> t
val to_value:
t -> Unsigned.uint32
val t_view: t typ

