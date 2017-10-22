open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "Hmac"
let get_digest =
  foreign "g_hmac_get_digest" (ptr t_typ @-> ptr uint8_t @-> ptr uint64_t @-> returning (void))

let get_string =
  foreign "g_hmac_get_string" (ptr t_typ @-> returning (string))

let unref =
  foreign "g_hmac_unref" (ptr t_typ @-> returning (void))

(*Not implemented g_hmac_update argument typeC Array type for Types.Array tag not handled*)

