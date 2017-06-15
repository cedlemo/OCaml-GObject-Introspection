open Ctypes
open Foreign
type t
let error : t structure typ = structure "Error"
let domain = field error "domain" (uint32_t)
let code = field error "code" (int32_t)
let message = field error "message" (ptr string)
let _ = seal error
