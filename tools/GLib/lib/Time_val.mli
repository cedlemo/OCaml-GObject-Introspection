open Ctypes

type t
val t_typ : t structure typ
val f_tv_sec: (int64, t structure) field
val f_tv_usec: (int64, t structure) field
val add:
t structure ptr -> int64 -> unit

val to_iso8601:
t structure ptr -> string option

(*Not implemented g_time_val_from_iso8601 argument typeArg_info.InOut or Arg_info.Out not handled*)

