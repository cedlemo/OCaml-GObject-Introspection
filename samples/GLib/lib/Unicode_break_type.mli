open Ctypes

type t = Mandatory | Carriage_return | Line_feed | Combining_mark | Surrogate | Zero_width_space | Inseparable | Non_breaking_glue | Contingent | Space | After | Before | Before_and_after | Hyphen | Non_starter | Open_punctuation | Close_punctuation | Quotation | Exclamation | Ideographic | Numeric | Infix_separator | Symbol | Alphabetic | Prefix | Postfix | Complex_context | Ambiguous | Unknown | Next_line | Word_joiner | Hangul_l_jamo | Hangul_v_jamo | Hangul_t_jamo | Hangul_lv_syllable | Hangul_lvt_syllable | Close_paranthesis | Conditional_japanese_starter | Hebrew_letter | Regional_indicator | Emoji_base | Emoji_modifier | Zero_width_joiner
val of_value:
Unsigned.uint32 -> t
val to_value:
t -> Unsigned.uint32
val t_view: t typ

