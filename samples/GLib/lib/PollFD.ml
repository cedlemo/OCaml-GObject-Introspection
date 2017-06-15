open Ctypes
open Foreign
type t
let pollfd : t structure typ = structure "PollFD"
let fd = field pollfd "fd" (int32_t)
let events = field pollfd "events" (uint16_t)
let revents = field pollfd "revents" (uint16_t)
let _ = seal pollfd
