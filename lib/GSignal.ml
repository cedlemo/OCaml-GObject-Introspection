(*
 * Copyright 2019 Cedric LE MOIGNE, cedlemo@gmx.com
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

let all_flags : (int64 * Bindings.GSignal.flags) list= [
  Stubs.GSignal.g_signal_run_first, Bindings.GSignal.Run_first;
  Stubs.GSignal.g_signal_run_last, Bindings.GSignal.Run_last;
  Stubs.GSignal.g_signal_run_cleanup, Bindings.GSignal.Run_cleanup;
  Stubs.GSignal.g_signal_no_recurse, Bindings.GSignal.No_recurse;
  Stubs.GSignal.g_signal_detailed, Bindings.GSignal.Detailed;
  Stubs.GSignal.g_signal_action, Bindings.GSignal.Action;
  Stubs.GSignal.g_signal_no_hooks, Bindings.GSignal.No_hooks;
  Stubs.GSignal.g_signal_must_collect, Bindings.GSignal.Must_collect;
  Stubs.GSignal.g_signal_deprecated,  Bindings.GSignal.Deprecated;
  ]

let flags_list_of_int64 v =
  let open Int64 in
  let rec build_flags_list allf acc =
    match allf with
    | [] -> acc
    | (i, f) :: q -> if ((logand v i) <> zero) then build_flags_list q (f :: acc)
       else build_flags_list q acc
  in build_flags_list all_flags []

let int64_of_flags_list (f : Bindings.GSignal.flags list) =
  let open Int64 in
  let bitwise_or = fun acc value ->
    let (i, _f) = List.find (fun (i', f') -> value = f') all_flags in logor acc i
  in
  List.fold_left bitwise_or Int64.zero f

let flags_list =
  view Stubs.GSignal.flags
    ~read:flags_list_of_int64
    ~write:int64_of_flags_list

let flag_to_string = function
  | Bindings.GSignal.Run_first -> "Run_first"
  | Bindings.GSignal.Run_last -> "Run_last"
  | Bindings.GSignal.Run_cleanup -> "Run_cleanup"
  | Bindings.GSignal.No_recurse -> "No_recurse"
  | Bindings.GSignal.Detailed -> "Detailed"
  | Bindings.GSignal.Action -> "Action"
  | Bindings.GSignal.No_hooks -> "No_hooks"
  | Bindings.GSignal.Must_collect -> "Must_collect"
  | Bindings.GSignal.Deprecated -> "Deprecated"

