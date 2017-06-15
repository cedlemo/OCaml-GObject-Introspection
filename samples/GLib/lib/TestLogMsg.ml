open Ctypes
open Foreign
type t
let testlogmsg : t structure typ = structure "TestLogMsg"
let log_type = field testlogmsg "log_type" ()
let n_strings = field testlogmsg "n_strings" (uint32_t)
let strings = field testlogmsg "strings" (ptr string)
let n_nums = field testlogmsg "n_nums" (uint32_t)
let nums = field testlogmsg "nums" (ptr int64_t)
let _ = seal testlogmsg
