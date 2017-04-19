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

(** GIUnionInfo — Module representing a union. *)

(** GIUnionInfo represents a union type.
    A union has methods and fields. Unions can optionally have a discriminator,
    which is a field deciding what type of real union fields is valid for
    specified instance. *)
type unioninfo

open GIFunctionInfo
open GIFieldInfo

(** Obtain the required alignment of the union. *)
external get_alignment:
  unioninfo -> int = "caml_g_iunioninfo_get_alignment_c"

(** Obtain the total size of the union. *)
external get_size:
  unioninfo -> int = "caml_g_iunioninfo_get_size_c"

(** Obtain the number of methods this union has. *)
external get_n_methods:
  unioninfo -> int = "caml_g_iunioninfo_get_n_methods_c"

(** Obtain the type information for method with specified index. *)
external get_method:
  unioninfo -> int -> functioninfo = "caml_g_iunioninfo_get_method_c"

(** Obtain the number of fields this union has. *)
external get_n_fields:
  unioninfo -> int = "caml_g_iunioninfo_get_n_fields_c"

(** Obtain the type information for field with specified index. *)
external get_field:
  unioninfo -> int -> fieldinfo = "caml_g_iunioninfo_get_field_c"

(** Return true if this union contains discriminator field. *)
external is_discriminated:
  unioninfo -> bool = "caml_g_iunioninfo_is_discriminated_c"

(** Obtain the type information for method named name .*)
external find_method:
  unioninfo -> string -> functioninfo option = "caml_g_iunioninfo_find_method_c"

(*
 * TODO : int	g_union_info_get_discriminator_offset ()
 * TODO : ITypeInfo *	g_union_info_get_discriminator_type ()
 * TODO : IConstantInfo *	g_union_info_get_discriminator ()
 *)
