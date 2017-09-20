(*
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
 *)

open OUnit2

let () =
  run_test_tt_main
  ("GObjectIntrospection" >:::
    [
      TestGIRepository.tests;
      TestGIBaseInfo.tests;
      TestGIFunctionInfo.tests;
      TestGIStructInfo.tests;
      TestGIUnionInfo.tests;
      TestGIFieldInfo.tests;
      TestGIEnumInfo.tests;
      TestGICallableInfo.tests;
      TestGIArgInfo.tests;
      TestGITypeInfo.tests;
      TestGIConstantInfo.tests;
      TestGIObjectInfo.tests;
      TestGIInterfaceInfo.tests;
      TestGIPropertyInfo.tests;
      TestGISignalInfo.tests;
      TestGIVFuncInfo.tests;
      TestGIRegisteredTypeInfo.tests;
      Test_loader.tests;
      (* TestBindConstant.tests;
      TestBindStruct.tests;
      TestBindUnion.tests;
      TestBindEnum.tests; *)
      TestBindFunction.tests;
      Test_binding_utils.tests
    ]
  )
