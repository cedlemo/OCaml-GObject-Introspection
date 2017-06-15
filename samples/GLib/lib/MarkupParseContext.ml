open Ctypes
open Foreign
type t
let markupparsecontext : t structure typ = structure "MarkupParseContext"
let _ = seal markupparsecontext
