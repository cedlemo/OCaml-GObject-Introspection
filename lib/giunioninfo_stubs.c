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

#include "giunioninfo_stubs.h"

static void
finalize_giunioninfo (value v)
{
    GIUnionInfo *info = NULL;
    info = GIUnionInfo_val (v);

    if (info != NULL)
        g_base_info_unref ((GIBaseInfo *)info);
}

static struct custom_operations giunioninfo_ops = {
    identifier:  "fr.github.cedlemo.gobject-introspection.giunioninfo",
    finalize:    finalize_giunioninfo,
    compare:     custom_compare_default,
    hash:        custom_hash_default,
    serialize:   custom_serialize_default,
    deserialize: custom_deserialize_default
};


value
alloc_giunioninfo (GIUnionInfo *i)
{
    g_base_info_ref ((GIBaseInfo *)i);
    value v = alloc_custom(&giunioninfo_ops, sizeof (GIUnionInfo *), 0, 1);
    GIUnionInfo_val (v) = i;
    return v;
}


CAMLprim value
caml_g_iunioninfo_get_alignment_c (value caml_unioninfo)
{
    CAMLparam1 (caml_unioninfo);
    GIUnionInfo *c_info;
    int c_alignment;

    c_info = GIUnionInfo_val (caml_unioninfo);
    c_alignment = g_union_info_get_alignment (c_info);

    CAMLreturn (Val_int (c_alignment));
}

CAMLprim value
caml_g_iunioninfo_get_size_c (value caml_unioninfo)
{
    CAMLparam1 (caml_unioninfo);
    GIUnionInfo *c_info;
    int c_size;

    c_info = GIUnionInfo_val (caml_unioninfo);
    c_size = g_union_info_get_size (c_info);

    CAMLreturn (Val_int (c_size));
}

CAMLprim value
caml_g_iunioninfo_get_n_methods_c (value caml_unioninfo)
{
    CAMLparam1 (caml_unioninfo);
    GIUnionInfo *c_info;
    int c_n_methods;

    c_info = GIUnionInfo_val (caml_unioninfo);
    c_n_methods = g_union_info_get_n_methods (c_info);

    CAMLreturn (Val_int (c_n_methods));
}

CAMLprim value
caml_g_iunioninfo_get_method_c (value caml_unioninfo,
                                value caml_n)
{
    CAMLparam2 (caml_unioninfo, caml_n);
    GIUnionInfo *c_info;
    GIFunctionInfo *c_function_info;
    CAMLlocal1 (caml_function_info);
    int c_n;
    int c_n_max;

    c_info = GIUnionInfo_val (caml_unioninfo);
    c_n = Int_val (caml_n);

    c_n_max = g_union_info_get_n_methods (c_info);
    if(c_n < 0 || c_n >= c_n_max)
        RAISE_FAILURE_ARRAY_OUT_OF_BOUNDS;


    c_function_info = g_union_info_get_method (c_info, c_n);
    caml_function_info = Val_gifunctioninfo (c_function_info);

    CAMLreturn (caml_function_info);
}

CAMLprim value
caml_g_iunioninfo_get_n_fields_c (value caml_unioninfo)
{
    CAMLparam1 (caml_unioninfo);
    GIUnionInfo *c_info;
    int c_n_fields;

    c_info = GIUnionInfo_val (caml_unioninfo);
    c_n_fields = g_union_info_get_n_fields (c_info);

    CAMLreturn (Val_int (c_n_fields));
}

CAMLprim value
caml_g_iunioninfo_get_field_c (value caml_unioninfo,
                               value caml_n)
{
    CAMLparam2 (caml_unioninfo, caml_n);
    GIUnionInfo *c_info;
    GIFieldInfo *c_field_info;
    CAMLlocal1 (caml_field_info);
    int c_n;
    int c_n_max;

    c_info = GIUnionInfo_val (caml_unioninfo);
    c_n = Int_val (caml_n);

    c_n_max = g_union_info_get_n_fields (c_info);
    if(c_n < 0 || c_n >= c_n_max)
        RAISE_FAILURE_ARRAY_OUT_OF_BOUNDS;


    c_field_info = g_union_info_get_field (c_info, c_n);
    caml_field_info = Val_gifieldinfo (c_field_info);

    CAMLreturn (caml_field_info);
}

CAMLprim value
caml_g_iunioninfo_is_discriminated_c (value caml_unioninfo)
{
    CAMLparam1 (caml_unioninfo);
    GIUnionInfo *c_info;
    int c_is_discriminated;

    c_info = GIUnionInfo_val (caml_unioninfo);
    c_is_discriminated = g_union_info_is_discriminated (c_info);

    CAMLreturn (Val_bool (c_is_discriminated));
}

CAMLprim value
caml_g_iunioninfo_find_method_c (value caml_unioninfo,
                                 value caml_name)
{
    CAMLparam1 (caml_unioninfo);
    GIUnionInfo *c_info;
    GIFunctionInfo *c_function_info = NULL;
    const char *c_name;
    CAMLlocal1 (caml_function_info);

    c_info = GIUnionInfo_val (caml_unioninfo);
    c_name = String_val (caml_name);

    c_function_info = g_union_info_find_method (c_info, c_name);

    if (c_function_info == NULL)
        CAMLreturn (Val_none);
    else {
        caml_function_info = Val_gifunctioninfo (c_function_info);
        CAMLreturn (Val_some (caml_function_info));
    }
}
