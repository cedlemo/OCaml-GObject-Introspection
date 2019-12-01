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

let all_flags : (int64 * Bindings.GParam.flags) list= [
    Stubs.GParam.g_param_readable, Bindings.GParam.Readable;
    Stubs.GParam.g_param_writable, Bindings.GParam.Writable;
    Stubs.GParam.g_param_readwrite, Bindings.GParam.Readwrite;
    Stubs.GParam.g_param_construct, Bindings.GParam.Construct;
    Stubs.GParam.g_param_construct_only, Bindings.GParam.Construct_only;
    Stubs.GParam.g_param_lax_validation, Bindings.GParam.Lax_validation;
    Stubs.GParam.g_param_static_name, Bindings.GParam.Static_name;
    Stubs.GParam.g_param_static_nick, Bindings.GParam.Static_nick;
    Stubs.GParam.g_param_static_blurb, Bindings.GParam.Static_blurb;
    Stubs.GParam.g_param_explicit_notify,  Bindings.GParam.Explicit_notify;
    Stubs.GParam.g_param_deprecated,  Bindings.GParam.Deprecated;
  ]

let flags_list_of_int64 v =
  let open Int64 in
  let rec build_flags_list allf acc =
    match allf with
    | [] -> acc
    | (i, f) :: q -> if ((logand v i) <> zero) then build_flags_list q (f :: acc)
       else build_flags_list q acc
  in build_flags_list all_flags []

let int64_of_flags_list (f : Bindings.GParam.flags list) =
  let open Int64 in
  let bitwise_or = fun acc value ->
    let (i, _f) = List.find (fun (i', f') -> value = f') all_flags in logor acc i
  in
  List.fold_left bitwise_or Int64.zero f

let flags_list =
  view Stubs.GParam.flags
    ~read:flags_list_of_int64
    ~write:int64_of_flags_list

let flag_to_string = function
  | Bindings.GParam.Readable -> "Readable"
  | Bindings.GParam.Writable -> "Writable"
  | Bindings.GParam.Readwrite -> "Readwrite"
  | Bindings.GParam.Construct -> "Construct"
  | Bindings.GParam.Construct_only -> "Construct_only"
  | Bindings.GParam.Lax_validation -> "Lax_validation"
  | Bindings.GParam.Static_name -> "Static_name"
  | Bindings.GParam.Static_nick -> "Static_nick"
  | Bindings.GParam.Static_blurb -> "Static_blurb"
  | Bindings.GParam.Explicit_notify -> "Explicit_notify"
  | Bindings.GParam.Deprecated -> "Deprecated"

