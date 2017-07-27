[![Build Status](https://travis-ci.org/cedlemo/OCaml-GObject-Introspection.svg?branch=master)](https://travis-ci.org/cedlemo/OCaml-GObject-Introspection)
[![Build status](https://ci.appveyor.com/api/projects/status/jlsk9qhxffuq2h1y?svg=true)](https://ci.appveyor.com/project/cedlemo/ocaml-gobject-introspection)

# OCaml GObject-Introspection

The OCaml bindings to GObject-Introspection with Ctypes.

The idea is to use the GObject-Introspection information in order to generate a
configurable loader that will be able to construct automatically most of the
Ctypes bindings of any C GObject libraries (not all but at least a big part).

## Wiki :

https://github.com/cedlemo/OCaml-GObject-Introspection/wiki#introduction

###  table of content.

- [Introduction](https://github.com/cedlemo/OCaml-GObject-Introspection/wiki#introduction)
- [Ctypes bindings of GObject-Introspection](wiki/Ctypes-bindings-of-GObject-Introspection#finished)
  - [Implementation details](https://github.com/cedlemo/OCaml-GObject-Introspection/wiki/Ctypes-bindings-of-GObject-Introspection#implementation-details)
    - [GObjectIntrospection Info Structures hierarchy and type coercion functions](https://github.com/cedlemo/OCaml-GObject-Introspection/wiki/Ctypes-bindings-of-GObject-Introspection#gobjectintrospection-info-structures-hierarchy-and-type-coercion-functions)
    - [How the underlying C structures allocation and deallocation are handled](https://github.com/cedlemo/OCaml-GObject-Introspection/wiki/Ctypes-bindings-of-GObject-Introspection#how-the-underlying-c-structures-allocation-and-deallocation-are-handled)
  - [Progress](https://github.com/cedlemo/OCaml-GObject-Introspection/wiki/Ctypes-bindings-of-GObject-Introspection#progress)
    - [Finished](https://github.com/cedlemo/OCaml-GObject-Introspection/wiki/Ctypes-bindings-of-GObject-Introspection#finished)
    - [Remains](https://github.com/cedlemo/OCaml-GObject-Introspection/wiki/Ctypes-bindings-of-GObject-Introspection#remains)
  - [Resources](https://github.com/cedlemo/OCaml-GObject-Introspection/wiki/Ctypes-bindings-of-GObject-Introspection#resources)
- [GObjectIntrospection Loader](https://github.com/cedlemo/OCaml-GObject-Introspection/wiki/GObjectIntrospection-Loader.)
  - [Loader Implementation](https://github.com/cedlemo/OCaml-GObject-Introspection/wiki/GObjectIntrospection-Loader.#loader-implementation)
  - [Loader Progress](https://github.com/cedlemo/OCaml-GObject-Introspection/wiki/GObjectIntrospection-Loader.#loader-progress)
    - [Builders Started](https://github.com/cedlemo/OCaml-GObject-Introspection/wiki/GObjectIntrospection-Loader.#builders-started)
    - [Builders Next](https://github.com/cedlemo/OCaml-GObject-Introspection/wiki/GObjectIntrospection-Loader.#builders-next)
  - [Builder Code rules](https://github.com/cedlemo/OCaml-GObject-Introspection/wiki/GObjectIntrospection-Loader.#builder-code-rules)
    - [Module constants](https://github.com/cedlemo/OCaml-GObject-Introspection/wiki/GObjectIntrospection-Loader.#module-constants)
    - [Structures and Unions](https://github.com/cedlemo/OCaml-GObject-Introspection/wiki/GObjectIntrospection-Loader.#structures-and-unions)
    - [Enumerations](https://github.com/cedlemo/OCaml-GObject-Introspection/wiki/GObjectIntrospection-Loader.#enumerations)
      - [Simple Enumerations](https://github.com/cedlemo/OCaml-GObject-Introspection/wiki/GObjectIntrospection-Loader.#simple-enumerations)
      - [Flags : enumerations for bitwise operations](https://github.com/cedlemo/OCaml-GObject-Introspection/wiki/GObjectIntrospection-Loader.#flags--enumerations-for-bitwise-operations)

## TODOS :

  * Find the problem with jbuilder and Travis. Why can I run the tests under
    ArchLinux but not on Travis

  * for GObject-Introspection, I need
    * C array views
    * GArray views
    * one view for element types `GITypeInfo.get_param_type info 0`
    * how to handle this and the GLib2 builder.

  * Write down the process to function bindings generation then implement it.
  * Create test in Samples/GLib/tests
    * for enum and flags
  * test Windows build with appveyor:
    * install MSYS2
    * install gobject-introspection
    * install gtk
    * install opam
    * install OCaml
    * resources:
      * https://github.com/behdad/harfbuzz/pull/308/commits/610377e89fe6d9c6dc53aca939fe4c2429375fc2
      * https://project-renard.github.io/doc/development/meeting-log/posts/2016/05/03/windows-build-with-msys2/
