open Ctypes

type t
val t_typ : t structure typ
(* Not implemented g_mapped_file_new return type not handled . *)
(* Not implemented g_mapped_file_new_from_fd return type not handled . *)
val free:
t structure ptr -> unit
(* Not implemented g_mapped_file_get_bytes return type not handled . *)
(* Not implemented g_mapped_file_get_contents return type not handled . *)
val get_length:
t structure ptr -> Unsigned.uint64
(* Not implemented g_mapped_file_ref return type not handled . *)
val unref:
t structure ptr -> unit

