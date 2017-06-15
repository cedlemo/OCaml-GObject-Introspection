open Ctypes
open Foreign
type t
let testlogbuffer : t structure typ = structure "TestLogBuffer"
let data = field testlogbuffer "data" (ptr )
let msgs = field testlogbuffer "msgs" (ptr SList.slist)
let _ = seal testlogbuffer
