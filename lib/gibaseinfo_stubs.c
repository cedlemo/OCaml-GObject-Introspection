#include "gibaseinfo_stubs.h"
#include "gifunctioninfo_stubs.h"

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
    CAMLlocal1(ret);
    int block_tag;

    c_info = GIBaseInfo_val (caml_baseinfo);

    type = g_base_info_get_type (c_info);
    switch(type) {
    case GI_INFO_TYPE_FUNCTION:
        block_tag = 0; // see GIBaseInfo.ml in order to match the tag block
        ret = caml_alloc (1, block_tag);
        Store_field (ret, 0, alloc_gifunctioninfo ((GIFunctionInfo *) c_info));
        break;
    default:
        ret = Val_int (type);
        break;
    }

    CAMLreturn (ret);
}

CAMLprim value
caml_g_ibaseinfo_equal_c (value caml_baseinfo1,
                          value caml_baseinfo2)
{
    CAMLparam2 (caml_baseinfo1, caml_baseinfo2);

    GIBaseInfo * c_info1;
    GIBaseInfo * c_info2;
    int is_equal = 0;

    c_info1 = GIBaseInfo_val (caml_baseinfo1);
    c_info2 = GIBaseInfo_val (caml_baseinfo2);

    is_equal = g_base_info_equal (c_info1, c_info2);
    CAMLreturn(Val_bool (is_equal));
}

CAMLprim value
caml_g_ibaseinfo_get_namespace_c (value caml_baseinfo)
{
    CAMLparam1 (caml_baseinfo);

    GIBaseInfo * c_info;
    const char *namespace;

    c_info = GIBaseInfo_val (caml_baseinfo);

    namespace = g_base_info_get_namespace (c_info);
    CAMLreturn(caml_copy_string (namespace));
}

CAMLprim value
caml_g_ibaseinfo_iterate_over_attributes_c (value caml_baseinfo,
                                            value caml_callback)
{
    CAMLparam2 (caml_baseinfo, caml_callback);

    GIBaseInfo * c_info;
    GIAttributeIter iter = { 0, };
    char *c_name;
    char *c_value;

    c_info = GIBaseInfo_val (caml_baseinfo);

    while (g_base_info_iterate_attributes (c_info, &iter, &c_name, &c_value))
    {
        value caml_name = caml_copy_string (c_name);
        value caml_value = caml_copy_string (c_value);

        value callback_return = caml_callback2 (caml_callback,
                                                caml_name,
                                                caml_value);

        if(Bool_val (callback_return) == 0)
            CAMLreturn (Val_unit);
    }

    CAMLreturn (Val_unit);
}

CAMLprim value
caml_g_ibaseinfo_get_container_c (value caml_baseinfo)
{
    CAMLparam1 (caml_baseinfo);

    GIBaseInfo * c_info;
    GIBaseInfo * c_container;

    c_info = GIBaseInfo_val (caml_baseinfo);

    c_container = g_base_info_get_container (c_info);
    // Increase ref count because g_base_info_get_container is transfert none
    // https://developer.gnome.org/gi/1.52/gi-GIBaseInfo.html#g-base-info-get-container
    // and finalize_gibaseinfo unref the baseinfo
    if(c_container != NULL)
        g_base_info_ref (c_container);

    value caml_container = alloc_gibaseinfo (c_container);

    CAMLreturn (caml_container);
}

CAMLprim value
caml_g_ibaseinfo_is_deprecated_c (value caml_baseinfo)
{
    CAMLparam1 (caml_baseinfo);

    GIBaseInfo * c_info;
    int c_is_deprecated = 0;

    c_info = GIBaseInfo_val (caml_baseinfo);
    c_is_deprecated = g_base_info_is_deprecated (c_info);

    CAMLreturn (Val_bool (c_is_deprecated));
}
