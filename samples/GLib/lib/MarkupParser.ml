open Ctypes
open Foreign
type t
let markupparser : t structure typ = structure "MarkupParser"
let start_element = field markupparser "start_element" ()
let end_element = field markupparser "end_element" ()
let text = field markupparser "text" ()
let passthrough = field markupparser "passthrough" ()
let error = field markupparser "error" ()
let _ = seal markupparser
