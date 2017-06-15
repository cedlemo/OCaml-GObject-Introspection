open Ctypes
type t
val testconfig : t structure typ
val test_initialized: (bool, t structure) field
val test_quick: (bool, t structure) field
val test_perf: (bool, t structure) field
val test_verbose: (bool, t structure) field
val test_quiet: (bool, t structure) field
val test_undefined: (bool, t structure) field
