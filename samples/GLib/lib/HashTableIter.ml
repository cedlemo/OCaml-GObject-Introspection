open Ctypes
open Foreign
type t
let t_typ : t structure typ = structure "HashTableIter"
let f_dummy1 = field t_typ "dummy1" (ptr void)
let f_dummy2 = field t_typ "dummy2" (ptr void)
let f_dummy3 = field t_typ "dummy3" (ptr void)
let f_dummy4 = field t_typ "dummy4" (int32_t)
let f_dummy5 = field t_typ "dummy5" (bool)
let f_dummy6 = field t_typ "dummy6" (ptr void)
