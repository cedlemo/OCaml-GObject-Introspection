open Ctypes
open Foreign
type t
let bookmarkfile : t structure typ = structure "BookmarkFile"
let _ = seal bookmarkfile
