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

type file = {
  name: string;
  descr : Pervasives.out_channel;
}

type files = {
  ml : file;
  mli : file;
}

let file_in_create_append_mode name =
  Pervasives.open_out_gen [Open_append; Open_creat] 0o666 name

let generate_sources base_name =
  let name = base_name ^ ".ml" in
  let descr = file_in_create_append_mode name in
  let ml = {name; descr} in
  let name = base_name ^ ".mli" in
  let descr = file_in_create_append_mode name in
  let mli = {name; descr} in
  {ml; mli}

let parse_invalid_info info =
  ()

let parse_function_info info source_files =
  ()

let parse_callback_info info =
  ()

let parse_struct_info info =
  ()

let parse_boxed_info info =
  ()

let parse_enum_info info =
  ()

let parse_flags_info info =
  ()

let parse_object_info info =
  ()

let parse_interface_info info =
  ()

let parse_constant_info info source_files =
  ()

let parse_union_info info =
  ()

let parse_value_info info =
  ()

let parse_signal_info info =
  ()

let parse_vfunc_info info =
  ()

let parse_property_info info =
  ()

let parse_field_info info =
  ()

let parse_arg_info info =
  ()

let parse_type_info info =
  ()

let parse_unresolved_info info =
  ()


