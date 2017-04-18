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

#ifndef GIUNIONINFO_STUBS_H
#define GIUNIONINFO_STUBS_H

#include "conversions.h"
#include "gifunctioninfo_stubs.h"
#include <girepository.h>

#define GIUnionInfo_val(v) (*((GIUnionInfo **) Data_custom_val(v)))
#define Val_giunioninfo(i) alloc_giunioninfo (i)

value
alloc_giunioninfo (GIUnionInfo *i);

CAMLprim value
caml_g_iunioninfo_get_alignment_c (value unioninfo);

CAMLprim value
caml_g_iunioninfo_get_size_c (value unioninfo);

CAMLprim value
caml_g_iunioninfo_get_n_methods_c (value unioninfo);

CAMLprim value
caml_g_iunioninfo_get_method_c (value unioninfo,
                                value index);

CAMLprim value
caml_g_iunioninfo_get_n_fields_c (value unioninfo);

CAMLprim value
caml_g_iunioninfo_is_discriminated_c (value unioninfo);
#endif // GIUNIONINFO_STUBS_H
