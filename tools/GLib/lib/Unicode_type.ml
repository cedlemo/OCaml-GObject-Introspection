open Ctypes
open Foreign

type t = Control | Format | Unassigned | Private_use | Surrogate | Lowercase_letter | Modifier_letter | Other_letter | Titlecase_letter | Uppercase_letter | Spacing_mark | Enclosing_mark | Non_spacing_mark | Decimal_number | Letter_number | Other_number | Connect_punctuation | Dash_punctuation | Close_punctuation | Final_punctuation | Initial_punctuation | Other_punctuation | Open_punctuation | Currency_symbol | Modifier_symbol | Math_symbol | Other_symbol | Line_separator | Paragraph_separator | Space_separator

let of_value v =
  if v = Unsigned.UInt32.of_int 0 then Control
  else if v = Unsigned.UInt32.of_int 1 then Format
  else if v = Unsigned.UInt32.of_int 2 then Unassigned
  else if v = Unsigned.UInt32.of_int 3 then Private_use
  else if v = Unsigned.UInt32.of_int 4 then Surrogate
  else if v = Unsigned.UInt32.of_int 5 then Lowercase_letter
  else if v = Unsigned.UInt32.of_int 6 then Modifier_letter
  else if v = Unsigned.UInt32.of_int 7 then Other_letter
  else if v = Unsigned.UInt32.of_int 8 then Titlecase_letter
  else if v = Unsigned.UInt32.of_int 9 then Uppercase_letter
  else if v = Unsigned.UInt32.of_int 10 then Spacing_mark
  else if v = Unsigned.UInt32.of_int 11 then Enclosing_mark
  else if v = Unsigned.UInt32.of_int 12 then Non_spacing_mark
  else if v = Unsigned.UInt32.of_int 13 then Decimal_number
  else if v = Unsigned.UInt32.of_int 14 then Letter_number
  else if v = Unsigned.UInt32.of_int 15 then Other_number
  else if v = Unsigned.UInt32.of_int 16 then Connect_punctuation
  else if v = Unsigned.UInt32.of_int 17 then Dash_punctuation
  else if v = Unsigned.UInt32.of_int 18 then Close_punctuation
  else if v = Unsigned.UInt32.of_int 19 then Final_punctuation
  else if v = Unsigned.UInt32.of_int 20 then Initial_punctuation
  else if v = Unsigned.UInt32.of_int 21 then Other_punctuation
  else if v = Unsigned.UInt32.of_int 22 then Open_punctuation
  else if v = Unsigned.UInt32.of_int 23 then Currency_symbol
  else if v = Unsigned.UInt32.of_int 24 then Modifier_symbol
  else if v = Unsigned.UInt32.of_int 25 then Math_symbol
  else if v = Unsigned.UInt32.of_int 26 then Other_symbol
  else if v = Unsigned.UInt32.of_int 27 then Line_separator
  else if v = Unsigned.UInt32.of_int 28 then Paragraph_separator
  else if v = Unsigned.UInt32.of_int 29 then Space_separator
  else raise (Invalid_argument "Unexpected Unicode_type value")

let to_value = function
  | Control -> Unsigned.UInt32.of_int 0
  | Format -> Unsigned.UInt32.of_int 1
  | Unassigned -> Unsigned.UInt32.of_int 2
  | Private_use -> Unsigned.UInt32.of_int 3
  | Surrogate -> Unsigned.UInt32.of_int 4
  | Lowercase_letter -> Unsigned.UInt32.of_int 5
  | Modifier_letter -> Unsigned.UInt32.of_int 6
  | Other_letter -> Unsigned.UInt32.of_int 7
  | Titlecase_letter -> Unsigned.UInt32.of_int 8
  | Uppercase_letter -> Unsigned.UInt32.of_int 9
  | Spacing_mark -> Unsigned.UInt32.of_int 10
  | Enclosing_mark -> Unsigned.UInt32.of_int 11
  | Non_spacing_mark -> Unsigned.UInt32.of_int 12
  | Decimal_number -> Unsigned.UInt32.of_int 13
  | Letter_number -> Unsigned.UInt32.of_int 14
  | Other_number -> Unsigned.UInt32.of_int 15
  | Connect_punctuation -> Unsigned.UInt32.of_int 16
  | Dash_punctuation -> Unsigned.UInt32.of_int 17
  | Close_punctuation -> Unsigned.UInt32.of_int 18
  | Final_punctuation -> Unsigned.UInt32.of_int 19
  | Initial_punctuation -> Unsigned.UInt32.of_int 20
  | Other_punctuation -> Unsigned.UInt32.of_int 21
  | Open_punctuation -> Unsigned.UInt32.of_int 22
  | Currency_symbol -> Unsigned.UInt32.of_int 23
  | Modifier_symbol -> Unsigned.UInt32.of_int 24
  | Math_symbol -> Unsigned.UInt32.of_int 25
  | Other_symbol -> Unsigned.UInt32.of_int 26
  | Line_separator -> Unsigned.UInt32.of_int 27
  | Paragraph_separator -> Unsigned.UInt32.of_int 28
  | Space_separator -> Unsigned.UInt32.of_int 29

let t_view = view ~read:of_value ~write:to_value uint32_t

