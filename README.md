[![Build Status](https://travis-ci.org/cedlemo/OCaml-GObject-Introspection.svg?branch=master)](https://travis-ci.org/cedlemo/OCaml-GObject-Introspection)

# OCaml GObject-Introspection

The OCaml bindings to GObject-Introspection with Ctypes.

Documentation : https://cedlemo.github.io/OCaml-GObject-Introspection/.

## Resources

*  https://ocaml.org/learn/tutorials/calling_c_libraries.html
*  https://developer.gnome.org/gi/
*  https://developer.gnome.org/gi/1.52/GIRepository.html
*  https://ocaml.org/learn/tutorials/objects.html
*  http://caml.inria.fr/pub/docs/manual-ocaml/index.html
*  http://caml.inria.fr/pub/docs/manual-ocaml/intfc.html
*  http://www.linux-nantes.org/~fmonnier/OCaml/ocaml-wrapping-c.html (old)
*  https://wiki.haskell.org/GObjectIntrospection

## Progress

  ### Started or finished

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

  ### Remains

  * GICallbackInfo — Struct representing a callback
  * GIRegisteredTypeInfo — Struct representing a struct with a GType

## G. Info Structures hierarchy and type coercion functions.

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

It determines the need to cast structures. For example `GIArgInfo` need only to
be casted to `GIBaseInfo`.

GIFunctionInfo need to be casted to `GICallableInfo` and to `GIBaseInfo`.

So each module will (except `GIBaseInfo`), will have functions for type coercion
like :

    GIArgInfo.to_baseinfo
    GIArgInfo.from_baseinfo
    GIFunctionInfo.to_baseinfo
    GIFunctionInfo.from_baseinfo
    GIFunctionInfo.to_callableinfo
    GIFunctionInfo.from_callableinfo


