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
  t structure ptr -> int -> GIFieldInfo.t structure ptr

(** Obtain the type information for method with specified index. *)
val get_method:
  t structure ptr -> int -> GIFunctionInfo.t structure ptr

(** Obtain the type information for method named name .*)
val find_method:
  t structure ptr -> string -> GIFunctionInfo.t structure ptr option

(** Return true if this union contains discriminator field. *)
val is_discriminated:
  t structure ptr -> bool
(*
  TODO : gint	g_union_info_get_discriminator_offset ()
  TODO : GITypeInfo *	g_union_info_get_discriminator_type ()
  TODO : GIConstantInfo *	g_union_info_get_discriminator ()
*)

(** Just cast OCaml Ctypes base info to union info. *)
val cast_baseinfo_to_unioninfo:
  GIBaseInfo.t structure ptr -> t structure ptr

(** Just cast OCaml Ctypes union info to base info *)
val cast_unioninfo_to_baseinfo:
  t structure ptr -> GIBaseInfo.t structure ptr

(** Return a GIStructInfo.t from a GIBaseInfo.t, the underlying C structure
    ref count is increased and the value is Gc.finalis"ed" with
    GIBaseInfo.baseinfo_unref. *)
val unioninfo_of_baseinfo:
  GIBaseInfo.t structure ptr -> t structure ptr

(** Return a GIBaseInfo.t form a GIStructInfo, the underlying C structure
    ref count is increased and the value is Gc.finalis"ed" with
    GIBaseInfo.baseinfo_unref. *)
val baseinfo_of_unioninfo:
  t structure ptr -> GIBaseInfo.t structure ptr
