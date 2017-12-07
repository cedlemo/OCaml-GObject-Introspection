open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "IOModule_scope"

let block =
  foreign "g_io_module_scope_block" (ptr t_typ @-> string @-> returning (void))

let free =
  foreign "g_io_module_scope_free" (ptr t_typ @-> returning (void))

