open Ctypes

type t
val t_typ : t structure typ

val f_ref_count: (int32, t structure) field
val f_name: (string, t structure) field
(*Struct field DBus_interface_info : C Array type for Types.Array tag tag not implemented*)
(*Struct field DBus_interface_info : C Array type for Types.Array tag tag not implemented*)
(*Struct field DBus_interface_info : C Array type for Types.Array tag tag not implemented*)
(*Struct field DBus_interface_info : C Array type for Types.Array tag tag not implemented*)

val cache_build:
  t structure ptr -> unit

val cache_release:
  t structure ptr -> unit

val generate_xml:
  t structure ptr -> Unsigned.uint32 -> String.t structure ptr -> unit

val lookup_method:
  t structure ptr -> string -> DBus_method_info.t structure ptr

val lookup_property:
  t structure ptr -> string -> DBus_property_info.t structure ptr

val lookup_signal:
  t structure ptr -> string -> DBus_signal_info.t structure ptr

val ref:
  t structure ptr -> t structure ptr

val unref:
  t structure ptr -> unit

