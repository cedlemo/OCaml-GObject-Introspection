open Ctypes

type t = Bad_month | January | February | March | April | May | June | July | August | September | October | November | December
val of_value:
Unsigned.uint32 -> t
val to_value:
t -> Unsigned.uint32
val t_view: t typ

