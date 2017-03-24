#include "gobject_introspection_stubs.h"
#include <girepository.h>

CAMLprim value
caml_g_irepository_get_default_c (value unit)
{
    GIRepository *repository;
    repository = g_irepository_get_default ();
    return (value) repository;
}
