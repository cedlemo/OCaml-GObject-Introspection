open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "Test_config"
let f_test_initialized = field t_typ "test_initialized" (bool)
let f_test_quick = field t_typ "test_quick" (bool)
let f_test_perf = field t_typ "test_perf" (bool)
let f_test_verbose = field t_typ "test_verbose" (bool)
let f_test_quiet = field t_typ "test_quiet" (bool)
let f_test_undefined = field t_typ "test_undefined" (bool)

