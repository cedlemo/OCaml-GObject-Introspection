open Ctypes
open Foreign
type t
let hashtable : t structure typ = structure "HashTable"
let _ = seal hashtable
