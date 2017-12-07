open Ctypes

type t = Invalid | Anonymous | Path | Abstract | Abstract_padded

val of_value:
  Unsigned.uint32 -> t

val to_value:
  t -> Unsigned.uint32

val t_view: t typ

