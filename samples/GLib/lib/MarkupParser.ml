open Ctypes
open Foreign
type t
let t_typ : t structure typ = structure "MarkupParser"
let f_start_element = field t_typ "start_element" ()
let f_end_element = field t_typ "end_element" ()
let f_text = field t_typ "text" ()
let f_passthrough = field t_typ "passthrough" ()
let f_error = field t_typ "error" ()
