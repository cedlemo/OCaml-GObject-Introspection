open Ctypes
open Foreign

type t = Failed | No_memory | Service_unknown | Name_has_no_owner | No_reply | Io_error | Bad_address | Not_supported | Limits_exceeded | Access_denied | Auth_failed | No_server | Timeout | No_network | Address_in_use | Disconnected | Invalid_args | File_not_found | File_exists | Unknown_method | Timed_out | Match_rule_not_found | Match_rule_invalid | Spawn_exec_failed | Spawn_fork_failed | Spawn_child_exited | Spawn_child_signaled | Spawn_failed | Spawn_setup_failed | Spawn_config_invalid | Spawn_service_invalid | Spawn_service_not_found | Spawn_permissions_invalid | Spawn_file_invalid | Spawn_no_memory | Unix_process_id_unknown | Invalid_signature | Invalid_file_content | Selinux_security_context_unknown | Adt_audit_data_unknown | Object_path_in_use | Unknown_object | Unknown_interface | Unknown_property | Property_read_only

let of_value v =
  if v = Unsigned.UInt32.of_int 0 then Failed
  else if v = Unsigned.UInt32.of_int 1 then No_memory
  else if v = Unsigned.UInt32.of_int 2 then Service_unknown
  else if v = Unsigned.UInt32.of_int 3 then Name_has_no_owner
  else if v = Unsigned.UInt32.of_int 4 then No_reply
  else if v = Unsigned.UInt32.of_int 5 then Io_error
  else if v = Unsigned.UInt32.of_int 6 then Bad_address
  else if v = Unsigned.UInt32.of_int 7 then Not_supported
  else if v = Unsigned.UInt32.of_int 8 then Limits_exceeded
  else if v = Unsigned.UInt32.of_int 9 then Access_denied
  else if v = Unsigned.UInt32.of_int 10 then Auth_failed
  else if v = Unsigned.UInt32.of_int 11 then No_server
  else if v = Unsigned.UInt32.of_int 12 then Timeout
  else if v = Unsigned.UInt32.of_int 13 then No_network
  else if v = Unsigned.UInt32.of_int 14 then Address_in_use
  else if v = Unsigned.UInt32.of_int 15 then Disconnected
  else if v = Unsigned.UInt32.of_int 16 then Invalid_args
  else if v = Unsigned.UInt32.of_int 17 then File_not_found
  else if v = Unsigned.UInt32.of_int 18 then File_exists
  else if v = Unsigned.UInt32.of_int 19 then Unknown_method
  else if v = Unsigned.UInt32.of_int 20 then Timed_out
  else if v = Unsigned.UInt32.of_int 21 then Match_rule_not_found
  else if v = Unsigned.UInt32.of_int 22 then Match_rule_invalid
  else if v = Unsigned.UInt32.of_int 23 then Spawn_exec_failed
  else if v = Unsigned.UInt32.of_int 24 then Spawn_fork_failed
  else if v = Unsigned.UInt32.of_int 25 then Spawn_child_exited
  else if v = Unsigned.UInt32.of_int 26 then Spawn_child_signaled
  else if v = Unsigned.UInt32.of_int 27 then Spawn_failed
  else if v = Unsigned.UInt32.of_int 28 then Spawn_setup_failed
  else if v = Unsigned.UInt32.of_int 29 then Spawn_config_invalid
  else if v = Unsigned.UInt32.of_int 30 then Spawn_service_invalid
  else if v = Unsigned.UInt32.of_int 31 then Spawn_service_not_found
  else if v = Unsigned.UInt32.of_int 32 then Spawn_permissions_invalid
  else if v = Unsigned.UInt32.of_int 33 then Spawn_file_invalid
  else if v = Unsigned.UInt32.of_int 34 then Spawn_no_memory
  else if v = Unsigned.UInt32.of_int 35 then Unix_process_id_unknown
  else if v = Unsigned.UInt32.of_int 36 then Invalid_signature
  else if v = Unsigned.UInt32.of_int 37 then Invalid_file_content
  else if v = Unsigned.UInt32.of_int 38 then Selinux_security_context_unknown
  else if v = Unsigned.UInt32.of_int 39 then Adt_audit_data_unknown
  else if v = Unsigned.UInt32.of_int 40 then Object_path_in_use
  else if v = Unsigned.UInt32.of_int 41 then Unknown_object
  else if v = Unsigned.UInt32.of_int 42 then Unknown_interface
  else if v = Unsigned.UInt32.of_int 43 then Unknown_property
  else if v = Unsigned.UInt32.of_int 44 then Property_read_only
  else raise (Invalid_argument "Unexpected DBus_error value")

