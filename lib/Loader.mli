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

open Ctypes
open Foreign

type t

val load:
  string -> ?version:string -> unit -> t option

val get_namespace:
  t -> string

val get_version:
  t -> string

val generate_dir:
  t -> unit

(** Specify the root path where the directories and the files will be created.
    For example, with path = "toto/titi/tata" , with a namespace of "GLib",
    then the files will go in "toto/titi/tata/GLib/lib" *)
val set_build_path:
  t -> string -> t

(** Get the build path of the loader *)
val get_build_path:
  t -> string

(** Generate the files Namespace.ml and Namespace.mli in append mode *)
val generate_main_files:
  t -> Builder.files

(** Parse the GI infos and create the corresponding ctypes code *)
val parse:
  t -> unit

