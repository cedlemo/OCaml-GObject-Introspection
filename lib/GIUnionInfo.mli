(*
 * Copyright 2017 Cedric LE MOIGNE, cedlemo@gmx.com
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

(** GIUnionInfo — Module representing a C structure *)

open Ctypes

(** GIUnionInfo represents a union type.
    A union has methods and fields. Unions can optionally have a discriminator,
    which is a field deciding what type of real union fields is valid for
    specified instance.*)
type t
val unioninfo : t structure typ

(** Obtain the number of fields this union has. *)
val get_n_fields:
  t structure ptr -> int

(** Obtain the total size of the union. *)
val get_size:
  t structure ptr -> int

(** Obtain the required alignment of the union. *)
val get_alignment:
  t structure ptr -> int

(** Obtain the number of methods this union has. *)
val get_n_methods:
  t structure ptr -> int

(** Obtain the type information for field with specified index. *)
val get_field:
  t structure ptr -> int -> Field_info.t structure ptr

(** Obtain the type information for method with specified index. *)
val get_method:
  t structure ptr -> int -> Function_info.t structure ptr

(** Obtain the type information for method named name .*)
val find_method:
  t structure ptr -> string -> Function_info.t structure ptr option

(** Return true if this union contains discriminator field. *)
val is_discriminated:
  t structure ptr -> bool

(** Returns offset of the discriminator field in the structure. *)
val get_discriminator_offset:
  t structure ptr -> int

(** Obtain the type information of the union discriminator. *)
val get_discriminator_type:
  t structure ptr -> GITypeInfo.t structure ptr

(** Obtain discriminator value assigned for n-th union field, i.e. n-th union
    field is the active one if discriminator contains this constant. *)
val get_discriminator:
  t structure ptr -> int -> Constant_info.t structure ptr

(** Just cast OCaml Ctypes base info to union info. *)
val cast_from_baseinfo:
  Base_info.t structure ptr -> t structure ptr

(** Just cast OCaml Ctypes union info to base info *)
val cast_to_baseinfo:
  t structure ptr -> Base_info.t structure ptr

(** Return a GIUnionInfo.t from a Base_info.t, the underlying C structure
    ref count is increased and the value is Gc.finalis"ed" with
    Base_info.baseinfo_unref. *)
val from_baseinfo:
  Base_info.t structure ptr -> t structure ptr

(** Return a Base_info.t form a GIUnionInfo, the underlying C structure
    ref count is increased and the value is Gc.finalis"ed" with
    Base_info.baseinfo_unref. *)
val to_baseinfo:
  t structure ptr -> Base_info.t structure ptr

(** Just cast OCaml Ctypes registeredtype info to union info. *)
val cast_from_registeredtypeinfo:
  GIRegisteredTypeInfo.t structure ptr -> t structure ptr

(** Just cast OCaml Ctypes union info to registeredtype info *)
val cast_to_registeredtypeinfo:
  t structure ptr -> GIRegisteredTypeInfo.t structure ptr

(** Return a GIUnionInfo.t from a GIRegisteredTypeInfo.t, the underlying C structure
    ref count is increased and the value is Gc.finalis"ed" with
    GIRegisteredTypeInfo.registeredtypeinfo_unref. *)
val from_registeredtypeinfo:
  GIRegisteredTypeInfo.t structure ptr -> t structure ptr

(** Return a GIRegisteredTypeInfo.t form a GIUnionInfo, the underlying C structure
    ref count is increased and the value is Gc.finalis"ed" with
    GIRegisteredTypeInfo.registeredtypeinfo_unref. *)
val to_registeredtypeinfo:
  t structure ptr -> GIRegisteredTypeInfo.t structure ptr

