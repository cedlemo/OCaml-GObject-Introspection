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

#include "conversions.h"

value
c_null_term_array_of_strings_to_ocaml_strings_list (char **c_strings)
{

    value caml_cons;
    value caml_cli;
    char *c_str = NULL;
    char **ptr = c_strings;
    caml_cli = Val_emptylist;

    for ( ; *ptr != NULL; ptr++ )
    {
        c_str = *ptr;
        caml_cons = caml_alloc (2, 0);

        Store_field (caml_cons, 0, caml_copy_string(c_str));  // head
        Store_field (caml_cons, 1, caml_cli);                 // tail

        caml_cli = caml_cons;
    }

    return caml_cli;
}

value
gslist_of_strings_to_ocaml_strings_list (GSList *c_list)
{

    GSList *c_iterator = NULL;
    value caml_cons;
    value caml_cli;
    char *c_str = NULL;
    caml_cli = Val_emptylist;

    for (c_iterator = c_list; c_iterator; c_iterator = c_iterator->next) {
        c_str = c_iterator->data;
        caml_cons = caml_alloc (2, 0);

        Store_field (caml_cons, 0, caml_copy_string(c_str));  // head
        Store_field (caml_cons, 1, caml_cli);                 // tail

        caml_cli = caml_cons;
    }

    return caml_cli;
}

value
glist_of_strings_to_ocaml_strings_list (GList *c_list)
{

    GList *c_iterator = NULL;
    value caml_cons;
    value caml_cli;
    char *c_str = NULL;
    caml_cli = Val_emptylist;

    for (c_iterator = c_list; c_iterator; c_iterator = c_iterator->next) {
        c_str = c_iterator->data;
        caml_cons = caml_alloc (2, 0);

        Store_field (caml_cons, 0, caml_copy_string(c_str));  // head
        Store_field (caml_cons, 1, caml_cli);                 // tail

        caml_cli = caml_cons;
    }

    return caml_cli;
}

value
val_some( value caml_v )
{
    CAMLparam1 (caml_v);
    CAMLlocal1 (caml_some);
    caml_some = caml_alloc (1, 0);
    Store_field (caml_some, 0, caml_v);

    CAMLreturn (caml_some);
}

void
raise_gerror_to_ocaml_failure_exception (GError *c_error)
{
    if(c_error == NULL)
        return;

    caml_failwith (c_error->message);
    g_clear_error (&c_error); // TODO : is it needed since we rise an exception ?
}
