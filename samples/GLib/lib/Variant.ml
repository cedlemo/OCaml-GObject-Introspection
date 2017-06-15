open Ctypes
open Foreign
type t
let variant : t structure typ = structure "Variant"
let _ = seal variant
