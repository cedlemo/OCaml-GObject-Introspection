(*
 * Copyright 2019 Cedric LE MOIGNE, cedlemo@gmx.com
 * This file is part of OCaml-GObject-Introspection.
 *
 * OCaml-GObject-Introspection is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * any later version.
 *
 * OCaml-GObject-Introspection is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with OCaml-GObject-Introspection.  If not, see <http://www.gnu.org/licenses/>.
 *)

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
