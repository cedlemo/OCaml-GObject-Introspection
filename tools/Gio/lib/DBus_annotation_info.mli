open Ctypes

type t
val t_typ : t structure typ

val f_ref_count: (int32, t structure) field
val f_key: (string, t structure) field
val f_value: (string, t structure) field
(*Struct field DBus_annotation_info : C Array type for Types.Array tag tag not implemented*)

val ref:
  t structure ptr -> t structure ptr

val unref:
  t structure ptr -> unit

(*Not implemented g_dbus_annotation_info_lookup argument typeC Array type for Types.Array tag not handled*)
