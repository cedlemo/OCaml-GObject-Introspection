open Ctypes

type t = None | String | Int | Callback | Filename | String_array | Filename_array | Double | Int64
val of_value:
Unsigned.uint32 -> t
val to_value:
t -> Unsigned.uint32
val t_view: t typ

