open Ctypes
open Foreign

type t = Mandatory | Carriage_return | Line_feed | Combining_mark | Surrogate | Zero_width_space | Inseparable | Non_breaking_glue | Contingent | Space | After | Before | Before_and_after | Hyphen | Non_starter | Open_punctuation | Close_punctuation | Quotation | Exclamation | Ideographic | Numeric | Infix_separator | Symbol | Alphabetic | Prefix | Postfix | Complex_context | Ambiguous | Unknown | Next_line | Word_joiner | Hangul_l_jamo | Hangul_v_jamo | Hangul_t_jamo | Hangul_lv_syllable | Hangul_lvt_syllable | Close_paranthesis | Conditional_japanese_starter | Hebrew_letter | Regional_indicator | Emoji_base | Emoji_modifier | Zero_width_joiner

let of_value v =
  if v = Unsigned.UInt32.of_int 0 then Mandatory
  else if v = Unsigned.UInt32.of_int 1 then Carriage_return
  else if v = Unsigned.UInt32.of_int 2 then Line_feed
  else if v = Unsigned.UInt32.of_int 3 then Combining_mark
  else if v = Unsigned.UInt32.of_int 4 then Surrogate
  else if v = Unsigned.UInt32.of_int 5 then Zero_width_space
  else if v = Unsigned.UInt32.of_int 6 then Inseparable
  else if v = Unsigned.UInt32.of_int 7 then Non_breaking_glue
  else if v = Unsigned.UInt32.of_int 8 then Contingent
  else if v = Unsigned.UInt32.of_int 9 then Space
  else if v = Unsigned.UInt32.of_int 10 then After
  else if v = Unsigned.UInt32.of_int 11 then Before
  else if v = Unsigned.UInt32.of_int 12 then Before_and_after
  else if v = Unsigned.UInt32.of_int 13 then Hyphen
  else if v = Unsigned.UInt32.of_int 14 then Non_starter
  else if v = Unsigned.UInt32.of_int 15 then Open_punctuation
  else if v = Unsigned.UInt32.of_int 16 then Close_punctuation
  else if v = Unsigned.UInt32.of_int 17 then Quotation
  else if v = Unsigned.UInt32.of_int 18 then Exclamation
  else if v = Unsigned.UInt32.of_int 19 then Ideographic
  else if v = Unsigned.UInt32.of_int 20 then Numeric
  else if v = Unsigned.UInt32.of_int 21 then Infix_separator
  else if v = Unsigned.UInt32.of_int 22 then Symbol
  else if v = Unsigned.UInt32.of_int 23 then Alphabetic
  else if v = Unsigned.UInt32.of_int 24 then Prefix
  else if v = Unsigned.UInt32.of_int 25 then Postfix
  else if v = Unsigned.UInt32.of_int 26 then Complex_context
  else if v = Unsigned.UInt32.of_int 27 then Ambiguous
  else if v = Unsigned.UInt32.of_int 28 then Unknown
  else if v = Unsigned.UInt32.of_int 29 then Next_line
  else if v = Unsigned.UInt32.of_int 30 then Word_joiner
  else if v = Unsigned.UInt32.of_int 31 then Hangul_l_jamo
  else if v = Unsigned.UInt32.of_int 32 then Hangul_v_jamo
  else if v = Unsigned.UInt32.of_int 33 then Hangul_t_jamo
  else if v = Unsigned.UInt32.of_int 34 then Hangul_lv_syllable
  else if v = Unsigned.UInt32.of_int 35 then Hangul_lvt_syllable
  else if v = Unsigned.UInt32.of_int 36 then Close_paranthesis
  else if v = Unsigned.UInt32.of_int 37 then Conditional_japanese_starter
  else if v = Unsigned.UInt32.of_int 38 then Hebrew_letter
  else if v = Unsigned.UInt32.of_int 39 then Regional_indicator
  else if v = Unsigned.UInt32.of_int 40 then Emoji_base
  else if v = Unsigned.UInt32.of_int 41 then Emoji_modifier
  else if v = Unsigned.UInt32.of_int 42 then Zero_width_joiner
  else raise (Invalid_argument "Unexpected Unicode_break_type value")

let to_value =  function
  | Mandatory -> Unsigned.UInt32.of_int 0
  | Carriage_return -> Unsigned.UInt32.of_int 1
  | Line_feed -> Unsigned.UInt32.of_int 2
  | Combining_mark -> Unsigned.UInt32.of_int 3
  | Surrogate -> Unsigned.UInt32.of_int 4
  | Zero_width_space -> Unsigned.UInt32.of_int 5
  | Inseparable -> Unsigned.UInt32.of_int 6
  | Non_breaking_glue -> Unsigned.UInt32.of_int 7
  | Contingent -> Unsigned.UInt32.of_int 8
  | Space -> Unsigned.UInt32.of_int 9
  | After -> Unsigned.UInt32.of_int 10
  | Before -> Unsigned.UInt32.of_int 11
  | Before_and_after -> Unsigned.UInt32.of_int 12
  | Hyphen -> Unsigned.UInt32.of_int 13
  | Non_starter -> Unsigned.UInt32.of_int 14
  | Open_punctuation -> Unsigned.UInt32.of_int 15
  | Close_punctuation -> Unsigned.UInt32.of_int 16
  | Quotation -> Unsigned.UInt32.of_int 17
  | Exclamation -> Unsigned.UInt32.of_int 18
  | Ideographic -> Unsigned.UInt32.of_int 19
  | Numeric -> Unsigned.UInt32.of_int 20
  | Infix_separator -> Unsigned.UInt32.of_int 21
  | Symbol -> Unsigned.UInt32.of_int 22
  | Alphabetic -> Unsigned.UInt32.of_int 23
  | Prefix -> Unsigned.UInt32.of_int 24
  | Postfix -> Unsigned.UInt32.of_int 25
  | Complex_context -> Unsigned.UInt32.of_int 26
  | Ambiguous -> Unsigned.UInt32.of_int 27
  | Unknown -> Unsigned.UInt32.of_int 28
  | Next_line -> Unsigned.UInt32.of_int 29
  | Word_joiner -> Unsigned.UInt32.of_int 30
  | Hangul_l_jamo -> Unsigned.UInt32.of_int 31
  | Hangul_v_jamo -> Unsigned.UInt32.of_int 32
  | Hangul_t_jamo -> Unsigned.UInt32.of_int 33
  | Hangul_lv_syllable -> Unsigned.UInt32.of_int 34
  | Hangul_lvt_syllable -> Unsigned.UInt32.of_int 35
  | Close_paranthesis -> Unsigned.UInt32.of_int 36
  | Conditional_japanese_starter -> Unsigned.UInt32.of_int 37
  | Hebrew_letter -> Unsigned.UInt32.of_int 38
  | Regional_indicator -> Unsigned.UInt32.of_int 39
  | Emoji_base -> Unsigned.UInt32.of_int 40
  | Emoji_modifier -> Unsigned.UInt32.of_int 41
  | Zero_width_joiner -> Unsigned.UInt32.of_int 42

let t_view = view ~read:of_value ~write:to_value uint32_t

