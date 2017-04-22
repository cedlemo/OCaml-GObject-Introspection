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

#ifndef GIFIELDINFO_STUBS_H
#define GIFIELDINFO_STUBS_H

#include "utils.h"
#include <girepository.h>

#define GIFieldInfo_val(v) (*((GIFieldInfo **) Data_custom_val(v)))
#define Val_gifieldinfo(i) alloc_gifieldinfo (i)

value
alloc_gifieldinfo (GIFieldInfo *i);

CAMLprim value
caml_g_field_info_get_flags_c (value fieldinfo);

CAMLprim value
caml_g_field_info_is_readable_c (value fieldinfo);

CAMLprim value
caml_g_field_info_get_offset_c (value fieldinfo);
#endif // GIFIELDINFO_STUBS_H
