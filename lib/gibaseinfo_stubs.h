#ifndef GIBASEINFO_STUBS_H
#define GIBASEINFO_STUBS_H

#include "conversions.h"
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
