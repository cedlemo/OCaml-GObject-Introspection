open Ctypes
open Foreign
type t
let timezone : t structure typ = structure "TimeZone"
let _ = seal timezone
