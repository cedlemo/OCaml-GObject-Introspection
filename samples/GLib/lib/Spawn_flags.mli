open Ctypes

type t = Default | Leave_descriptors_open | Do_not_reap_child | Search_path | Stdout_to_dev_null | Stderr_to_dev_null | Child_inherits_stdin | File_and_argv_zero | Search_path_from_envp | Cloexec_pipes
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

