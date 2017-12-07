open Ctypes

type t = Failed | No_memory | Service_unknown | Name_has_no_owner | No_reply | Io_error | Bad_address | Not_supported | Limits_exceeded | Access_denied | Auth_failed | No_server | Timeout | No_network | Address_in_use | Disconnected | Invalid_args | File_not_found | File_exists | Unknown_method | Timed_out | Match_rule_not_found | Match_rule_invalid | Spawn_exec_failed | Spawn_fork_failed | Spawn_child_exited | Spawn_child_signaled | Spawn_failed | Spawn_setup_failed | Spawn_config_invalid | Spawn_service_invalid | Spawn_service_not_found | Spawn_permissions_invalid | Spawn_file_invalid | Spawn_no_memory | Unix_process_id_unknown | Invalid_signature | Invalid_file_content | Selinux_security_context_unknown | Adt_audit_data_unknown | Object_path_in_use | Unknown_object | Unknown_interface | Unknown_property | Property_read_only

val of_value:
  Unsigned.uint32 -> t

val to_value:
  t -> Unsigned.uint32

val t_view: t typ

