#ifndef GISTRUCTINFO_STUBS_H
#define GISTRUCTINFO_STUBS_H

#include "conversions.h"
#include <girepository.h>

#define GIStructInfo_val(v) (*((GIStructInfo **) Data_custom_val(v)))
#define Val_gistructinfo(i) alloc_gistructinfo (i)

value
alloc_gistructinfo (GIStructInfo *i);
#endif // GISTRUCTINFO_STUBS_H
