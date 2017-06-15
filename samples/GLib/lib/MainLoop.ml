open Ctypes
open Foreign
type t
let mainloop : t structure typ = structure "MainLoop"
let _ = seal mainloop
