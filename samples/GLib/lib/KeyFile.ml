open Ctypes
open Foreign
type t
let keyfile : t structure typ = structure "KeyFile"
let _ = seal keyfile
