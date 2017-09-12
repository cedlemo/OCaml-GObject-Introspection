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

(** Bind_struct : regroups all functions needed to parse and generate the
    OCaml code for C structures. *)

open Ctypes
open Foreign

val append_ctypes_struct_declaration:
  string -> (Pervasives.out_channel * Pervasives.out_channel) -> unit

val append_ctypes_struct_fields_declarations:
  string -> Struct_info.t structure ptr -> (Pervasives.out_channel * Pervasives.out_channel) -> unit

val append_ctypes_struct_methods_bindings:
  string -> Struct_info.t structure ptr -> (Pervasives.out_channel * Pervasives.out_channel) -> unit

val append_ctypes_struct_seal:
  Pervasives.out_channel -> unit

(** Use GIStructureInfo in order to generate Ctypes bindings.
  - For each structure, a module is created in a StructureName.mli file and a StructureName.ml file.
  - the OCaml type is named `StructureName.t`
  - the Ctypes typ is named `StructureName.t_typ`
  - the fields are named `f_field_name` (in order to avoid conflict with OCaml keywords).
*)
val parse_struct_info :
  Base_info.t structure ptr -> files -> unit
