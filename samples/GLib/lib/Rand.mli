open Ctypes

type t
val t_typ : t structure typ
val double:
t structure ptr -> float
val double_range:
t structure ptr -> float -> float -> float
val free:
t structure ptr -> unit
val int:
t structure ptr -> Unsigned.uint32
val int_range:
t structure ptr -> int32 -> int32 -> int32
val set_seed:
t structure ptr -> Unsigned.uint32 -> unit
val set_seed_array:
t structure ptr -> Unsigned.uint32 ptr -> Unsigned.uint32 -> unit

