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

#include "gistructinfo_stubs.h"

static void
finalize_gistructinfo (value v)
{
    GIStructInfo *info = NULL;
    info = GIStructInfo_val (v);

    if (info != NULL)
        g_base_info_unref ((GIBaseInfo *)info);
}

static struct custom_operations gistructinfo_ops = {
    identifier:  "fr.github.cedlemo.gobject-introspection.gistructinfo",
    finalize:    finalize_gistructinfo,
    compare:     custom_compare_default,
    hash:        custom_hash_default,
    serialize:   custom_serialize_default,
    deserialize: custom_deserialize_default
};


value
alloc_gistructinfo (GIStructInfo *i)
{
    g_base_info_ref ((GIBaseInfo *)i);
    value v = alloc_custom(&gistructinfo_ops, sizeof (GIStructInfo *), 0, 1);
    GIStructInfo_val (v) = i;
    return v;
}

CAMLprim value
caml_g_istructinfo_get_alignment_c (value caml_structinfo)
{
    CAMLparam1 (caml_structinfo);
    GIStructInfo *c_info;
    int alignment;

    c_info = GIStructInfo_val (caml_structinfo);
    alignment = g_struct_info_get_alignment (c_info);

    CAMLreturn (Val_int (alignment));
}

CAMLprim value
caml_g_istructinfo_get_size_c (value caml_structinfo)
{
    CAMLparam1 (caml_structinfo);
    GIStructInfo *c_info;
    int size;

    c_info = GIStructInfo_val (caml_structinfo);
    size = g_struct_info_get_size (c_info);

    CAMLreturn (Val_int (size));
}

CAMLprim value
caml_g_istructinfo_is_gtype_struct_c (value caml_structinfo)
{
    CAMLparam1 (caml_structinfo);
    GIStructInfo *c_info;
    gboolean is_struct;

    c_info = GIStructInfo_val (caml_structinfo);
    is_struct = g_struct_info_is_gtype_struct (c_info);

    CAMLreturn (Val_bool (is_struct));
}

CAMLprim value
caml_g_istructinfo_is_foreign_c (value caml_structinfo)
{
    CAMLparam1 (caml_structinfo);
    GIStructInfo *c_info;
    gboolean is_foreign;

    c_info = GIStructInfo_val (caml_structinfo);
    is_foreign = g_struct_info_is_foreign (c_info);

    CAMLreturn (Val_bool (is_foreign));
}
