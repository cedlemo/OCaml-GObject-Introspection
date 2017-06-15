open Ctypes
open Foreign
type t
let source : t structure typ = structure "Source"
let callback_data = field source "callback_data" (ptr void)
let callback_funcs = field source "callback_funcs" (ptr )
let source_funcs = field source "source_funcs" (ptr )
let ref_count = field source "ref_count" (uint32_t)
let context = field source "context" (ptr )
let priority = field source "priority" (int32_t)
let flags = field source "flags" (uint32_t)
let source_id = field source "source_id" (uint32_t)
let poll_fds = field source "poll_fds" (ptr SList.slist)
let prev = field source "prev" (ptr )
let next = field source "next" (ptr )
let name = field source "name" (ptr string)
let priv = field source "priv" (ptr )
let _ = seal source
