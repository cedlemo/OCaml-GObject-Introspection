(** The direction of a Arg_info. *)
type direction =
  | In    (** in argument. *)
  | Out   (** out argument. *)
  | InOut (** in and out argument. *)

module Enums = functor (T : Cstubs.Types.TYPE) -> struct
  let gi_direction_in = T.constant "GI_DIRECTION_IN" T.int64_t
  let gi_direction_out = T.constant "GI_DIRECTION_OUT" T.int64_t
  let gi_direction_inout = T.constant "GI_DIRECTION_INOUT" T.int64_t

  let direction = T.enum "GIDirection" ~typedef:true [
      In, gi_direction_in;
      Out, gi_direction_out;
      InOut, gi_direction_inout;
    ]
      ~unexpected:(fun _x -> assert false)
end
