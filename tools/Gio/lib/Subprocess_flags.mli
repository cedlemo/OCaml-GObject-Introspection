open Ctypes

type t = None | Stdin_pipe | Stdin_inherit | Stdout_pipe | Stdout_silence | Stderr_pipe | Stderr_silence | Stderr_merge | Inherit_fds
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

