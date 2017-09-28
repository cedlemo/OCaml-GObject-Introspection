# TOOLS

## glib_raw_generator.ml

It is a `GLib` GObject-Introspection loader. It generates raw bindings of the
GLib library that will be used to bootstrap an `OCaml-glib2` module.

### Build :

```
jbuilder build tools/glib_raw_generator.exe
./build/default/tools/glib_raw_generator.exe
```

It generates the bindings in *tools/GLib/lib*. Those raw bindings are used
here : https://github.com/cedlemo/OCaml-GLib2.
