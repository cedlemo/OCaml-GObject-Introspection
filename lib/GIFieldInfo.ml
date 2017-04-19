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

(** GIFieldInfo — Module representing a struct or union field. *)

(** A GIFieldInfo struct represents a field of a struct (see GIStructInfo),
    union (see GIUnionInfo) or an object (see GIObjectInfo).
    The GIFieldInfo is fetched by calling
    GIStructInfo.get_field,
    GIUnionInfo.get_field
    or GIObjectInfo.get_field. A field has a size, type and a struct offset
    asssociated and a set of flags, which is currently
    GI_FIELD_IS_READABLE or GI_FIELD_IS_WRITABLE.*)
type fieldinfo

(** Flags for a GIFieldInfo. *)
type flags =
  | Is_readable (** field is readable. *)
  | Is_writable (** field is writable. *)

external get_flags:
  fieldinfo -> flags = "caml_g_ifieldinfo_get_flags_c"

