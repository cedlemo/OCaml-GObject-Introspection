open Ctypes
open Foreign
type t
let floatieee754 : t union typ = union "FloatIEEE754"
let v_float = field floatieee754 "v_float" (float)
let _ = seal floatieee754
