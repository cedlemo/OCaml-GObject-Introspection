[![Build Status](https://travis-ci.org/cedlemo/OCaml-GObject-Introspection.svg?branch=master)](https://travis-ci.org/cedlemo/OCaml-GObject-Introspection)

# OCaml GObject-Introspection

The OCaml bindings to GObject-Introspection.

Documentation : https://cedlemo.github.io/OCaml-GObject-Introspection/.

## Resources

*  https://ocaml.org/learn/tutorials/calling_c_libraries.html
*  https://developer.gnome.org/gi/1.52/
*  https://developer.gnome.org/gi/1.52/GIRepository.html
*  https://ocaml.org/learn/tutorials/objects.html
*  http://caml.inria.fr/pub/docs/manual-ocaml/index.html
*  http://caml.inria.fr/pub/docs/manual-ocaml/intfc.html
*  http://www.linux-nantes.org/~fmonnier/OCaml/ocaml-wrapping-c.html (old)
*  https://wiki.haskell.org/GObjectIntrospection

## GError and OCaml exceptions

* https://developer.gnome.org/glib/unstable/glib-Error-Reporting.html
* http://www.linux-nantes.org/~fmonnier/OCaml/ocaml-wrapping-c.html#ref_exception
* http://caml.inria.fr/pub/docs/manual-ocaml/intfc.html#s:c-exceptions
* http://caml.inria.fr/pub/docs/manual-ocaml/intfc.html#s:register-exn

## Rules
  * variables that hold c values are prefixed with "c_"
  * varibales that hold caml values are prefixed with "caml_"

### TODO

  * create specific exceptions ?
  * how to wrap or use [g_irepository_find_by_error_domain](https://developer.gnome.org/gi/1.52/GIRepository.html#g-irepository-find-by-error-domain) ?

## Callback and OCaml exceptions

* http://caml.inria.fr/pub/docs/manual-ocaml/intfc.html#s:callback

### TODO
  * catch exceptions in callbacks ? (`caml_g_ibaseinfo_iterate_over_attributes_c`)

# Next:
