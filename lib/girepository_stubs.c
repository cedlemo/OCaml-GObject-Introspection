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
static value alloc_repository(GIRepository *r)
{
  value v = alloc_custom(&repository_ops, sizeof(GIRepository *), 0, 1);
  Repository_val(v) = r;
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

static value alloc_gitypelib(GITypelib *t)
{
  value v = alloc_custom(&gitypelib_ops, sizeof(GITypelib *), 0, 1);
  GITypelib_val(v) = t;
  return v;
}

static struct custom_operations gibaseinfo_ops = {
  "fr.github.cedlemo.gobject-introspection.gibaseinfo",
  custom_finalize_default,
  custom_compare_default,
  custom_hash_default,
  custom_serialize_default,
  custom_deserialize_default,
  custom_compare_ext_default
};

static value alloc_gibaseinfo(GIBaseInfo *i)
{
  value v = alloc_custom(&gibaseinfo_ops, sizeof(GIBaseInfo *), 0, 1);
  GIBaseInfo_val(v) = i;
  return v;
}

CAMLprim value
caml_g_irepository_get_default_c (value unit)
{
    CAMLparam1 (unit);

    GIRepository *repository;
    repository = g_irepository_get_default ();
    CAMLreturn (alloc_repository (repository));
}

CAMLprim value
caml_g_irepository_require_c (value caml_repository,
                              value caml_namespace)
{
    CAMLparam2 (caml_repository, caml_namespace);

    GIRepository *repository;
    GITypelib *typelib;
    const char *_namespace;

    repository = Repository_val (caml_repository);
    _namespace = String_val (caml_namespace);

    typelib = g_irepository_require (repository, _namespace, NULL, 0, NULL);

    /* TODO : support more arguments ?
     * repository A GIRepository or NULL for the singleton process-global
     *            default GIRepository.
     * namespace_ GI namespace to use, e.g. "Gtk"
     * version Version of namespace, may be NULL for latest.
     * flags Set of GIRepositoryLoadFlags, may be 0
     * error a GError.*/

     CAMLreturn (alloc_gitypelib (typelib));
}

CAMLprim value
caml_g_irepository_get_dependencies_c (value caml_repository,
                                       value caml_namespace)
{
    CAMLparam2 (caml_repository, caml_namespace);

    GIRepository *repository;
    const char *_namespace;
    char **c_dependencies;
    value dependencies;

    repository = Repository_val (caml_repository);
    _namespace = String_val (caml_namespace);

    c_dependencies = g_irepository_get_dependencies (repository, _namespace);

    dependencies = c_null_term_array_of_strings_to_ocaml_strings_list (c_dependencies);
    g_strfreev (c_dependencies);

    CAMLreturn (dependencies);
}

CAMLprim value
caml_g_irepository_get_immediate_dependencies_c (value caml_repository,
                                                 value caml_namespace)
{
    CAMLparam2 (caml_repository, caml_namespace);

    GIRepository *repository;
    const char *_namespace;
    char **c_dependencies;
    value dependencies;

    repository = Repository_val (caml_repository);
    _namespace = String_val (caml_namespace);

    c_dependencies = g_irepository_get_immediate_dependencies (repository, _namespace);

    dependencies = c_null_term_array_of_strings_to_ocaml_strings_list (c_dependencies);
    g_strfreev (c_dependencies);

    CAMLreturn (dependencies);
}

CAMLprim value
caml_g_irepository_get_n_infos_c (value caml_repository,
                                  value caml_namespace)
{
    CAMLparam2 (caml_repository, caml_namespace);

    GIRepository *repository;
    const char *_namespace;
    int c_n_infos = 0;

    repository = Repository_val (caml_repository);
    _namespace = String_val (caml_namespace);

    c_n_infos = g_irepository_get_n_infos (repository, _namespace);

    CAMLreturn (Int_val (c_n_infos));
}

CAMLprim value
caml_g_irepository_get_info_c (value caml_repository,
                               value caml_namespace,
                               value caml_index)
{
    CAMLparam3 (caml_repository, caml_namespace, caml_index);

    GIRepository *repository;
    const char *_namespace;
    int index = 0;
    GIBaseInfo *info = NULL;

    repository = Repository_val (caml_repository);
    _namespace = String_val (caml_namespace);
    index = Val_int (caml_index);

    info = g_irepository_get_info (repository, _namespace, index);

    CAMLreturn (alloc_gibaseinfo (info));
}

CAMLprim value
caml_g_irepository_get_loaded_namespaces_c (value caml_repository)
{
    CAMLparam1 (caml_repository);

    GIRepository *repository;
    char **c_namespaces;
    value namespaces;

    repository = Repository_val (caml_repository);

    c_namespaces = g_irepository_get_loaded_namespaces (repository);

    namespaces = c_null_term_array_of_strings_to_ocaml_strings_list (c_namespaces);
    g_strfreev (c_namespaces);

    CAMLreturn (namespaces);
}

CAMLprim value
caml_g_irepository_get_c_prefix_c (value caml_repository,
                                   value caml_namespace)
{
    CAMLparam2 (caml_repository, caml_namespace);

    GIRepository *repository;
    const char *c_prefix;
    const char *_namespace;

    repository = Repository_val (caml_repository);
    _namespace = String_val (caml_namespace);

    c_prefix = g_irepository_get_c_prefix (repository, _namespace);

    CAMLreturn (caml_copy_string (c_prefix));
}

CAMLprim value
caml_g_irepository_get_search_path_c (value unit)
{
    CAMLparam1 (unit);

    GSList *c_search_path = NULL;
    value search_path;

    c_search_path = g_irepository_get_search_path ();

    search_path = gslist_of_strings_to_ocaml_strings_list (c_search_path);

    CAMLreturn (search_path);
}

CAMLprim value
caml_g_irepository_enumerate_versions_c (value caml_repository,
                                         value caml_namespace)
{
    CAMLparam2 (caml_repository, caml_namespace);

    GIRepository *repository;
    const char *_namespace;
    GList *c_versions = NULL;
    value versions;
    repository = Repository_val (caml_repository);
    _namespace = String_val (caml_namespace);

    c_versions = g_irepository_enumerate_versions (repository, _namespace);
    versions = glist_of_strings_to_ocaml_strings_list (c_versions);

    CAMLreturn (versions);
}

CAMLprim value
caml_g_irepository_prepend_library_path_c (value caml_path)
{
    CAMLparam1 (caml_path);
    const char *path;

    path = String_val (caml_path);
    g_irepository_prepend_library_path (path);

    CAMLreturn (Val_unit);
}

CAMLprim value
caml_g_irepository_prepend_search_path_c (value caml_path)
{
    CAMLparam1 (caml_path);
    const char *path;

    path = String_val (caml_path);
    g_irepository_prepend_search_path (path);

    CAMLreturn (Val_unit);
}

CAMLprim value
caml_g_irepository_get_shared_library_c (value caml_repository,
                                         value caml_namespace)
{
    CAMLparam2 (caml_repository, caml_namespace);

    GIRepository *repository;
    const char *lib;
    const char *_namespace;

    repository = Repository_val (caml_repository);
    _namespace = String_val (caml_namespace);

    lib = g_irepository_get_shared_library (repository, _namespace);

    CAMLreturn (caml_copy_string (lib));
}

CAMLprim value
caml_g_irepository_get_version_c (value caml_repository,
                                  value caml_namespace)
{
    CAMLparam2 (caml_repository, caml_namespace);

    GIRepository *repository;
    const char *version;
    const char *_namespace;

    repository = Repository_val (caml_repository);
    _namespace = String_val (caml_namespace);

    version = g_irepository_get_version (repository, _namespace);

    CAMLreturn (caml_copy_string (version));
}

CAMLprim value
caml_g_irepository_get_typelib_path_c (value caml_repository,
                                       value caml_namespace)
{
    CAMLparam2 (caml_repository, caml_namespace);

    GIRepository *repository;
    const char *path;
    const char *_namespace;

    repository = Repository_val (caml_repository);
    _namespace = String_val (caml_namespace);

    path = g_irepository_get_typelib_path (repository, _namespace);

    CAMLreturn (caml_copy_string (path));
}
