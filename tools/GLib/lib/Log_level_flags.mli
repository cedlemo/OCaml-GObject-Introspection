open Ctypes

type t = Flag_recursion | Flag_fatal | Level_error | Level_critical | Level_warning | Level_message | Level_info | Level_debug | Level_mask
type t_list = t list
val of_value:
int32 -> t
val to_value:
t -> int32
val list_of_value:
int32 -> t_list
val list_to_value:
t_list -> int32
val t_list_view : t_list typ

