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

(** GIStructInfo — Module representing a C structure *)

open Ctypes

(** GIStructInfo represents a generic C structure type.
 A structure has methods and fields.*)
type t
val structinfo : t structure typ

(** Return true if this structure represents the "class structure" for some
    GObject or GInterface. This function is mainly useful to hide this kind of
    structure from generated public APIs.
*)
val is_gtype_struct:
  t structure ptr -> bool

(** Obtain the required alignment of the structure.*)
val get_alignment:
  t structure ptr -> int

(** Obtain the total size of the structure. *)
val get_size:
  t structure ptr -> int

(** No doc yet *)
val is_foreign:
  t structure ptr -> bool

(** Obtain the number of fields this structure has. *)
val get_n_fields:
  t structure ptr -> int

(** Obtain the number of methods this structure has. *)
val get_n_methods:
  t structure ptr -> int

(** Obtain the type information for field with specified index. *)
val get_field:
  t structure ptr -> int -> GIFieldInfo.t structure ptr

(** Return a GIStructInfo.t from a GIBaseInfo.t, the underlying C structure
    ref count is increased and the value is Gc.finalis"ed" with
    GIBaseInfo.baseinfo_unref. *)
val structinfo_of_baseinfo:
  GIBaseInfo.t structure ptr -> t structure ptr

(** Return a GIBaseInfo.t form a GIStructInfo, the underlying C structure
    ref count is increased and the value is Gc.finalis"ed" with
    GIBaseInfo.baseinfo_unref. *)
val baseinfo_of_structinfo:
  t structure ptr -> GIBaseInfo.t structure ptr
