open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "Pattern_spec"

let equal =
  foreign "g_pattern_spec_equal" (ptr t_typ @-> ptr t_typ @-> returning (bool))

let free =
  foreign "g_pattern_spec_free" (ptr t_typ @-> returning (void))

