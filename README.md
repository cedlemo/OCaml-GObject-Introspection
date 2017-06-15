[![Build Status](https://travis-ci.org/cedlemo/OCaml-GObject-Introspection.svg?branch=master)](https://travis-ci.org/cedlemo/OCaml-GObject-Introspection)
[![Build status](https://ci.appveyor.com/api/projects/status/jlsk9qhxffuq2h1y?svg=true)](https://ci.appveyor.com/project/cedlemo/ocaml-gobject-introspection)

# OCaml GObject-Introspection

The OCaml bindings to GObject-Introspection with Ctypes.

*  [Introduction](#introduction)
*  [Ctypes bindings of GObject-Introspection](#ctypes-bindings-of-gobject-introspection)
  *  [Progress](#progress)
    *  [Finished](#finished)
    *  [Remains](#remains)
  *  [Implementation details](#implementation-details)
    *  [GObjectIntrospection Info Structures hierarchy and type coercion functions](#gobjectintrospection-info-structures-hierarchy-and-type-coercion-functions)
    *  [How the underlying C structures allocation and deallocation are handled](#how-the-underlying-c-structures-allocation-and-deallocation-are-handled)
    *  [Resources](#resources)
*   [GObjectIntrospection Loader](#gobjectintrospection-loader)
  *  [Loader Implementation](#loader-implementation)
  *  [Loader Progress](#loader-progress)
    *  [Builders Started](#builders-started)
    *  [Builders Next](#builders-next)

## TODOS


## Introduction

There are 2 parts :
*  the Ctypes bindings to the GObject-Introspection (all the files/modules named
GISomething).
*  a Loader module that uses the Ctypes bindings of GObject-Introspection in order
to automatically generate Ctypes bindings of a GObject-Introspection namespace (`GLib`
for example.

API Documentation : https://cedlemo.github.io/OCaml-GObject-Introspection/.

## Ctypes bindings of GObject-Introspection

### Progress

  #### Finished

  * GIRepository — GObject Introspection repository manager
  * GIBaseInfo — Base struct for all GITypelib structs
  * GIFunctionInfo — Struct representing a function
  * GIStructInfo — Struct representing a C structure
  * GIFieldInfo — Struct representing a struct or union field
  * GIUnionInfo — Struct representing a union.
  * GIEnumInfo — Structs representing an enumeration and its values
  * GIValueInfo — Struct representing a value
  * GICallableInfo — Struct representing a callable
  * GIArgInfo — Struct representing an argument
  * GITypeInfo — Struct representing a type
  * GIConstantInfo — Struct representing a constant
  * GIObjectInfo — Struct representing a GObject
  * GIInterfaceInfo — Struct representing a GInterface
  * GIPropertyInfo — Struct representing a property
  * GISignalInfo — Struct representing a signal
  * GIVFuncInfo — Struct representing a virtual function
  * GIRegisteredTypeInfo — Struct representing a struct with a GType

  #### Remains

  * GICallbackInfo — Struct representing a callback (no C API for now).

### Implementation details
#### GObjectIntrospection Info Structures hierarchy and type coercion functions

     GIBaseInfo
       +----GIArgInfo
       +----GICallableInfo
             +----GIFunctionInfo
             +----GISignalInfo
             +----GIVFuncInfo
       +----GIConstantInfo
       +----GIFieldInfo
       +----GIPropertyInfo
       +----GIRegisteredTypeInfo
             +----GIEnumInfo
             +----GIInterfaceInfo
             +----GIObjectInfo
             +----GIStructInfo
             +----GIUnionInfo
       +----GITypeInfo

The hirearchy determines the need to cast structures. For example `GIArgInfo`
need only to be casted to `GIBaseInfo`.

GIFunctionInfo need to be casted to `GICallableInfo` and to `GIBaseInfo`.

So each module will (except `GIBaseInfo`), will have functions for type coercion
like :

    GIArgInfo.to_baseinfo
    GIArgInfo.from_baseinfo
    GIFunctionInfo.to_baseinfo
    GIFunctionInfo.from_baseinfo
    GIFunctionInfo.to_callableinfo
    GIFunctionInfo.from_callableinfo

#### How the underlying C structures allocation and deallocation are handled

When an info structure pointer is returned with full transfert via the C api,
each OCaml value that wrap then is finalised with `Gc.finalise` for example :


    let get_field info n =
      let get_field_raw =
        foreign "g_struct_info_get_field"
          (ptr structinfo @-> int @-> returning (ptr GIFieldInfo.fieldinfo)) in
      let max = get_n_fields info in
      if (n < 0 || n >= max) then raise (Failure "Array Index out of bounds")
      else let info' = get_field_raw info n in
        GIFieldInfo.add_unref_finaliser info'


So when the `info'` is garbage collected, the `GIFieldInfo.add_unref_finaliser` is
called. Here is the code of this function :


    let add_unref_finaliser info =
      let _ = Gc.finalise (fun i ->
          let i' = cast_to_baseinfo i in
          GIBaseInfo.base_info_unref i') info
      in info

Each info module have this kind of function but the user should not use them.
When a cast need to be done, each module have the following to functions:

*  to_baseinfo
*  from_baseinfo

Those functions allow to transform an OCaml value that represents a GIInfo to
another GIInfo type while the underlying C structure are ref"ed" and linked to
a Gc finaliser that unref them. This should avoid zombies OCaml values (with
C structure already desallocated) and memory leaks.

#### Resources

*  https://ocaml.org/learn/tutorials/calling_c_libraries.html
*  https://developer.gnome.org/gi/
*  https://developer.gnome.org/gi/1.52/GIRepository.html
*  https://ocaml.org/learn/tutorials/objects.html
*  http://caml.inria.fr/pub/docs/manual-ocaml/index.html
*  http://caml.inria.fr/pub/docs/manual-ocaml/intfc.html
*  http://www.linux-nantes.org/~fmonnier/OCaml/ocaml-wrapping-c.html (old)
*  https://wiki.haskell.org/GObjectIntrospection

## GObjectIntrospection Loader

The Loader module is used to load a namespace and generate automatically most
of the Ctypes bindings. Here is the `samples/gi_builder_glib.ml` code :

```
let print_infos loader =
  let namespace = Loader.get_namespace loader in
  let version = Loader.get_version loader in
  print_endline (">> " ^ namespace);
  print_endline ("\t - version :" ^ version)

let () =
  match Loader.load "GLib" () with
  | None -> print_endline "Please check the namespace, something is wrong"
  | Some loader -> print_infos loader;
    let loader = Loader.set_build_path loader "samples" in
    Loader.parse loader
```

It generates the GLib bindings (not all for now) in `samples/GLib/lib`

### Loader Implementation
The idea is to iterate through all the toplevel baseinfo of the namespace and
generate the related Ctypes bindings automatically. The loader use the `Builder`
module which relies on the `Builder*` modules (BuilderStructure for example).

### Loader Progress

  #### Builders Started

  * Module constants
  * Structures
  * Unions
  * Enumerations

  #### Builders Next

  * Flags (enumerations but handled as list).
  * Module functions

## TODOS :

  *  test Windows build with appveyor:
    *  install MSYS2
    *  install gobject-introspection
    *  install gtk
    *  install opam
    *  install OCaml
    * resources:
      * https://github.com/behdad/harfbuzz/pull/308/commits/610377e89fe6d9c6dc53aca939fe4c2429375fc2
      * https://project-renard.github.io/doc/development/meeting-log/posts/2016/05/03/windows-build-with-msys2/
