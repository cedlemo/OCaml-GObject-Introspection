open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "Test_suite"
let add =
foreign "g_test_suite_add" (ptr t_typ @-> ptr Test_case.t_typ @-> returning (void))

let add_suite =
foreign "g_test_suite_add_suite" (ptr t_typ @-> ptr t_typ @-> returning (void))


