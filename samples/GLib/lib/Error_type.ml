open Ctypes
open Foreign

type t = Unknown | Unexp_eof | Unexp_eof_in_string | Unexp_eof_in_comment | Non_digit_in_const | Digit_radix | Float_radix | Float_malformed
let of_value v =
if v = Unsigned.UInt32.of_int 0 then Unknown
else if v = Unsigned.UInt32.of_int 1 then Unexp_eof
else if v = Unsigned.UInt32.of_int 2 then Unexp_eof_in_string
else if v = Unsigned.UInt32.of_int 3 then Unexp_eof_in_comment
else if v = Unsigned.UInt32.of_int 4 then Non_digit_in_const
else if v = Unsigned.UInt32.of_int 5 then Digit_radix
else if v = Unsigned.UInt32.of_int 6 then Float_radix
else if v = Unsigned.UInt32.of_int 7 then Float_malformed
else raise (Invalid_argument "Unexpected Error_type value")
let to_value = function
| Unknown -> Unsigned.UInt32.of_int 0
| Unexp_eof -> Unsigned.UInt32.of_int 1
| Unexp_eof_in_string -> Unsigned.UInt32.of_int 2
| Unexp_eof_in_comment -> Unsigned.UInt32.of_int 3
| Non_digit_in_const -> Unsigned.UInt32.of_int 4
| Digit_radix -> Unsigned.UInt32.of_int 5
| Float_radix -> Unsigned.UInt32.of_int 6
| Float_malformed -> Unsigned.UInt32.of_int 7
let t_view = view 
~read:of_value 
~write:to_value 
uint32_t

