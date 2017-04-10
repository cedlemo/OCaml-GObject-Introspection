#ifndef GIFUNCTIONINFO_STUBS_H
#define GIFUNCTIONINFO_STUBS_H

#include "conversions.h"
#include <girepository.h>

#define GIFunctionInfo_val(v) (*((GIFunctionInfo **) Data_custom_val(v)))
#define Val_gifunctioninfo(i) alloc_gifunctioninfo (i)

value
alloc_gifunctioninfo (GIFunctionInfo *i);

#endif // GIFUNCTIONINFO_STUBS_H
