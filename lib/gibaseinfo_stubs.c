#include "gibaseinfo_stubs.h"

static void
finalize_gibaseinfo (value v)
{
    GIBaseInfo *info = NULL;
    info = GIBaseInfo_val (v);

    if (info != NULL)
      g_base_info_unref (info);
}

static struct custom_operations gibaseinfo_ops = {
    identifier:  "fr.github.cedlemo.gobject-introspection.gibaseinfo",
    finalize:    finalize_gibaseinfo,
    compare:     custom_compare_default,
    hash:        custom_hash_default,
    serialize:   custom_serialize_default,
    deserialize: custom_deserialize_default
};

value
alloc_gibaseinfo (GIBaseInfo *i)
{
  value v = alloc_custom(&gibaseinfo_ops, sizeof(GIBaseInfo *), 0, 1);
  GIBaseInfo_val(v) = i;
  return v;
}

CAMLprim value
caml_g_ibaseinfo_get_name_c (value caml_baseinfo)
{
    CAMLparam1 (caml_baseinfo);

    GIBaseInfo * c_info;
    const char *name;

    c_info = GIBaseInfo_val (caml_baseinfo);

    name = g_base_info_get_name (c_info);
    CAMLreturn(caml_copy_string (name));
}

CAMLprim value
caml_g_ibaseinfo_get_type_c (value caml_baseinfo)
{
    CAMLparam1 (caml_baseinfo);

    GIBaseInfo * c_info;
    int type;

    c_info = GIBaseInfo_val (caml_baseinfo);

    type = g_base_info_get_type (c_info);
    CAMLreturn(Val_int (type));
}
