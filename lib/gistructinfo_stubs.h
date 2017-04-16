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

#ifndef GISTRUCTINFO_STUBS_H
#define GISTRUCTINFO_STUBS_H

#include "conversions.h"
#include <girepository.h>

#define GIStructInfo_val(v) (*((GIStructInfo **) Data_custom_val(v)))
#define Val_gistructinfo(i) alloc_gistructinfo (i)

value
alloc_gistructinfo (GIStructInfo *i);

CAMLprim value
caml_g_istructinfo_get_alignment_c (value structinfo);

CAMLprim value
caml_g_istructinfo_get_size_c (value structinfo);

CAMLprim value
caml_g_istructinfo_is_gtype_struct_c (value structinfo);
#endif // GISTRUCTINFO_STUBS_H
