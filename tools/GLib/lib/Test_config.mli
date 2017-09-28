open Ctypes

type t
val t_typ : t structure typ
val f_test_initialized: (bool, t structure) field
val f_test_quick: (bool, t structure) field
val f_test_perf: (bool, t structure) field
val f_test_verbose: (bool, t structure) field
val f_test_quiet: (bool, t structure) field
val f_test_undefined: (bool, t structure) field

