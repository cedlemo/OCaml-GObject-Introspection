open Ctypes
type t
val optionentry : t structure typ
val long_name: (string ptr, t structure) field
val short_name: (int, t structure) field
val flags: (int32, t structure) field
val arg: (, t structure) field
val arg_data: (unit ptr, t structure) field
val description: (string ptr, t structure) field
val arg_description: (string ptr, t structure) field
