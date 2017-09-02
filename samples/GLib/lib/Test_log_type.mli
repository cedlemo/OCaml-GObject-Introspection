open Ctypes

type t = None | Error | Start_binary | List_case | Skip_case | Start_case | Stop_case | Min_result | Max_result | Message | Start_suite | Stop_suite
val of_value:
Unsigned.uint32 -> t
val to_value:
t -> Unsigned.uint32
val t_view: t typ

