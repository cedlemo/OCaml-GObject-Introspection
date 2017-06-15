open Ctypes
open Foreign
type t
let variantdict : t structure typ = structure "VariantDict"
let _ = seal variantdict
