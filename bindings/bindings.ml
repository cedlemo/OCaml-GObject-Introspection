open Ctypes

type baseinfo_type =
  | Invalid (** invalid type *)
  | Function (** function, see Function_info *)
  | Callback (** callback, see Function_info *)
  | Struct (** struct, see Struct_info *)
  | Boxed (** boxed, see Struct_info or Union_info *)
  | Enum (** enum, see Enum_info *)
  | Flags (** flags, see Enum_info *)
  | Object (** object, see Object_info *)
  | Interface (** interface, see Interface_info *)
  | Constant (** contant, see Constant_info *)
  | Invalid_0 (** deleted, used to be GI_INFO_TYPE_ERROR_DOMAIN. *)
  | Union (** union, see Union_info *)
  | Value (** enum value, see Value_info *)
  | Signal (** signal, see Signal_info *)
  | Vfunc (** virtual function, see VFunc_info *)
  | Property (** GObject property, see Property_info *)
  | Field (** struct or union field, see Field_info *)
  | Arg (** argument of a function or callback, see Arg_info *)
  | Type (** type information, see Type_info *)
  | Unresolved (** unresolved type, a type which is not present in the typelib, or any of its dependencies. *)

let string_of_baseinfo_type = function
  | Invalid -> "Invalid"
  | Function -> "Function"
  | Callback -> "Callback"
  | Struct -> "Struct"
  | Boxed -> "Boxed"
  | Enum -> "Enum"
  | Flags -> "Flags"
  | Object -> "Object"
  | Interface -> "Interface"
  | Constant -> "Constant"
  | Invalid_0 -> "Invalid_0"
  | Union -> "Union"
  | Value -> "Value"
  | Signal -> "Signal"
  | Vfunc -> "Vfunc"
  | Property -> "Property"
  | Field -> "Field"
  | Arg -> "Arg"
  | Type -> "Type"
  | Unresolved -> "Unresolved "

(** The type tag of a Type_info. *)
type type_tag =
  | Void (** void *)
  | Boolean (** boolean *)
  | Int8 (** 8-bit signed integer *)
  | Uint8 (** 8-bit unsigned integer *)
  | Int16 (** 16-bit signed integer *)
  | Uint16 (** 16-bit unsigned integer *)
  | Int32 (** 32-bit signed integer *)
  | Uint32 (** 32-bit unsigned integer *)
  | Int64 (** 64-bit signed integer *)
  | Uint64 (** 64-bit unsigned integer *)
  | Float (** float *)
  | Double (** double floating point *)
  | GType (** a GType *)
  | Utf8 (** a UTF-8 encoded string *)
  | Filename (** a filename, encoded in the same encoding as the native filesystem is using. *)
  | Array (** an array *)
  | Interface (** an extended interface object *)
  | GList (** a GList *)
  | GSList (** a GSList *)
  | GHash (** a GHashTable *)
  | Error (** a GError *)
  | Unichar (** Unicode character *)

(** The type of array in a GITypeInfo. *)
type array_type =
  | C          (** a C array, char[] for instance *)
  | Array      (** a GArray array *)
  | Ptr_array  (** a GPtrArray array *)
  | Byte_array (** a GByteArray array *)

(** Flags for a Function_info struct. *)
type flags =
  | Is_method      (** is a method. *)
  | Is_constructor (** is a constructor. *)
  | Is_getter      (** is a getter of a Property_info. *)
  | Is_setter      (** is a setter of a Property_info. *)
  | Wraps_vfunc    (** represents a virtual function. *)
  | Throws         (** the function may throw an error. *)

