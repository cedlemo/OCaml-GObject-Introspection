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

type t = {
  repo : GIRepository.repository;
  typelib : GIRepository.typelib;
  namespace : string;
  version : string;
}

let load namespace ?version () =
  let repo = GIRepository.get_default () in
  match GIRepository.require repo namespace ?version:version () with
  | None -> None
  | Some typelib -> let version' = GIRepository.get_version repo namespace in
    Some {repo; typelib; namespace; version = version'}

let get_namespace repo =
  repo.namespace

let get_version repo =
  repo.version

let generate_dir repo =
  Unix.mkdir repo.namespace 0o640

(* Module Organisation for namespace
 * Namespace.ml
 * Namespace.mli
 *  - get all the functions of the main module
 *  - create include with the other modules generated ?
 * for all struct, unions, enums and object :
 * namepsace_item_name.ml
 * namespace_item_name.mli
 *)
