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

#ifndef GIFUNCTIONINFO_STUBS_H
#define GIFUNCTIONINFO_STUBS_H

#include "utils.h"
#include <girepository.h>

#define GIFunctionInfo_val(v) (*((GIFunctionInfo **) Data_custom_val(v)))
/*
 * Wrap a GIFunctionInfo pointer and increase its reference counter
 * */
#define Val_gifunctioninfo_from_base_info(i) alloc_gifunctioninfo_from_base_info (i)
/*
 * Wrap a GIFunctionInfo pointer without increasing its reference counter
 * */
#define Val_gifunctioninfo(i) alloc_gifunctioninfo (i)

// TODO : differenciate the functions on with/without ref instead ?
value
alloc_gifunctioninfo_from_base_info (GIFunctionInfo *i);

value
alloc_gifunctioninfo (GIFunctionInfo *i);

CAMLprim value
caml_g_ifunctioninfo_get_flags_c (value functioninfo);

CAMLprim value
caml_g_ifunctioninfo_get_symbol_c (value functioninfo);
#endif // GIFUNCTIONINFO_STUBS_H
