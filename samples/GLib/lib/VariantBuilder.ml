open Ctypes
open Foreign
type t
let variantbuilder : t structure typ = structure "VariantBuilder"
let _ = seal variantbuilder
