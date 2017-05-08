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

(** GIConstantInfo — Struct representing a constant *)

open Ctypes

(** GIConstantInfo represents a constant. A constant has a type associated
    which can be obtained by calling GIConstantInfo.get_type and a value, which
    can be obtained by calling GIConstant.get_value. *)
type t
val constantinfo : t structure typ

(** Obtain the type of the constant as a GITypeInfo. *)
val get_type:
  t structure ptr -> GITypeInfo.t structure ptr

(** Just cast OCaml Ctypes base info to constant info. *)
val cast_baseinfo_to_constantinfo:
  GIBaseInfo.t structure ptr -> t structure ptr

(** Just cast OCaml Ctypes constant info to base info *)
val cast_constantinfo_to_baseinfo:
  t structure ptr -> GIBaseInfo.t structure ptr

(** Return a GIConstantInfo.t from a GIBaseInfo.t, the underlying C structure
    ref count is increased and the value is Gc.finalis"ed" with
    GIBaseInfo.baseinfo_unref. *)
val constantinfo_of_baseinfo:
  GIBaseInfo.t structure ptr -> t structure ptr

(** Return a GIBaseInfo.t form a GIConstantInfo, the underlying C structure
    ref count is increased and the value is Gc.finalis"ed" with
    GIBaseInfo.baseinfo_unref. *)
val baseinfo_of_constantinfo:
  t structure ptr -> GIBaseInfo.t structure ptr

(** Obtain the value associated with the GIConstantInfo and store it in the
    value parameter. argument needs to be allocated before passing it in. The
    size of the constant value stored in argument will be returned. Free the
    value with GIConstantInfo.free_value. *)
val get_value:
  t structure ptr -> GITypes.argument_t union ptr
