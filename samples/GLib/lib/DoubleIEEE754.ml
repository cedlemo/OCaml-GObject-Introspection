open Ctypes
open Foreign
type t
let doubleieee754 : t union typ = union "DoubleIEEE754"
let v_double = field doubleieee754 "v_double" (double)
let _ = seal doubleieee754
