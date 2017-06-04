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

exception Not_Implemented of string

let raise_not_implemented message =
  raise (Not_Implemented message)

let raise_tag_not_implemented loc tag =
  let m = String.concat ":" [loc; GITypes.string_of_tag tag] in
  raise_not_implemented m

let append_ctypes_union_declaration name sources_files =
  let (mli, ml) = sources_files in
  Printf.fprintf mli "open Ctypes\n";
  Printf.fprintf mli "type t\n";
  Printf.fprintf mli "val %s : t union typ\n" (String.lowercase_ascii name);
  Printf.fprintf ml "open Ctypes\n";
  Printf.fprintf ml "open Foreign\n";
  Printf.fprintf ml "type t\n";
  Printf.fprintf ml "let %s : t union typ = union \"%s\"\n" (String.lowercase_ascii name) name


