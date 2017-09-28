open Ctypes

type t
val t_typ : t structure typ
val f_p: (unit ptr, t structure) field
(*TODO Struct field RWLock : C Array type for Types.Array tag tag not implemented*)
val clear:
t structure ptr -> unit

val init:
t structure ptr -> unit

val reader_lock:
t structure ptr -> unit

val reader_trylock:
t structure ptr -> bool

val reader_unlock:
t structure ptr -> unit

val writer_lock:
t structure ptr -> unit

val writer_trylock:
t structure ptr -> bool

val writer_unlock:
t structure ptr -> unit


