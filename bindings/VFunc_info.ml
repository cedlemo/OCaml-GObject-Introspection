type flags =
  | Must_chain_up     (** chains up to the parent type *)
  | Must_override     (** overrides *)
  | Must_not_override (** does not override *)
  | Throws            (** Includes  a GError *)

let string_of_flags = function
  | Must_chain_up -> "Must_chain_up"
  | Must_override -> "Must_override"
  | Must_not_override -> "Must_not_override"
  | Throws -> "Throws"

module Flags = functor (T : Cstubs.Types.TYPE) -> struct
  let gi_vfunc_must_chain_up = T.constant "GI_VFUNC_MUST_CHAIN_UP" T.int64_t
  let gi_vfunc_must_override = T.constant "GI_VFUNC_MUST_OVERRIDE" T.int64_t
  let gi_vfunc_must_not_override = T.constant "GI_VFUNC_MUST_NOT_OVERRIDE" T.int64_t
  let gi_vfunc_throws = T.constant "GI_VFUNC_THROWS" T.int64_t
  let flags = T.enum "GIVFuncInfoFlags" ~typedef:true [] ~unexpected:(fun x -> x)
end
