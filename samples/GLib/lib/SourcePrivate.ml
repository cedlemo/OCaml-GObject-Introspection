open Ctypes
open Foreign
type t
let sourceprivate : t structure typ = structure "SourcePrivate"
let _ = seal sourceprivate
