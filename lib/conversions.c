#include "conversions.h"

value
c_null_term_array_of_string_to_ocaml_string_list (char **strings)
{

    value cons;
    value cli;
    char *str = NULL;
    char **ptr = strings;
    cli = Val_emptylist;

    for ( ; *ptr != NULL; ptr++ )
    {
        str = *ptr;
        cons = caml_alloc (2, 0);

        Store_field (cons, 0, caml_copy_string(str));  // head
        Store_field (cons, 1, cli);                    // tail

        cli = cons;
    }

    return cli;
}
