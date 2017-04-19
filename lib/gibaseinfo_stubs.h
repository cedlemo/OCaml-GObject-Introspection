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

#ifndef GIBASEINFO_STUBS_H
#define GIBASEINFO_STUBS_H

#include "utils.h"
#include <girepository.h>

#define GIBaseInfo_val(v) (*((GIBaseInfo **) Data_custom_val(v)))
#define Val_gibaseinfo(i) alloc_gibaseinfo (i)

value
alloc_gibaseinfo (GIBaseInfo *i);

CAMLprim value
caml_g_ibaseinfo_get_name_c (value baseinfo);

CAMLprim value
caml_g_ibaseinfo_get_type_c (value baseinfo);

CAMLprim value
caml_g_ibaseinfo_equal_c (value baseinfo1,
                          value baseinfo2);

CAMLprim value
caml_g_ibaseinfo_get_namespace_c (value baseinfo);

CAMLprim value
caml_g_ibaseinfo_iterate_over_attributes_c (value baseinfo,
                                            value callback);

CAMLprim value
caml_g_ibaseinfo_get_container_c (value baseinfo);

CAMLprim value
caml_g_ibaseinfo_is_deprecated_c (value baseinfo);
#endif // GIBASEINFO_STUBS_H
