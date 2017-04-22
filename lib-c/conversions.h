/*
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
 */

#ifndef CONVERSIONS_H
#define CONVERSIONS_H

#include <stdio.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/custom.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include <glib.h>

value
c_null_term_array_of_strings_to_ocaml_strings_list (char **strings);

value
gslist_of_strings_to_ocaml_strings_list (GSList *list);

value
glist_of_strings_to_ocaml_strings_list (GList *list);

value
val_some (value v);

void
raise_gerror_to_ocaml_failure_exception (GError *error);

#define Val_none Val_int (0)
#define Val_some(v) val_some (v)
#define Some_val(v) Field(v,0)
#endif // CONVERSIONS_H
