(** Flags for a Function_info struct. *)
type flags =
  | Is_method      (** is a method. *)
  | Is_constructor (** is a constructor. *)
  | Is_getter      (** is a getter of a Property_info. *)
  | Is_setter      (** is a setter of a Property_info. *)
  | Wraps_vfunc    (** represents a virtual function. *)
  | Throws         (** the function may throw an error. *)

module Flags = functor (T : Cstubs.Types.TYPE) -> struct
  let gi_function_is_method = T.constant "GI_FUNCTION_IS_METHOD" T.int64_t
  let gi_function_is_constructor = T.constant "GI_FUNCTION_IS_CONSTRUCTOR" T.int64_t
  let gi_function_is_getter = T.constant "GI_FUNCTION_IS_GETTER" T.int64_t
  let gi_function_is_setter = T.constant "GI_FUNCTION_IS_SETTER" T.int64_t
  let gi_function_wraps_vfunc = T.constant "GI_FUNCTION_WRAPS_VFUNC" T.int64_t
  let gi_function_throws = T.constant "GI_FUNCTION_THROWS" T.int64_t
  let flags = T.enum "GIFunctionInfoFlags" ~typedef:true [] ~unexpected:(fun x -> x)
end
