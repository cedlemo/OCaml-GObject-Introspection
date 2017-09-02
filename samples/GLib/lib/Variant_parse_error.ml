open Ctypes
open Foreign

type t = Failed | Basic_type_expected | Cannot_infer_type | Definite_type_expected | Input_not_at_end | Invalid_character | Invalid_format_string | Invalid_object_path | Invalid_signature | Invalid_type_string | No_common_type | Number_out_of_range | Number_too_big | Type_error | Unexpected_token | Unknown_keyword | Unterminated_string_constant | Value_expected
let of_value v =
if v = Unsigned.UInt32.of_int 0 then Failed
else if v = Unsigned.UInt32.of_int 1 then Basic_type_expected
else if v = Unsigned.UInt32.of_int 2 then Cannot_infer_type
else if v = Unsigned.UInt32.of_int 3 then Definite_type_expected
else if v = Unsigned.UInt32.of_int 4 then Input_not_at_end
else if v = Unsigned.UInt32.of_int 5 then Invalid_character
else if v = Unsigned.UInt32.of_int 6 then Invalid_format_string
else if v = Unsigned.UInt32.of_int 7 then Invalid_object_path
else if v = Unsigned.UInt32.of_int 8 then Invalid_signature
else if v = Unsigned.UInt32.of_int 9 then Invalid_type_string
else if v = Unsigned.UInt32.of_int 10 then No_common_type
else if v = Unsigned.UInt32.of_int 11 then Number_out_of_range
else if v = Unsigned.UInt32.of_int 12 then Number_too_big
else if v = Unsigned.UInt32.of_int 13 then Type_error
else if v = Unsigned.UInt32.of_int 14 then Unexpected_token
else if v = Unsigned.UInt32.of_int 15 then Unknown_keyword
else if v = Unsigned.UInt32.of_int 16 then Unterminated_string_constant
else if v = Unsigned.UInt32.of_int 17 then Value_expected
else raise (Invalid_argument "Unexpected Variant_parse_error value")
let to_value = function
| Failed -> Unsigned.UInt32.of_int 0
| Basic_type_expected -> Unsigned.UInt32.of_int 1
| Cannot_infer_type -> Unsigned.UInt32.of_int 2
| Definite_type_expected -> Unsigned.UInt32.of_int 3
| Input_not_at_end -> Unsigned.UInt32.of_int 4
| Invalid_character -> Unsigned.UInt32.of_int 5
| Invalid_format_string -> Unsigned.UInt32.of_int 6
| Invalid_object_path -> Unsigned.UInt32.of_int 7
| Invalid_signature -> Unsigned.UInt32.of_int 8
| Invalid_type_string -> Unsigned.UInt32.of_int 9
| No_common_type -> Unsigned.UInt32.of_int 10
| Number_out_of_range -> Unsigned.UInt32.of_int 11
| Number_too_big -> Unsigned.UInt32.of_int 12
| Type_error -> Unsigned.UInt32.of_int 13
| Unexpected_token -> Unsigned.UInt32.of_int 14
| Unknown_keyword -> Unsigned.UInt32.of_int 15
| Unterminated_string_constant -> Unsigned.UInt32.of_int 16
| Value_expected -> Unsigned.UInt32.of_int 17
let t_view = view 
~read:of_value 
~write:to_value 
uint32_t

