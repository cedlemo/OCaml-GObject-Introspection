open Ctypes
open Foreign

type file = {
  name: string;
  descr : Pervasives.out_channel;
}

type files = {
  ml : file;
  mli : file;
}

val parse_invalid_info :
  GIBaseInfo.t structure ptr -> unit

val parse_function_info :
  GIBaseInfo.t structure ptr -> files -> unit

val parse_callback_info :
  GIBaseInfo.t structure ptr -> unit

val parse_struct_info :
  GIBaseInfo.t structure ptr -> unit

val parse_boxed_info :
  GIBaseInfo.t structure ptr -> unit

val parse_enum_info :
  GIBaseInfo.t structure ptr -> unit

val parse_flags_info :
  GIBaseInfo.t structure ptr -> unit

val parse_object_info :
  GIBaseInfo.t structure ptr -> unit

val parse_interface_info :
  GIBaseInfo.t structure ptr -> unit

val parse_constant_info :
  GIBaseInfo.t structure ptr -> files -> unit

val parse_union_info :
  GIBaseInfo.t structure ptr -> unit

val parse_value_info :
  GIBaseInfo.t structure ptr -> unit

val parse_signal_info :
  GIBaseInfo.t structure ptr -> unit

val parse_vfunc_info :
  GIBaseInfo.t structure ptr -> unit

val parse_property_info :
  GIBaseInfo.t structure ptr -> unit

val parse_field_info :
  GIBaseInfo.t structure ptr -> unit

val parse_arg_info :
  GIBaseInfo.t structure ptr -> unit

val parse_type_info :
  GIBaseInfo.t structure ptr -> unit

val parse_unresolved_info :
  GIBaseInfo.t structure ptr -> unit
