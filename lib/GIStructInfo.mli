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
type structinfo
val structinfo : structinfo structure typ

(** Return true if this structure represents the "class structure" for some
    GObject or GInterface. This function is mainly useful to hide this kind of
    structure from generated public APIs.
*)
val is_gtype_struct:
  structinfo structure ptr -> bool

(** Obtain the required alignment of the structure.*)
val get_alignment:
  structinfo structure ptr -> int

(** Obtain the total size of the structure. *)
val get_size:
  structinfo structure ptr -> int

(** No doc yet *)
val is_foreign:
  structinfo structure ptr -> bool

(** Obtain the number of fields this structure has. *)
val get_n_fields:
  structinfo structure ptr -> int

(** Obtain the number of methods this structure has. *)
val get_n_methods:
  structinfo structure ptr -> int

