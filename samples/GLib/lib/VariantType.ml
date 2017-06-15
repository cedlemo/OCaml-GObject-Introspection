open Ctypes
open Foreign
type t
let varianttype : t structure typ = structure "VariantType"
let _ = seal varianttype
