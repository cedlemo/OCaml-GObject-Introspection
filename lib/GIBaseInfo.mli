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

(** GIBaseInfo — Base struct for all GITypelib structs *)

(** GIBaseInfo is the common base struct of all other *Info structs accessible
    through the GIRepository API. All other structs can be casted to a
    GIBaseInfo *)
type baseinfo

(** Obtain the name of the info . What the name represents depends on the
    GIInfoType of the info . For instance for GIFunctionInfo it is the name of
    the function.*)
val get_name:
  baseinfo -> string option
