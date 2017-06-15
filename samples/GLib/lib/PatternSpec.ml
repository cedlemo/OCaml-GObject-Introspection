open Ctypes
open Foreign
type t
let patternspec : t structure typ = structure "PatternSpec"
let _ = seal patternspec
