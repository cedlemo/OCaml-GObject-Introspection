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

#include "girepository_stubs.h"
#include <girepository.h>

/* Encapsulation of opaque repository handles (of type GIRepository *)
   as OCaml custom blocks. */

static struct custom_operations repository_ops = {
  "fr.github.cedlemo.gobject-introspection.repository",
  custom_finalize_default,
  custom_compare_default,
  custom_hash_default,
  custom_serialize_default,
  custom_deserialize_default,
  custom_compare_ext_default
};

/* Allocating an OCaml custom block to hold the given GIRepository * */
static value
alloc_repository (GIRepository *r)
{
  value v = alloc_custom (&repository_ops, sizeof (GIRepository *), 0, 1);
  Repository_val (v) = r;
  return v;
}

static struct custom_operations gitypelib_ops = {
  "fr.github.cedlemo.gobject-introspection.gitypelib",
  custom_finalize_default,
  custom_compare_default,
  custom_hash_default,
  custom_serialize_default,
  custom_deserialize_default,
  custom_compare_ext_default
};

static value
alloc_gitypelib (GITypelib *t)
{
  value v = alloc_custom (&gitypelib_ops, sizeof (GITypelib *), 0, 1);
  GITypelib_val (v) = t;
  return v;
}

CAMLprim value
caml_g_irepository_get_default_c (value caml_unit)
{
    CAMLparam1 (caml_unit);

    GIRepository *c_repository;
    c_repository = g_irepository_get_default ();
    CAMLreturn (alloc_repository (c_repository));
}

CAMLprim value
caml_g_irepository_require_c (value caml_repository,
                              value caml_namespace)
{
    CAMLparam2 (caml_repository, caml_namespace);

    GIRepository *c_repository;
    GITypelib *c_typelib;
    const char *c_namespace;
    GError *c_error = NULL;

    c_repository = Repository_val (caml_repository);
    c_namespace = String_val (caml_namespace);

    c_typelib = g_irepository_require (c_repository,
                                       c_namespace,
                                       NULL, 0, &c_error);

    if(c_error != NULL)
        raise_gerror_to_ocaml_failure_exception (c_error);

    /* TODO : support more arguments ?
     * repository A GIRepository or NULL for the singleton process-global
     *            default GIRepository.
     * namespace_ GI namespace to use, e.g. "Gtk"
     * version Version of namespace, may be NULL for latest.
     * flags Set of GIRepositoryLoadFlags, may be 0
     * error a GError.*/

     CAMLreturn (alloc_gitypelib (c_typelib));
}

CAMLprim value
caml_g_irepository_get_dependencies_c (value caml_repository,
                                       value caml_namespace)
{
    CAMLparam2 (caml_repository, caml_namespace);

    GIRepository *c_repository;
    const char *c_namespace;
    char **c_dependencies;
    CAMLlocal1 (caml_dependencies);

    c_repository = Repository_val (caml_repository);
    c_namespace = String_val (caml_namespace);

    c_dependencies = g_irepository_get_dependencies (c_repository, c_namespace);

    caml_dependencies = c_null_term_array_of_strings_to_ocaml_strings_list (c_dependencies);
    g_strfreev (c_dependencies);

    CAMLreturn (caml_dependencies);
}

/* Travis GI version = 1.40. v should be >= 1.44
 * CAMLprim value
 * caml_g_irepository_get_immediate_dependencies_c (value caml_repository,
 *                                                  value caml_namespace)
 * {
 *     CAMLparam2 (caml_repository, caml_namespace);
 *
 *     GIRepository *c_repository;
 *     const char *c_namespace;
 *     char **c_dependencies;
 *     CAMLlocal1 (caml_dependencies);
 *
 *     c_repository = Repository_val (caml_repository);
 *     c_namespace = String_val (caml_namespace);
 *
 *     c_dependencies = g_irepository_get_immediate_dependencies (c_repository, c_namespace);
 *
 *     caml_dependencies = c_null_term_array_of_strings_to_ocaml_strings_list (c_dependencies);
 *     g_strfreev (c_dependencies);
 *
 *     CAMLreturn (caml_dependencies);
 * }
 */

CAMLprim value
caml_g_irepository_get_n_infos_c (value caml_repository,
                                  value caml_namespace)
{
    CAMLparam2 (caml_repository, caml_namespace);

    GIRepository *c_repository;
    const char *c_namespace;
    int c_n_infos = 0;

    c_repository = Repository_val (caml_repository);
    c_namespace = String_val (caml_namespace);

    c_n_infos = g_irepository_get_n_infos (c_repository, c_namespace);

    CAMLreturn (Int_val (c_n_infos));
}

CAMLprim value
caml_g_irepository_get_info_c (value caml_repository,
                               value caml_namespace,
                               value caml_index)
{
    CAMLparam3 (caml_repository, caml_namespace, caml_index);

    GIRepository *c_repository;
    const char *c_namespace;
    int c_index = 0;
    int c_n_max;
    GIBaseInfo *c_info = NULL;

    c_repository = Repository_val (caml_repository);
    c_namespace = String_val (caml_namespace);
    c_index = Val_int (caml_index);

    c_info = g_irepository_get_info (c_repository, c_namespace, c_index);
    c_n_max = g_irepository_get_n_infos (c_repository, c_namespace);

    if(c_index < 0 || c_index >= c_n_max)
        caml_failwith ("Array Index out of bounds");

    if(c_info != NULL) {
        CAMLlocal1 (caml_info);
        caml_info = alloc_gibaseinfo (c_info);
        CAMLreturn (Val_some (caml_info));
    }
    else
        CAMLreturn (Val_none);
}

