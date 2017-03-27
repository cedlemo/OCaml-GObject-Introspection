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

/* Allocating an OCaml custom block to hold the given WINDOW * */
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
