open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "IConv"
let g_iconv =
foreign "g_iconv" (ptr t_typ @-> string @-> ptr uint64_t @-> string @-> ptr uint64_t @-> returning (uint64_t))

let close =
foreign "g_iconv_close" (ptr t_typ @-> returning (int32_t))


