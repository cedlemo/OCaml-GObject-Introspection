open Ctypes
open Foreign
type t
let optiongroup : t structure typ = structure "OptionGroup"
let _ = seal optiongroup
