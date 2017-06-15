open Ctypes
open Foreign
type t
let hashtableiter : t structure typ = structure "HashTableIter"
let dummy1 = field hashtableiter "dummy1" (ptr void)
let dummy2 = field hashtableiter "dummy2" (ptr void)
let dummy3 = field hashtableiter "dummy3" (ptr void)
let dummy4 = field hashtableiter "dummy4" (int32_t)
let dummy5 = field hashtableiter "dummy5" (bool)
let dummy6 = field hashtableiter "dummy6" (ptr void)
let _ = seal hashtableiter
