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

open GIFunctionInfo
open GIFieldInfo

(** GIStructInfo represents a generic C structure type.
 A structure has methods and fields.*)
type structinfo

(** Obtain the required alignment of the structure.*)
external get_alignment:
  structinfo -> int = "caml_g_struct_info_get_alignment_c"

(** Obtain the total size of the structure. *)
external get_size:
  structinfo -> int = "caml_g_struct_info_get_size_c"

(** Return true if this structure represents the "class structure" for some
    GObject or GInterface. This function is mainly useful to hide this kind of
    structure from generated public APIs.
*)
external is_gtype_struct:
  structinfo -> bool = "caml_g_struct_info_is_gtype_struct_c"

(** No doc yet *)
external is_foreign:
  structinfo -> bool = "caml_g_struct_info_is_foreign_c"

(** Obtain the number of fields this structure has. *)
external get_n_fields:
  structinfo -> int = "caml_g_struct_info_get_n_fields_c"

(** Obtain the type information for field with specified index. *)
external get_field:
  structinfo -> int -> fieldinfo = "caml_g_struct_info_get_field_c"

(** Obtain the number of methods this structure has. *)
external get_n_methods:
  structinfo -> int = "caml_g_struct_info_get_n_methods_c"

(** Obtain the type information for method with specified index. *)
external get_method:
  structinfo -> int -> functioninfo = "caml_g_struct_info_get_method_c"

(** Obtain the type information for method named name . *)
external find_method:
  structinfo -> string -> functioninfo option = "caml_g_struct_info_find_method_c"

(* TODO: GIFieldInfo *	g_struct_info_get_field ()
*)
