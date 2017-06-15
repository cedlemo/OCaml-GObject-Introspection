open Ctypes
open Foreign
type t
let matchinfo : t structure typ = structure "MatchInfo"
let _ = seal matchinfo
