open Ctypes

type t = Bad_weekday | Monday | Tuesday | Wednesday | Thursday | Friday | Saturday | Sunday

val of_value:
  Unsigned.uint32 -> t

val to_value:
  t -> Unsigned.uint32

val t_view: t typ

