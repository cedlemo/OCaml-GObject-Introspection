open Ctypes

type t = Failed | Not_found | Exists | Is_directory | Not_directory | Not_empty | Not_regular_file | Not_symbolic_link | Not_mountable_file | Filename_too_long | Invalid_filename | Too_many_links | No_space | Invalid_argument | Permission_denied | Not_supported | Not_mounted | Already_mounted | Closed | Cancelled | Pending | Read_only | Cant_create_backup | Wrong_etag | Timed_out | Would_recurse | Busy | Would_block | Host_not_found | Would_merge | Failed_handled | Too_many_open_files | Not_initialized | Address_in_use | Partial_input | Invalid_data | Dbus_error | Host_unreachable | Network_unreachable | Connection_refused | Proxy_failed | Proxy_auth_failed | Proxy_need_auth | Proxy_not_allowed | Broken_pipe | Connection_closed | Not_connected | Message_too_large

val of_value:
  Unsigned.uint32 -> t

val to_value:
  t -> Unsigned.uint32

val t_view: t typ