CAMLprim value
caml_g_irepository_get_loaded_namespaces_c (value caml_repository)
{
    CAMLparam1 (caml_repository);

    GIRepository *c_repository;
    char **c_namespaces;
    CAMLlocal1 (caml_namespaces);

    c_repository = Repository_val (caml_repository);

    c_namespaces = g_irepository_get_loaded_namespaces (c_repository);

    caml_namespaces = c_null_term_array_of_strings_to_ocaml_strings_list (c_namespaces);
    g_strfreev (c_namespaces);

    CAMLreturn (caml_namespaces);
}

CAMLprim value
caml_g_irepository_get_c_prefix_c (value caml_repository,
                                   value caml_namespace)
{
    CAMLparam2 (caml_repository, caml_namespace);

    GIRepository *c_repository;
    const char *c_prefix;
    const char *c_namespace;

    c_repository = Repository_val (caml_repository);
    c_namespace = String_val (caml_namespace);

    c_prefix = g_irepository_get_c_prefix (c_repository, c_namespace);

    CAMLreturn (caml_copy_string (c_prefix));
}

CAMLprim value
caml_g_irepository_get_search_path_c (value caml_unit)
{
    CAMLparam1 (caml_unit);

    GSList *c_search_path = NULL;
    CAMLlocal1 (caml_search_path);

    c_search_path = g_irepository_get_search_path ();

    caml_search_path = gslist_of_strings_to_ocaml_strings_list (c_search_path);

    CAMLreturn (caml_search_path);
}

CAMLprim value
caml_g_irepository_enumerate_versions_c (value caml_repository,
                                         value caml_namespace)
{
    CAMLparam2 (caml_repository, caml_namespace);

    GIRepository *c_repository;
    const char *c_namespace;
    GList *c_versions = NULL;
    CAMLlocal1 (caml_versions);
    c_repository = Repository_val (caml_repository);
    c_namespace = String_val (caml_namespace);

    c_versions = g_irepository_enumerate_versions (c_repository, c_namespace);
    caml_versions = glist_of_strings_to_ocaml_strings_list (c_versions);

    CAMLreturn (caml_versions);
}

CAMLprim value
caml_g_irepository_prepend_library_path_c (value caml_path)
{
    CAMLparam1 (caml_path);
    const char *c_path;

    c_path = String_val (caml_path);
    g_irepository_prepend_library_path (c_path);

    CAMLreturn (Val_unit);
}

CAMLprim value
caml_g_irepository_prepend_search_path_c (value caml_path)
{
    CAMLparam1 (caml_path);
    const char *c_path;

    c_path = String_val (caml_path);
    g_irepository_prepend_search_path (c_path);

    CAMLreturn (Val_unit);
}

CAMLprim value
caml_g_irepository_get_shared_library_c (value caml_repository,
                                         value caml_namespace)
{
    CAMLparam2 (caml_repository, caml_namespace);

    GIRepository *c_repository;
    const char *c_lib;
    const char *c_namespace;

    c_repository = Repository_val (caml_repository);
    c_namespace = String_val (caml_namespace);

    c_lib = g_irepository_get_shared_library (c_repository, c_namespace);

    CAMLreturn (caml_copy_string (c_lib));
}

CAMLprim value
caml_g_irepository_get_version_c (value caml_repository,
                                  value caml_namespace)
{
    CAMLparam2 (caml_repository, caml_namespace);

    GIRepository *c_repository;
    const char *c_version;
    const char *c_namespace;

    c_repository = Repository_val (caml_repository);
    c_namespace = String_val (caml_namespace);

    c_version = g_irepository_get_version (c_repository, c_namespace);

    CAMLreturn (caml_copy_string (c_version));
}

CAMLprim value
caml_g_irepository_get_typelib_path_c (value caml_repository,
                                       value caml_namespace)
{
    CAMLparam2 (caml_repository, caml_namespace);

    GIRepository *c_repository;
    const char *c_path;
    const char *c_namespace;

    c_repository = Repository_val (caml_repository);
    c_namespace = String_val (caml_namespace);

    c_path = g_irepository_get_typelib_path (c_repository, c_namespace);

    CAMLreturn (caml_copy_string (c_path));
}

CAMLprim value
caml_g_irepository_find_by_name_c (value caml_repository,
                                   value caml_namespace,
                                   value caml_name)
{
    CAMLparam3 (caml_repository, caml_namespace, caml_name);

    GIRepository *c_repository;
    const char *c_namespace;
    const char *c_name;
    GIBaseInfo *c_info = NULL;
    CAMLlocal1 (caml_info);

    if(caml_repository == Val_none)
        c_repository = NULL;
    else
        c_repository = Repository_val (Some_val (caml_repository));

    c_namespace = String_val (caml_namespace);
    c_name = String_val (caml_name);

    c_info = g_irepository_find_by_name (c_repository, c_namespace, c_name);

    if(c_info != NULL) {
        caml_info = alloc_gibaseinfo (c_info);
        CAMLreturn (Val_some (caml_info));
    }
    else
        CAMLreturn (Val_none);
}
