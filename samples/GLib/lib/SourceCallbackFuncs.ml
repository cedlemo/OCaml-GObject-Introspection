open Ctypes
open Foreign
type t
let sourcecallbackfuncs : t structure typ = structure "SourceCallbackFuncs"
let ref = field sourcecallbackfuncs "ref" ()
let unref = field sourcecallbackfuncs "unref" ()
let get = field sourcecallbackfuncs "get" (ptr void)
let _ = seal sourcecallbackfuncs
