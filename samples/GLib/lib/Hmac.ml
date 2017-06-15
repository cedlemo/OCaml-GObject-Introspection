open Ctypes
open Foreign
type t
let hmac : t structure typ = structure "Hmac"
let _ = seal hmac
