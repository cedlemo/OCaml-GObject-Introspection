open Ctypes
open Foreign
type t
let tokenvalue : t union typ = union "TokenValue"
let v_symbol = field tokenvalue "v_symbol" (ptr void)
let v_identifier = field tokenvalue "v_identifier" (ptr string)
let v_binary = field tokenvalue "v_binary" (uint64_t)
let v_octal = field tokenvalue "v_octal" (uint64_t)
let v_int = field tokenvalue "v_int" (uint64_t)
let v_int64 = field tokenvalue "v_int64" (uint64_t)
let v_float = field tokenvalue "v_float" (double)
let v_hex = field tokenvalue "v_hex" (uint64_t)
let v_string = field tokenvalue "v_string" (ptr string)
let v_comment = field tokenvalue "v_comment" (ptr string)
let v_char = field tokenvalue "v_char" (uint8_t)
let v_error = field tokenvalue "v_error" (uint32_t)
let _ = seal tokenvalue
