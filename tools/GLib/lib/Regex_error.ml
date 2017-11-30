open Ctypes
open Foreign

type t = Compile | Optimize | Replace | Match | Internal | Stray_backslash | Missing_control_char | Unrecognized_escape | Quantifiers_out_of_order | Quantifier_too_big | Unterminated_character_class | Invalid_escape_in_character_class | Range_out_of_order | Nothing_to_repeat | Unrecognized_character | Posix_named_class_outside_class | Unmatched_parenthesis | Inexistent_subpattern_reference | Unterminated_comment | Expression_too_large | Memory_error | Variable_length_lookbehind | Malformed_condition | Too_many_conditional_branches | Assertion_expected | Unknown_posix_class_name | Posix_collating_elements_not_supported | Hex_code_too_large | Invalid_condition | Single_byte_match_in_lookbehind | Infinite_loop | Missing_subpattern_name_terminator | Duplicate_subpattern_name | Malformed_property | Unknown_property | Subpattern_name_too_long | Too_many_subpatterns | Invalid_octal_value | Too_many_branches_in_define | Define_repetion | Inconsistent_newline_options | Missing_back_reference | Invalid_relative_reference | Backtracking_control_verb_argument_forbidden | Unknown_backtracking_control_verb | Number_too_big | Missing_subpattern_name | Missing_digit | Invalid_data_character | Extra_subpattern_name | Backtracking_control_verb_argument_required | Invalid_control_char | Missing_name | Not_supported_in_class | Too_many_forward_references | Name_too_long | Character_value_too_large

let of_value v =
  if v = Unsigned.UInt32.of_int 0 then Compile
  else if v = Unsigned.UInt32.of_int 1 then Optimize
  else if v = Unsigned.UInt32.of_int 2 then Replace
  else if v = Unsigned.UInt32.of_int 3 then Match
  else if v = Unsigned.UInt32.of_int 4 then Internal
  else if v = Unsigned.UInt32.of_int 101 then Stray_backslash
  else if v = Unsigned.UInt32.of_int 102 then Missing_control_char
  else if v = Unsigned.UInt32.of_int 103 then Unrecognized_escape
  else if v = Unsigned.UInt32.of_int 104 then Quantifiers_out_of_order
  else if v = Unsigned.UInt32.of_int 105 then Quantifier_too_big
  else if v = Unsigned.UInt32.of_int 106 then Unterminated_character_class
  else if v = Unsigned.UInt32.of_int 107 then Invalid_escape_in_character_class
  else if v = Unsigned.UInt32.of_int 108 then Range_out_of_order
  else if v = Unsigned.UInt32.of_int 109 then Nothing_to_repeat
  else if v = Unsigned.UInt32.of_int 112 then Unrecognized_character
  else if v = Unsigned.UInt32.of_int 113 then Posix_named_class_outside_class
  else if v = Unsigned.UInt32.of_int 114 then Unmatched_parenthesis
  else if v = Unsigned.UInt32.of_int 115 then Inexistent_subpattern_reference
  else if v = Unsigned.UInt32.of_int 118 then Unterminated_comment
  else if v = Unsigned.UInt32.of_int 120 then Expression_too_large
  else if v = Unsigned.UInt32.of_int 121 then Memory_error
  else if v = Unsigned.UInt32.of_int 125 then Variable_length_lookbehind
  else if v = Unsigned.UInt32.of_int 126 then Malformed_condition
  else if v = Unsigned.UInt32.of_int 127 then Too_many_conditional_branches
  else if v = Unsigned.UInt32.of_int 128 then Assertion_expected
  else if v = Unsigned.UInt32.of_int 130 then Unknown_posix_class_name
  else if v = Unsigned.UInt32.of_int 131 then Posix_collating_elements_not_supported
  else if v = Unsigned.UInt32.of_int 134 then Hex_code_too_large
  else if v = Unsigned.UInt32.of_int 135 then Invalid_condition
  else if v = Unsigned.UInt32.of_int 136 then Single_byte_match_in_lookbehind
  else if v = Unsigned.UInt32.of_int 140 then Infinite_loop
  else if v = Unsigned.UInt32.of_int 142 then Missing_subpattern_name_terminator
  else if v = Unsigned.UInt32.of_int 143 then Duplicate_subpattern_name
  else if v = Unsigned.UInt32.of_int 146 then Malformed_property
  else if v = Unsigned.UInt32.of_int 147 then Unknown_property
  else if v = Unsigned.UInt32.of_int 148 then Subpattern_name_too_long
  else if v = Unsigned.UInt32.of_int 149 then Too_many_subpatterns
  else if v = Unsigned.UInt32.of_int 151 then Invalid_octal_value
  else if v = Unsigned.UInt32.of_int 154 then Too_many_branches_in_define
  else if v = Unsigned.UInt32.of_int 155 then Define_repetion
  else if v = Unsigned.UInt32.of_int 156 then Inconsistent_newline_options
  else if v = Unsigned.UInt32.of_int 157 then Missing_back_reference
  else if v = Unsigned.UInt32.of_int 158 then Invalid_relative_reference
  else if v = Unsigned.UInt32.of_int 159 then Backtracking_control_verb_argument_forbidden
  else if v = Unsigned.UInt32.of_int 160 then Unknown_backtracking_control_verb
  else if v = Unsigned.UInt32.of_int 161 then Number_too_big
  else if v = Unsigned.UInt32.of_int 162 then Missing_subpattern_name
  else if v = Unsigned.UInt32.of_int 163 then Missing_digit
  else if v = Unsigned.UInt32.of_int 164 then Invalid_data_character
  else if v = Unsigned.UInt32.of_int 165 then Extra_subpattern_name
  else if v = Unsigned.UInt32.of_int 166 then Backtracking_control_verb_argument_required
  else if v = Unsigned.UInt32.of_int 168 then Invalid_control_char
  else if v = Unsigned.UInt32.of_int 169 then Missing_name
  else if v = Unsigned.UInt32.of_int 171 then Not_supported_in_class
  else if v = Unsigned.UInt32.of_int 172 then Too_many_forward_references
  else if v = Unsigned.UInt32.of_int 175 then Name_too_long
  else if v = Unsigned.UInt32.of_int 176 then Character_value_too_large
  else raise (Invalid_argument "Unexpected Regex_error value")

