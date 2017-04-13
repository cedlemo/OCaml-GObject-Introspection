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
