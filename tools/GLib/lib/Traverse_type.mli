open Ctypes

type t = In_order | Pre_order | Post_order | Level_order

val of_value:
  Unsigned.uint32 -> t

val to_value:
  t -> Unsigned.uint32

val t_view: t typ