let to_value =  function
  | Compile -> Unsigned.UInt32.of_int 0
  | Optimize -> Unsigned.UInt32.of_int 1
  | Replace -> Unsigned.UInt32.of_int 2
  | Match -> Unsigned.UInt32.of_int 3
  | Internal -> Unsigned.UInt32.of_int 4
  | Stray_backslash -> Unsigned.UInt32.of_int 101
  | Missing_control_char -> Unsigned.UInt32.of_int 102
  | Unrecognized_escape -> Unsigned.UInt32.of_int 103
  | Quantifiers_out_of_order -> Unsigned.UInt32.of_int 104
  | Quantifier_too_big -> Unsigned.UInt32.of_int 105
  | Unterminated_character_class -> Unsigned.UInt32.of_int 106
  | Invalid_escape_in_character_class -> Unsigned.UInt32.of_int 107
  | Range_out_of_order -> Unsigned.UInt32.of_int 108
  | Nothing_to_repeat -> Unsigned.UInt32.of_int 109
  | Unrecognized_character -> Unsigned.UInt32.of_int 112
  | Posix_named_class_outside_class -> Unsigned.UInt32.of_int 113
  | Unmatched_parenthesis -> Unsigned.UInt32.of_int 114
  | Inexistent_subpattern_reference -> Unsigned.UInt32.of_int 115
  | Unterminated_comment -> Unsigned.UInt32.of_int 118
  | Expression_too_large -> Unsigned.UInt32.of_int 120
  | Memory_error -> Unsigned.UInt32.of_int 121
  | Variable_length_lookbehind -> Unsigned.UInt32.of_int 125
  | Malformed_condition -> Unsigned.UInt32.of_int 126
  | Too_many_conditional_branches -> Unsigned.UInt32.of_int 127
  | Assertion_expected -> Unsigned.UInt32.of_int 128
  | Unknown_posix_class_name -> Unsigned.UInt32.of_int 130
  | Posix_collating_elements_not_supported -> Unsigned.UInt32.of_int 131
  | Hex_code_too_large -> Unsigned.UInt32.of_int 134
  | Invalid_condition -> Unsigned.UInt32.of_int 135
  | Single_byte_match_in_lookbehind -> Unsigned.UInt32.of_int 136
  | Infinite_loop -> Unsigned.UInt32.of_int 140
  | Missing_subpattern_name_terminator -> Unsigned.UInt32.of_int 142
  | Duplicate_subpattern_name -> Unsigned.UInt32.of_int 143
  | Malformed_property -> Unsigned.UInt32.of_int 146
  | Unknown_property -> Unsigned.UInt32.of_int 147
  | Subpattern_name_too_long -> Unsigned.UInt32.of_int 148
  | Too_many_subpatterns -> Unsigned.UInt32.of_int 149
  | Invalid_octal_value -> Unsigned.UInt32.of_int 151
  | Too_many_branches_in_define -> Unsigned.UInt32.of_int 154
  | Define_repetion -> Unsigned.UInt32.of_int 155
  | Inconsistent_newline_options -> Unsigned.UInt32.of_int 156
  | Missing_back_reference -> Unsigned.UInt32.of_int 157
  | Invalid_relative_reference -> Unsigned.UInt32.of_int 158
  | Backtracking_control_verb_argument_forbidden -> Unsigned.UInt32.of_int 159
  | Unknown_backtracking_control_verb -> Unsigned.UInt32.of_int 160
  | Number_too_big -> Unsigned.UInt32.of_int 161
  | Missing_subpattern_name -> Unsigned.UInt32.of_int 162
  | Missing_digit -> Unsigned.UInt32.of_int 163
  | Invalid_data_character -> Unsigned.UInt32.of_int 164
  | Extra_subpattern_name -> Unsigned.UInt32.of_int 165
  | Backtracking_control_verb_argument_required -> Unsigned.UInt32.of_int 166
  | Invalid_control_char -> Unsigned.UInt32.of_int 168
  | Missing_name -> Unsigned.UInt32.of_int 169
  | Not_supported_in_class -> Unsigned.UInt32.of_int 171
  | Too_many_forward_references -> Unsigned.UInt32.of_int 172
  | Name_too_long -> Unsigned.UInt32.of_int 175
  | Character_value_too_large -> Unsigned.UInt32.of_int 176

let t_view = view ~read:of_value ~write:to_value uint32_t

