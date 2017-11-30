open Ctypes
open Foreign

type t = Eof | Left_paren | Right_paren | Left_curly | Right_curly | Left_brace | Right_brace | Equal_sign | Comma | None | Error | Char | Binary | Octal | Int | Hex | Float | String | Symbol | Identifier | Identifier_null | Comment_single | Comment_multi

let of_value v =
  if v = Unsigned.UInt32.of_int 0 then Eof
  else if v = Unsigned.UInt32.of_int 40 then Left_paren
  else if v = Unsigned.UInt32.of_int 41 then Right_paren
  else if v = Unsigned.UInt32.of_int 123 then Left_curly
  else if v = Unsigned.UInt32.of_int 125 then Right_curly
  else if v = Unsigned.UInt32.of_int 91 then Left_brace
  else if v = Unsigned.UInt32.of_int 93 then Right_brace
  else if v = Unsigned.UInt32.of_int 61 then Equal_sign
  else if v = Unsigned.UInt32.of_int 44 then Comma
  else if v = Unsigned.UInt32.of_int 256 then None
  else if v = Unsigned.UInt32.of_int 257 then Error
  else if v = Unsigned.UInt32.of_int 258 then Char
  else if v = Unsigned.UInt32.of_int 259 then Binary
  else if v = Unsigned.UInt32.of_int 260 then Octal
  else if v = Unsigned.UInt32.of_int 261 then Int
  else if v = Unsigned.UInt32.of_int 262 then Hex
  else if v = Unsigned.UInt32.of_int 263 then Float
  else if v = Unsigned.UInt32.of_int 264 then String
  else if v = Unsigned.UInt32.of_int 265 then Symbol
  else if v = Unsigned.UInt32.of_int 266 then Identifier
  else if v = Unsigned.UInt32.of_int 267 then Identifier_null
  else if v = Unsigned.UInt32.of_int 268 then Comment_single
  else if v = Unsigned.UInt32.of_int 269 then Comment_multi
  else raise (Invalid_argument "Unexpected Token_type value")

let to_value =  function
  | Eof -> Unsigned.UInt32.of_int 0
  | Left_paren -> Unsigned.UInt32.of_int 40
  | Right_paren -> Unsigned.UInt32.of_int 41
  | Left_curly -> Unsigned.UInt32.of_int 123
  | Right_curly -> Unsigned.UInt32.of_int 125
  | Left_brace -> Unsigned.UInt32.of_int 91
  | Right_brace -> Unsigned.UInt32.of_int 93
  | Equal_sign -> Unsigned.UInt32.of_int 61
  | Comma -> Unsigned.UInt32.of_int 44
  | None -> Unsigned.UInt32.of_int 256
  | Error -> Unsigned.UInt32.of_int 257
  | Char -> Unsigned.UInt32.of_int 258
  | Binary -> Unsigned.UInt32.of_int 259
  | Octal -> Unsigned.UInt32.of_int 260
  | Int -> Unsigned.UInt32.of_int 261
  | Hex -> Unsigned.UInt32.of_int 262
  | Float -> Unsigned.UInt32.of_int 263
  | String -> Unsigned.UInt32.of_int 264
  | Symbol -> Unsigned.UInt32.of_int 265
  | Identifier -> Unsigned.UInt32.of_int 266
  | Identifier_null -> Unsigned.UInt32.of_int 267
  | Comment_single -> Unsigned.UInt32.of_int 268
  | Comment_multi -> Unsigned.UInt32.of_int 269

let t_view = view ~read:of_value ~write:to_value uint32_t

