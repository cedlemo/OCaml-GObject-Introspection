#ifndef GISTRUCTINFO_STUBS_H
#define GISTRUCTINFO_STUBS_H

#include "conversions.h"
#include <girepository.h>

#define GIStructInfo_val(v) (*((GIStructInfo **) Data_custom_val(v)))
#define Val_gistructinfo(i) alloc_gistructinfo (i)

value
alloc_gistructinfo (GIStructInfo *i);

CAMLprim value
caml_g_istructinfo_get_alignment_c (value structinfo);
#endif // GISTRUCTINFO_STUBS_H