module Enums = functor (T : Cstubs.Types.TYPE) -> struct
  let gi_info_type_invalid = T.constant "GI_INFO_TYPE_INVALID" T.int64_t
  let gi_info_type_function = T.constant "GI_INFO_TYPE_FUNCTION" T.int64_t
  let gi_info_type_callback = T.constant "GI_INFO_TYPE_CALLBACK" T.int64_t
  let gi_info_type_struct = T.constant "GI_INFO_TYPE_STRUCT" T.int64_t
  let gi_info_type_boxed = T.constant "GI_INFO_TYPE_BOXED" T.int64_t
  let gi_info_type_enum = T.constant "GI_INFO_TYPE_ENUM" T.int64_t
  let gi_info_type_flags = T.constant "GI_INFO_TYPE_FLAGS" T.int64_t
  let gi_info_type_object = T.constant "GI_INFO_TYPE_OBJECT" T.int64_t
  let gi_info_type_interface = T.constant "GI_INFO_TYPE_INTERFACE" T.int64_t
  let gi_info_type_constant = T.constant "GI_INFO_TYPE_CONSTANT" T.int64_t
  let gi_info_type_invalid_0 = T.constant "GI_INFO_TYPE_INVALID_0" T.int64_t
  let gi_info_type_union = T.constant "GI_INFO_TYPE_UNION" T.int64_t
  let gi_info_type_value = T.constant "GI_INFO_TYPE_VALUE" T.int64_t
  let gi_info_type_signal = T.constant "GI_INFO_TYPE_SIGNAL" T.int64_t
  let gi_info_type_vfunc = T.constant "GI_INFO_TYPE_VFUNC" T.int64_t
  let gi_info_type_property = T.constant "GI_INFO_TYPE_PROPERTY" T.int64_t
  let gi_info_type_field = T.constant "GI_INFO_TYPE_FIELD" T.int64_t
  let gi_info_type_arg = T.constant "GI_INFO_TYPE_ARG" T.int64_t
  let gi_info_type_type = T.constant "GI_INFO_TYPE_TYPE" T.int64_t
  let gi_info_type_unresolved = T.constant "GI_INFO_TYPE_UNRESOLVED" T.int64_t

  let baseinfo_type = T.enum "GIInfoType" ~typedef:true [
      Invalid, gi_info_type_invalid;
      Function, gi_info_type_function;
      Callback, gi_info_type_callback;
      Struct, gi_info_type_struct;
      Boxed, gi_info_type_boxed;
      Enum, gi_info_type_enum;
      Flags, gi_info_type_flags;
      Object, gi_info_type_object;
      Interface, gi_info_type_interface;
      Constant, gi_info_type_constant;
      Invalid_0, gi_info_type_invalid_0;
      Union, gi_info_type_union;
      Value, gi_info_type_value;
      Signal, gi_info_type_signal;
      Vfunc, gi_info_type_vfunc;
      Property, gi_info_type_property;
      Field, gi_info_type_field;
      Arg, gi_info_type_arg;
      Type, gi_info_type_type;
      Unresolved, gi_info_type_unresolved;
    ]
      ~unexpected:(fun _x -> assert false)

  let gi_type_tag_void = T.constant "GI_TYPE_TAG_VOID" T.int64_t
  let gi_type_tag_boolean = T.constant "GI_TYPE_TAG_BOOLEAN" T.int64_t
  let gi_type_tag_int8 = T.constant "GI_TYPE_TAG_INT8" T.int64_t
  let gi_type_tag_uint8 = T.constant "GI_TYPE_TAG_UINT8" T.int64_t
  let gi_type_tag_int16 = T.constant "GI_TYPE_TAG_INT16" T.int64_t
  let gi_type_tag_uint16 = T.constant "GI_TYPE_TAG_UINT16" T.int64_t
  let gi_type_tag_int32 = T.constant "GI_TYPE_TAG_INT32" T.int64_t
  let gi_type_tag_uint32 = T.constant "GI_TYPE_TAG_UINT32" T.int64_t
  let gi_type_tag_int64 = T.constant "GI_TYPE_TAG_INT64" T.int64_t
  let gi_type_tag_uint64 = T.constant "GI_TYPE_TAG_UINT64" T.int64_t
  let gi_type_tag_float = T.constant "GI_TYPE_TAG_FLOAT" T.int64_t
  let gi_type_tag_double = T.constant "GI_TYPE_TAG_DOUBLE" T.int64_t
  let gi_type_tag_gtype = T.constant "GI_TYPE_TAG_GTYPE" T.int64_t
  let gi_type_tag_utf8 = T.constant "GI_TYPE_TAG_UTF8" T.int64_t
  let gi_type_tag_filename = T.constant "GI_TYPE_TAG_FILENAME" T.int64_t
  let gi_type_tag_array = T.constant "GI_TYPE_TAG_ARRAY" T.int64_t
  let gi_type_tag_interface = T.constant "GI_TYPE_TAG_INTERFACE" T.int64_t
  let gi_type_tag_glist = T.constant "GI_TYPE_TAG_GLIST" T.int64_t
  let gi_type_tag_gslist = T.constant "GI_TYPE_TAG_GSLIST" T.int64_t
  let gi_type_tag_ghash = T.constant "GI_TYPE_TAG_GHASH" T.int64_t
  let gi_type_tag_error = T.constant "GI_TYPE_TAG_ERROR" T.int64_t
  let gi_type_tag_unichar = T.constant "GI_TYPE_TAG_UNICHAR" T.int64_t

  let type_tag = T.enum "GITypeTag" ~typedef:true [
      Void, gi_type_tag_void;
      Boolean, gi_type_tag_boolean;
      Int8, gi_type_tag_int8;
      Uint8, gi_type_tag_uint8;
      Int16, gi_type_tag_int16;
      Uint16, gi_type_tag_uint16;
      Int32, gi_type_tag_int32;
      Uint32, gi_type_tag_uint32;
      Int64, gi_type_tag_int64;
      Uint64, gi_type_tag_uint64;
      Float, gi_type_tag_float;
      Double, gi_type_tag_double;
      GType, gi_type_tag_gtype;
      Utf8, gi_type_tag_utf8;
      Filename, gi_type_tag_filename;
      Array, gi_type_tag_array;
      Interface, gi_type_tag_interface;
      GList, gi_type_tag_glist;
      GSList, gi_type_tag_gslist;
      GHash, gi_type_tag_ghash;
      Error, gi_type_tag_error;
      Unichar, gi_type_tag_unichar;
    ]
      ~unexpected:(fun _x -> assert false)

  let gi_array_type_c = T.constant "GI_ARRAY_TYPE_C" T.int64_t
  let gi_array_type_array = T.constant "GI_ARRAY_TYPE_ARRAY" T.int64_t
  let gi_array_type_ptr_array = T.constant "GI_ARRAY_TYPE_PTR_ARRAY" T.int64_t
  let gi_array_type_byte_array = T.constant "GI_ARRAY_TYPE_BYTE_ARRAY" T.int64_t

  let array_type = T.enum "GIArrayType" ~typedef:true [
      C, gi_array_type_c;
      Array,  gi_array_type_array;
      Ptr_array, gi_array_type_ptr_array;
      Byte_array, gi_array_type_byte_array;
    ]
      ~unexpected:(fun _x -> assert false)

  let gi_function_is_method = T.constant "GI_FUNCTION_IS_METHOD" T.int64_t
  let gi_function_is_constructor = T.constant "GI_FUNCTION_IS_CONSTRUCTOR" T.int64_t
  let gi_function_is_getter = T.constant "GI_FUNCTION_IS_GETTER" T.int64_t
  let gi_function_is_setter = T.constant "GI_FUNCTION_IS_SETTER" T.int64_t
  let gi_function_wraps_vfunc = T.constant "GI_FUNCTION_WRAPS_VFUNC" T.int64_t
  let gi_function_throws = T.constant "GI_FUNCTION_THROWS" T.int64_t
  let flags = T.enum "GIFunctionInfoFlags" ~typedef:true [] ~unexpected:(fun x -> x)
end
