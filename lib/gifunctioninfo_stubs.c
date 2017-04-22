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

#include "gifunctioninfo_stubs.h"

static void
finalize_gifunctioninfo (value v)
{
    GIFunctionInfo *info = NULL;
    info = GIFunctionInfo_val (v);

    if (info != NULL)
        g_base_info_unref ((GIBaseInfo *)info);
}

static struct custom_operations gifunctioninfo_ops = {
    identifier:  "fr.github.cedlemo.gobject-introspection.gifunctioninfo",
    finalize:    finalize_gifunctioninfo,
    compare:     custom_compare_default,
    hash:        custom_hash_default,
    serialize:   custom_serialize_default,
    deserialize: custom_deserialize_default
};

value
alloc_gifunctioninfo_from_base_info (GIBaseInfo *i)
{
    g_base_info_ref (i);
    value v = alloc_custom(&gifunctioninfo_ops, sizeof (GIFunctionInfo *), 0, 1);
    GIFunctionInfo_val (v) = (GIFunctionInfo *)i;
    return v;
}

value
alloc_gifunctioninfo (GIFunctionInfo *i)
{
    value v = alloc_custom(&gifunctioninfo_ops, sizeof (GIFunctionInfo *), 0, 1);
    GIFunctionInfo_val (v) = i;
    return v;
}

CAMLprim value
caml_g_function_info_get_flags_c (value caml_functioninfo)
{
    CAMLparam1 (caml_functioninfo);
    CAMLlocal2 (caml_list, caml_cons);

    GIFunctionInfo *c_info;
    GIFunctionInfoFlags c_flags;

    c_info = GIFunctionInfo_val (caml_functioninfo);
    c_flags = g_function_info_get_flags (c_info);
    caml_list = Val_emptylist;

    if (c_flags & GI_FUNCTION_IS_METHOD) {
        caml_cons = caml_alloc (2, 0);
        Store_field (caml_cons, 0, Val_int (0));
        Store_field (caml_cons, 1, caml_list);
        caml_list = caml_cons;
    }
    if (c_flags & GI_FUNCTION_IS_CONSTRUCTOR) {
        caml_cons = caml_alloc (2, 0);
        Store_field (caml_cons, 0, Val_int (1));
        Store_field (caml_cons, 1, caml_list);
        caml_list = caml_cons;
    }
    if (c_flags & GI_FUNCTION_IS_GETTER) {
        caml_cons = caml_alloc (2, 0);
        Store_field (caml_cons, 0, Val_int (2));
        Store_field (caml_cons, 1, caml_list);
        caml_list = caml_cons;
    }
    if (c_flags & GI_FUNCTION_IS_SETTER) {
        caml_cons = caml_alloc (2, 0);
        Store_field (caml_cons, 0, Val_int (3));
        Store_field (caml_cons, 1, caml_list);
        caml_list = caml_cons;
    }
    if (c_flags & GI_FUNCTION_WRAPS_VFUNC) {
        caml_cons = caml_alloc (2, 0);
        Store_field (caml_cons, 0, Val_int (4));
        Store_field (caml_cons, 1, caml_list);
        caml_list = caml_cons;
    }
    if (c_flags & GI_FUNCTION_THROWS) {
        caml_cons = caml_alloc (2, 0);
        Store_field (caml_cons, 0, Val_int (5));
        Store_field (caml_cons, 1, caml_list);
        caml_list = caml_cons;
    }

    CAMLreturn (caml_list);
}

#define BUILD_ENUM_VAL_CHECKER(val_name, VAL_NAME)\
CAMLprim value \
caml_g_function_info_##val_name##_c (value caml_functioninfo)\
{  \
    CAMLparam1 (caml_functioninfo); \
 \
    GIFunctionInfo *c_info; \
    GIFunctionInfoFlags c_flags; \
 \
    c_info = GIFunctionInfo_val (caml_functioninfo); \
    c_flags = g_function_info_get_flags (c_info); \
 \
    if (c_flags & GI_FUNCTION_##VAL_NAME) \
        CAMLreturn (Val_bool (1)); \
    else \
        CAMLreturn (Val_bool (0)); \
}

BUILD_ENUM_VAL_CHECKER(is_method, IS_METHOD)
BUILD_ENUM_VAL_CHECKER(is_constructor, IS_CONSTRUCTOR)
BUILD_ENUM_VAL_CHECKER(is_getter, IS_GETTER)
BUILD_ENUM_VAL_CHECKER(is_setter, IS_SETTER)
BUILD_ENUM_VAL_CHECKER(wraps_vfunc, WRAPS_VFUNC)
BUILD_ENUM_VAL_CHECKER(throws, THROWS)
#undef BUILD_ENUM_VAL_CHECKER

CAMLprim value
caml_g_function_info_get_symbol_c (value caml_functioninfo)
{
    CAMLparam1 (caml_functioninfo);

    GIFunctionInfo *c_info;
    const char *c_symbol;

    c_info = GIFunctionInfo_val (caml_functioninfo);
    c_symbol = g_function_info_get_symbol (c_info);

    CAMLreturn (caml_copy_string (c_symbol));
}
