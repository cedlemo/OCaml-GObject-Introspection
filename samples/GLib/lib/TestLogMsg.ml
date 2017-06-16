open Ctypes
open Foreign
type t
let t_typ : t structure typ = structure "TestLogMsg"
let f_log_type = field t_typ "log_type" ()
let f_n_strings = field t_typ "n_strings" (uint32_t)
let f_strings = field t_typ "strings" (ptr string)
let f_n_nums = field t_typ "n_nums" (uint32_t)
let f_nums = field t_typ "nums" (ptr int64_t)
