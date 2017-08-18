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

let () =
  let namespace = "Gtk" in
  let repo = Repository.get_default () in
  let _ = Repository.require repo namespace () in
  let n = Repository.get_n_infos repo namespace in
  for i = 0 to (n - 1) do
    let info =  Repository.get_info repo namespace i in
    match GIBaseInfo.get_type info with
    | GIBaseInfo.Union -> let info' = GIUnionInfo.from_baseinfo info in
      if GIUnionInfo.is_discriminated info' then
        let message = ( match GIBaseInfo.get_name info with
        | None -> String.concat " " ["Anonymous";
                                     "Index";
                                     string_of_int i;
                                     "/";
                                     string_of_int n]
        | Some name -> String.concat " " [name;
                                          "Index";
                                          string_of_int i;
                                          "/";
                                          string_of_int n]

          ) in print_endline message

    | _ -> ()
  done
