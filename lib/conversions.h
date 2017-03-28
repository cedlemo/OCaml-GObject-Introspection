#ifndef CONVERSIONS_H
#define CONVERSIONS_H

#include <stdio.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/custom.h>

value
c_null_term_array_of_strings_to_ocaml_strings_list (char **strings);
#endif // CONVERSIONS_H
