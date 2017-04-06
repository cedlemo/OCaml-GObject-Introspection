#ifndef CONVERSIONS_H
#define CONVERSIONS_H

#include <stdio.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/custom.h>
#include <glib.h>

value
c_null_term_array_of_strings_to_ocaml_strings_list (char **strings);

value
gslist_of_strings_to_ocaml_strings_list (GSList *list);

value
glist_of_strings_to_ocaml_strings_list (GList *list);

value
val_some (value v);

#define Val_none Val_int (0)
#define Val_some (v) val_some (v)

#endif // CONVERSIONS_H
