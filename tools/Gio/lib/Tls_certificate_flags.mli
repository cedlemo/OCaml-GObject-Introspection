open Ctypes

type t = Unknown_ca | Bad_identity | Not_activated | Expired | Revoked | Insecure | Generic_error | Validate_all
type t_list = t list

val of_value:
  Unsigned.uint32 -> t

val to_value:
  t -> Unsigned.uint32

val list_of_value:
  Unsigned.uint32 -> t_list

val list_to_value:
  t_list -> Unsigned.uint32

val t_list_view : t_list typ

