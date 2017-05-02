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

  ### Remains

  * GICallbackInfo — Struct representing a callback
  * GISignalInfo — Struct representing a signal
  * GIVFuncInfo — Struct representing a virtual function
  * GIRegisteredTypeInfo — Struct representing a struct with a GType
  * GIObjectInfo — Struct representing a GObject
  * GIInterfaceInfo — Struct representing a GInterface
  * GIConstantInfo — Struct representing a constant
  * GIPropertyInfo — Struct representing a property
  * GITypeInfo — Struct representing a type
