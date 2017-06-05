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

(** Raise an Not_implemented exception with the message given in argument. *)
val raise_not_implemented:
  string -> unit

(** Raise a Not_implemented exception with a string representation of the
    GITypes.tag, given in argument, that will be appended to the message given
    in the first argument. *)
val raise_tag_not_implemented:
  string -> GITypes.tag -> unit

(** Log a Not implemented message with a string representation of the
    GITypes.tag, given in argument, that will be appended to the message given
    in the first argument. *)
val log_tag_not_implemented:
  string -> GITypes.tag -> unit

(** Transforms a GITypes.tag to the corresponding types for the mli file and
    the ml file. For example, the GITypes.Int8 tag returns ("int", "int8_t").
    The "int" string is used in the OCaml header file for signature while the
    int8_t is used in OCaml file for Ctypes types usage.*)
val type_tag_to_ctypes_strings:
  GITypes.tag -> (string * string)
