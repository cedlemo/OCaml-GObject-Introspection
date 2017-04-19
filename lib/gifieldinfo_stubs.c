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

#include "gifieldinfo_stubs.h"

static void
finalize_gifieldinfo (value v)
{
    GIFieldInfo *info = NULL;
    info = GIFieldInfo_val (v);

    if (info != NULL)
        g_base_info_unref ((GIBaseInfo *)info);
}

static struct custom_operations gifieldinfo_ops = {
    identifier:  "fr.github.cedlemo.gobject-introspection.gifieldinfo",
    finalize:    finalize_gifieldinfo,
    compare:     custom_compare_default,
    hash:        custom_hash_default,
    serialize:   custom_serialize_default,
    deserialize: custom_deserialize_default
};


value
alloc_gifieldinfo (GIFieldInfo *i)
{
    g_base_info_ref ((GIBaseInfo *)i);
    value v = alloc_custom(&gifieldinfo_ops, sizeof (GIFieldInfo *), 0, 1);
    GIFieldInfo_val (v) = i;
    return v;
}

CAMLprim value
caml_g_ifieldinfo_get_flags_c (value caml_fieldinfo)
{
    CAMLparam1 (caml_fieldinfo);
    GIFieldInfo *c_info;
    GIFieldInfoFlags c_flags;

    c_info = GIFieldInfo_val (caml_fieldinfo);
    c_flags = g_field_info_get_flags (c_info);

    CAMLreturn (Val_int (c_flags));
}
