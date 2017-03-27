#include <stdio.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/custom.h>

/* Accessing the Repository * part of an OCaml custom block */
#define Repository_val(v) (*((GIRepository **) Data_custom_val(v)))
#define GITypelib_val(v) (*((GITypelib **) Data_custom_val(v)))

CAMLprim value
caml_g_irepository_get_default_c (value unit);

CAMLprim value
caml_g_irepository_require_c (value repository, value _namespace);

CAMLprim value
caml_g_irepository_get_c_prefix_c (value repository, value _namespace);

CAMLprim value
caml_g_irepository_get_shared_library_c (value repository, value _namespace);

CAMLprim value
caml_g_irepository_get_version_c (value repository, value _namespace);

CAMLprim value
caml_g_irepository_get_typelib_path_c (value repository, value _namespace);
