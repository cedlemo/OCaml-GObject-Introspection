open Ctypes
open Foreign
type t
let hooklist : t structure typ = structure "HookList"
let seq_id = field hooklist "seq_id" (uint64_t)
let hook_size = field hooklist "hook_size" (uint32_t)
let is_setup = field hooklist "is_setup" (uint32_t)
let hooks = field hooklist "hooks" (ptr )
let dummy3 = field hooklist "dummy3" (ptr void)
let finalize_hook = field hooklist "finalize_hook" ()
let dummy = field hooklist "dummy" (Array.array)
let _ = seal hooklist
