/*
 * Copyright 2017 Cedric LE MOIGNE, cedlemo@gmx.com
 * This file is part of OCaml-GObject-Introspection.
 *
 * OCaml-GObject-Introspection is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * any later version.
 *
 * OCaml-GObject-Introspection is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with OCaml-GObject-Introspection.  If not, see <http://www.gnu.org/licenses/>.
 */

#ifndef GIREPOSITORY_STUBS_H
#define GIREPOSITORY_STUBS_H

#include "gibaseinfo_stubs.h"
#include "utils.h"

/* Accessing the Repository * part of an OCaml custom block */
#define Repository_val(v) (*((GIRepository **) Data_custom_val(v)))
#define GITypelib_val(v) (*((GITypelib **) Data_custom_val(v)))

CAMLprim value
caml_g_irepository_get_default_c (value unit);

CAMLprim value
caml_g_irepository_require_c (value repository, value _namespace);

CAMLprim value
caml_g_irepository_get_dependencies_c (value repository, value _namespace);

/* Travis GI version = 1.40. v should be >= 1.44
 * CAMLprim value
 * caml_g_irepository_get_immediate_dependencies_c (value repository, value _namespace);
 */
CAMLprim value
caml_g_irepository_get_n_infos_c (value repository, value _namespace);

CAMLprim value
caml_g_irepository_get_info_c (value repository, value _namespace, value index);

CAMLprim value
caml_g_irepository_get_loaded_namespaces_c (value repository);

CAMLprim value
caml_g_irepository_get_c_prefix_c (value repository, value _namespace);

CAMLprim value
caml_g_irepository_enumerate_versions_c (value repository, value _namespace);

CAMLprim value
caml_gi_irepository_preprend_library_path_c (value path);

CAMLprim value
caml_gi_irepository_preprend_search_path_c (value path);

CAMLprim value
caml_g_irepository_get_shared_library_c (value repository, value _namespace);

CAMLprim value
caml_g_irepository_get_version_c (value repository, value _namespace);

CAMLprim value
caml_g_irepository_get_search_path_c (value unit);

CAMLprim value
caml_g_irepository_get_typelib_path_c (value repository, value _namespace);

CAMLprim value
caml_gi_irepository_find_by_name_c (value repository, value _namespace, value name);
/*
 * done GIRepository *	g_irepository_get_default ()
 * done gchar **	g_irepository_get_dependencies ()
 * done gchar **	g_irepository_get_immediate_dependencies ()
 * done gchar **	g_irepository_get_loaded_namespaces ()
 * done gint	g_irepository_get_n_infos ()
 * done GIBaseInfo *	g_irepository_get_info ()
 *      GOptionGroup *	g_irepository_get_option_group ()
 * done GList *	g_irepository_enumerate_versions ()
 * done void	g_irepository_prepend_library_path ()
 * done void	g_irepository_prepend_search_path ()
 *      GSList *	g_irepository_get_search_path ()
 *      const char *	g_irepository_load_typelib ()
 * done const gchar *	g_irepository_get_typelib_path ()
 *      gboolean	g_irepository_is_registered ()
 * done GITypelib *	g_irepository_require ()
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
#endif // GIREPOSITORY_STUBS_H
