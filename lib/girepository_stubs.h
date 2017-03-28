#ifndef GIREPOSITORY_STUBS_H
#define GIREPOSITORY_STUBS_H

#include "conversions.h"
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
caml_g_irepository_get_dependencies_c (value repository, value _namespace);

CAMLprim value
caml_g_irepository_get_c_prefix_c (value repository, value _namespace);

CAMLprim value
caml_gi_irepository_preprend_library_path_c (value path);

CAMLprim value
caml_gi_irepository_preprend_search_path_c (value path);

CAMLprim value
caml_g_irepository_get_shared_library_c (value repository, value _namespace);

CAMLprim value
caml_g_irepository_get_version_c (value repository, value _namespace);

CAMLprim value
caml_g_irepository_get_typelib_path_c (value repository, value _namespace);

/*
 * done GIRepository *	g_irepository_get_default ()
 *      gchar **	g_irepository_get_dependencies ()
 *      gchar **	g_irepository_get_immediate_dependencies ()
 *      gchar **	g_irepository_get_loaded_namespaces ()
 *      gint	g_irepository_get_n_infos ()
 *      GIBaseInfo *	g_irepository_get_info ()
 *      GOptionGroup *	g_irepository_get_option_group ()
 *      GList *	g_irepository_enumerate_versions ()
 *      void	g_irepository_prepend_library_path ()
 *      void	g_irepository_prepend_search_path ()
 *      GSList *	g_irepository_get_search_path ()
 *      const char *	g_irepository_load_typelib ()
 * done const gchar *	g_irepository_get_typelib_path ()
 *      gboolean	g_irepository_is_registered ()
 *      GITypelib *	g_irepository_require ()
 *      GITypelib *	g_irepository_require_private ()
 * done const gchar *	g_irepository_get_c_prefix ()
 * done const gchar *	g_irepository_get_shared_library ()
 * done const gchar *	g_irepository_get_version ()
 *      GIBaseInfo *	g_irepository_find_by_gtype ()
 *      GIEnumInfo *	g_irepository_find_by_error_domain ()
 *      GIBaseInfo *	g_irepository_find_by_name ()
 *      gboolean	g_irepository_dump ()
 *      void	gi_cclosure_marshal_generic ()
*/
#endif // #define GIREPOSITORY_STUBS_H
