#ifndef CONVERSIONS_H
#define CONVERSIONS_H

#include <stdio.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/custom.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include <glib.h>

value
c_null_term_array_of_strings_to_ocaml_strings_list (char **strings);

value
gslist_of_strings_to_ocaml_strings_list (GSList *list);

value
glist_of_strings_to_ocaml_strings_list (GList *list);

value
val_some (value v);

void
raise_gerror_to_ocaml_failure_exception (GError *error);

#define Val_none Val_int (0)
#define Val_some(v) val_some (v)
#define Some_val(v) Field(v,0)
#endif // CONVERSIONS_H
