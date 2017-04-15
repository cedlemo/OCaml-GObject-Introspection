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

let print_info repo namespace n =
  let message =
  match GIRepository.get_info repo namespace n with
  | None -> String.concat " " ["GIBaseInfo number"; string_of_int n; "unable to be loaded"]
  | Some (info) -> String.concat " " ["GIBaseInfo number"; string_of_int n; GIBaseInfo.get_name info]
  in print_endline message

let () =
  let namespace = "Gtk" in
  let repo = GIRepository.get_default () in
  let _ = GIRepository.require repo namespace in
  let n = GIRepository.get_n_infos repo namespace in
  for i = 0 to (n - 1) do
    print_info repo namespace i;
  done
