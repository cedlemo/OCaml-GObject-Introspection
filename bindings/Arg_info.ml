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

(** The transfer is the exchange of data between two parts, from the callee to
    the caller. The callee is either a function/method/signal or an
    object/interface where a property is defined. The caller is the side
    accessing a property or calling a function. GITransfer specifies who's
    responsible for freeing the resources after the ownership transfer is
    complete. In case of a containing type such as a list, an array or a hash
    table the container itself is specified differently from the items within
    the container itself. Each container is freed differently, check the
    documentation for the types themselves for information on how to free them.*)
type transfer =
  | Nothing    (** transfer nothing from the callee (function or the type
                   instance the property belongs to) to the caller. The callee
                   retains the ownership of the transfer and the caller doesn't
                   need to do anything to free up the resources of this transfer. *)
  | Container  (** transfer the container (list, array, hash table) from the
                   callee to the caller. The callee retains the ownership of
                   the individual items in the container and the caller has to
                   free up the container resources (g_list_free()/
                   g_hash_table_destroy() etc) of this transfer. *)
  | Everything (** transfer everything, eg the container and its contents from
                   the callee to the caller. This is the case when the callee
                   creates a copy of all the data it returns. The caller is
                   responsible for cleaning up the container and item resources
                   of this transfer. *)

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

  let gi_transfer_nothing = T.constant "GI_TRANSFER_NOTHING" T.int64_t
  let gi_transfer_container = T.constant "GI_TRANSFER_CONTAINER" T.int64_t
  let gi_transfer_everything = T.constant "GI_TRANSFER_EVERYTHING" T.int64_t

  let transfer = T.enum "GITransfer" ~typedef:true [
      Nothing, gi_transfer_nothing;
      Container, gi_transfer_container;
      Everything, gi_transfer_everything;
    ]
end
