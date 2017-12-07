open Ctypes

type t
val t_typ : t structure typ

val create:
  string -> t structure ptr

val enumerate_namespace:
  t structure ptr -> string -> bool

val enumerate_next:
  t structure ptr -> string

val matches:
  t structure ptr -> string -> bool

val matches_only:
  t structure ptr -> string -> bool

val ref:
  t structure ptr -> t structure ptr

val subtract:
  t structure ptr -> t structure ptr -> t structure ptr

val to_string:
  t structure ptr -> string

val unref:
  t structure ptr -> unit

