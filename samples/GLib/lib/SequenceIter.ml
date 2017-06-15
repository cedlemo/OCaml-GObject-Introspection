open Ctypes
open Foreign
type t
let sequenceiter : t structure typ = structure "SequenceIter"
let _ = seal sequenceiter
