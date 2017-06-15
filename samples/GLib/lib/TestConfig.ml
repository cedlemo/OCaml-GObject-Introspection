open Ctypes
open Foreign
type t
let testconfig : t structure typ = structure "TestConfig"
let test_initialized = field testconfig "test_initialized" (bool)
let test_quick = field testconfig "test_quick" (bool)
let test_perf = field testconfig "test_perf" (bool)
let test_verbose = field testconfig "test_verbose" (bool)
let test_quiet = field testconfig "test_quiet" (bool)
let test_undefined = field testconfig "test_undefined" (bool)
let _ = seal testconfig
