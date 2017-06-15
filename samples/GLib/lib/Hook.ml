open Ctypes
open Foreign
type t
let hook : t structure typ = structure "Hook"
let data = field hook "data" (ptr void)
let next = field hook "next" (ptr )
let prev = field hook "prev" (ptr )
let ref_count = field hook "ref_count" (uint32_t)
let hook_id = field hook "hook_id" (uint64_t)
let flags = field hook "flags" (uint32_t)
let func = field hook "func" (ptr void)
let destroy = field hook "destroy" ()
let _ = seal hook
