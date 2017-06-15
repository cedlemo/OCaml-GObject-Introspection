open Ctypes
open Foreign
type t
let mappedfile : t structure typ = structure "MappedFile"
let _ = seal mappedfile
