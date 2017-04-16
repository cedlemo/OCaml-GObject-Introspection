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

(** GIStructInfo represents a generic C structure type.
 A structure has methods and fields.*)
type structinfo

external get_alignment:
  structinfo -> int = "caml_g_istructinfo_get_alignment_c"

external get_size:
  structinfo -> int = "caml_g_istructinfo_get_size_c"

(** Return true if this structure represents the "class structure" for some
    GObject or GInterface. This function is mainly useful to hide this kind of
    structure from generated public APIs.
*)
external is_gtype_struct:
  structinfo -> bool = "caml_g_istructinfo_is_gtype_struct_c"
