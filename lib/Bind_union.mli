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
    OCaml code for C unions. *)

open Ctypes
open Foreign

val append_ctypes_union_declaration:
  string -> Binding_utils.Sources.t -> unit

val append_ctypes_union_fields_declarations:
  string -> Union_info.t structure ptr -> Binding_utils.Sources.t -> unit

val append_ctypes_union_seal:
  Binding_utils.File.t -> unit

(** Use Union_info in order to generate Ctypes bindings.
  - For each union, a module is created in a Union_name.mli file and a Union_name.ml file.
  - the OCaml type is named `Union_name.t`
  - the Ctypes typ is named `Union_name.t_typ`
  - the fields are named `f_field_name` (in order to avoid conflict with OCaml keywords).
*)
val parse_union_info :
  Base_info.t structure ptr -> Binding_utils.Sources.t -> unit
