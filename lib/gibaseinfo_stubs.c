#include "gibaseinfo_stubs.h"

static struct custom_operations gibaseinfo_ops = {
  "fr.github.cedlemo.gobject-introspection.gibaseinfo",
  custom_finalize_default,
  custom_compare_default,
  custom_hash_default,
  custom_serialize_default,
  custom_deserialize_default,
  custom_compare_ext_default
};
// TODO :  g_base_info_unref() has to be called
//
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
