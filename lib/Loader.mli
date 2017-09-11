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

(** Loader : type and functions in order to read the GObject-Introspection of
    an instrospectable library and generate Ctypes bindings. *)
open Ctypes
open Foreign

(** a Loader.t is a GObject-Instrospection namespace that has been loaded. *)
type t

(** Load a namespace with an optional version. *)
val load:
  string -> ?version:string -> unit -> t option

(** Get the namespace of the loader. *)
val get_namespace:
  t -> string

(** Get the version of the loaded namespace.*)
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

(** Get the path where the files will be build :
    build_path/namespace/lib *)
val get_lib_path:
  t -> string

(** Generate the files Name.ml and Name.mli in append mode *)
val generate_module_files:
  t -> string -> Bindings_builder.files

(** Generate the directories build_path/namespace/lib *)
val generate_directories:
  t -> unit

(** Generate comments with DEPRECATED tag. *)
val warning_for_deprecated:
  string -> Bindings_builder.files -> unit

(** Helper type used in Loader.load.
    TODO : the field base_name is named like this instead of name because
    of the existence of the field name in the "file" type. See how to better
    organize this. For example in RWO p 93-94:
      "we can avoid this ambiguity altogether either by using nonoverlapping
      field names or, more generally, by minting a module for each type.
      Packing types into modules is a broadly usefull idom (and one used quite
      extensively by Core, providing for each type a namespace withing which
      put related values."*)

type gi_info = { base_name: string;
                 info: Base_info.t structure ptr;
                 loader: t;
                 sources: Bindings_builder.files }

(** Parse the GI infos and create the corresponding ctypes code
  @param const_parser allows user to customize the Constant_info bindings generator.
  @param enum_parser allows user to customize the Enum_info bindings generator.
  @param flags_parser allows user to customize the Enum_info bindings generator
    for Enum used as flags (Ored).
  @param struct_parser allows user to customize the GIStructureInfo bindings
    generator.
  @param union_parser allows user to customize the Union_info bindings generator.
  @param skip allows user to specify string patterns that will be tested on
         structure names, union names, enum names, parameter an return type names
         of functions or methods in order to skip theirs bindings.
 *)
val parse:
  t ->
  ?const_parser:(Base_info.t structure ptr -> Bindings_builder.files -> unit) ->
  ?enum_parser:(Base_info.t structure ptr -> Bindings_builder.files -> unit) ->
  ?flags_parser:(Base_info.t structure ptr -> Bindings_builder.files -> unit) ->
  ?struct_parser:(Base_info.t structure ptr -> Bindings_builder.files -> unit) ->
  ?union_parser:(Base_info.t structure ptr -> Bindings_builder.files -> unit) ->
  ?skip:string list ->
  unit ->
  unit