let to_value = function
  | Failed -> Unsigned.UInt32.of_int 0
  | No_memory -> Unsigned.UInt32.of_int 1
  | Service_unknown -> Unsigned.UInt32.of_int 2
  | Name_has_no_owner -> Unsigned.UInt32.of_int 3
  | No_reply -> Unsigned.UInt32.of_int 4
  | Io_error -> Unsigned.UInt32.of_int 5
  | Bad_address -> Unsigned.UInt32.of_int 6
  | Not_supported -> Unsigned.UInt32.of_int 7
  | Limits_exceeded -> Unsigned.UInt32.of_int 8
  | Access_denied -> Unsigned.UInt32.of_int 9
  | Auth_failed -> Unsigned.UInt32.of_int 10
  | No_server -> Unsigned.UInt32.of_int 11
  | Timeout -> Unsigned.UInt32.of_int 12
  | No_network -> Unsigned.UInt32.of_int 13
  | Address_in_use -> Unsigned.UInt32.of_int 14
  | Disconnected -> Unsigned.UInt32.of_int 15
  | Invalid_args -> Unsigned.UInt32.of_int 16
  | File_not_found -> Unsigned.UInt32.of_int 17
  | File_exists -> Unsigned.UInt32.of_int 18
  | Unknown_method -> Unsigned.UInt32.of_int 19
  | Timed_out -> Unsigned.UInt32.of_int 20
  | Match_rule_not_found -> Unsigned.UInt32.of_int 21
  | Match_rule_invalid -> Unsigned.UInt32.of_int 22
  | Spawn_exec_failed -> Unsigned.UInt32.of_int 23
  | Spawn_fork_failed -> Unsigned.UInt32.of_int 24
  | Spawn_child_exited -> Unsigned.UInt32.of_int 25
  | Spawn_child_signaled -> Unsigned.UInt32.of_int 26
  | Spawn_failed -> Unsigned.UInt32.of_int 27
  | Spawn_setup_failed -> Unsigned.UInt32.of_int 28
  | Spawn_config_invalid -> Unsigned.UInt32.of_int 29
  | Spawn_service_invalid -> Unsigned.UInt32.of_int 30
  | Spawn_service_not_found -> Unsigned.UInt32.of_int 31
  | Spawn_permissions_invalid -> Unsigned.UInt32.of_int 32
  | Spawn_file_invalid -> Unsigned.UInt32.of_int 33
  | Spawn_no_memory -> Unsigned.UInt32.of_int 34
  | Unix_process_id_unknown -> Unsigned.UInt32.of_int 35
  | Invalid_signature -> Unsigned.UInt32.of_int 36
  | Invalid_file_content -> Unsigned.UInt32.of_int 37
  | Selinux_security_context_unknown -> Unsigned.UInt32.of_int 38
  | Adt_audit_data_unknown -> Unsigned.UInt32.of_int 39
  | Object_path_in_use -> Unsigned.UInt32.of_int 40
  | Unknown_object -> Unsigned.UInt32.of_int 41
  | Unknown_interface -> Unsigned.UInt32.of_int 42
  | Unknown_property -> Unsigned.UInt32.of_int 43
  | Property_read_only -> Unsigned.UInt32.of_int 44

let t_view = view ~read:of_value ~write:to_value uint32_t

