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

(** Obtain the required alignment of the union. *)
external get_alignment:
  unioninfo -> int = "caml_g_iunioninfo_get_alignment_c"

(** Obtain the total size of the union. *)
external get_size:
  unioninfo -> int = "caml_g_iunioninfo_get_size_c"

