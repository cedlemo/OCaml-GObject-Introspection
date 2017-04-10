open OUnit2

let () =
  run_test_tt_main
  ("GObjectIntrospection" >:::
    [
      TestGIRepository.tests;
      TestGIBaseInfo.tests;
      TestGIFunctionInfo.tests
    ]
  )
