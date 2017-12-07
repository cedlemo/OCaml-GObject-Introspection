open Ctypes

type t = Flags_none | Is_service | Is_launcher | Handles_open | Handles_command_line | Send_environment | Non_unique | Can_override_app_id
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

