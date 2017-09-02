open Ctypes

type t = No_conversion | Illegal_sequence | Failed | Partial_input | Bad_uri | Not_absolute_path | No_memory
val of_value:
Unsigned.uint32 -> t
val to_value:
t -> Unsigned.uint32
val t_view: t typ

