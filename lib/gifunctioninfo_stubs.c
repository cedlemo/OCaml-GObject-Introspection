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
alloc_gifunctioninfo (GIFunctionInfo *i)
{
    g_base_info_ref ((GIBaseInfo *)i);
    value v = alloc_custom(&gifunctioninfo_ops, sizeof (GIFunctionInfo *), 0, 1);
    GIFunctionInfo_val (v) = i;
    return v;
}

CAMLprim value
caml_g_ifunctioninfo_get_flags_c (value caml_functioninfo)
{
    CAMLparam1 (caml_functioninfo);

    GIFunctionInfo *c_info;
    int flags;

    c_info = GIFunctionInfo_val (caml_functioninfo);
    flags = g_function_info_get_flags (c_info);

    CAMLreturn (Val_int (flags));
}

CAMLprim value
caml_g_ifunctioninfo_get_symbol_c (value caml_functioninfo)
{
    CAMLparam1 (caml_functioninfo);

    GIFunctionInfo *c_info;
    const char *c_symbol;

    c_info = GIFunctionInfo_val (caml_functioninfo);
    c_symbol = g_function_info_get_symbol (c_info);

    CAMLreturn (caml_copy_string (c_symbol));
}
