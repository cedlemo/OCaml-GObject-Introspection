open Ctypes
open Foreign

type t = Failed | Not_found | Exists | Is_directory | Not_directory | Not_empty | Not_regular_file | Not_symbolic_link | Not_mountable_file | Filename_too_long | Invalid_filename | Too_many_links | No_space | Invalid_argument | Permission_denied | Not_supported | Not_mounted | Already_mounted | Closed | Cancelled | Pending | Read_only | Cant_create_backup | Wrong_etag | Timed_out | Would_recurse | Busy | Would_block | Host_not_found | Would_merge | Failed_handled | Too_many_open_files | Not_initialized | Address_in_use | Partial_input | Invalid_data | Dbus_error | Host_unreachable | Network_unreachable | Connection_refused | Proxy_failed | Proxy_auth_failed | Proxy_need_auth | Proxy_not_allowed | Broken_pipe | Connection_closed | Not_connected | Message_too_large

let of_value v =
  if v = Unsigned.UInt32.of_int 0 then Failed
  else if v = Unsigned.UInt32.of_int 1 then Not_found
  else if v = Unsigned.UInt32.of_int 2 then Exists
  else if v = Unsigned.UInt32.of_int 3 then Is_directory
  else if v = Unsigned.UInt32.of_int 4 then Not_directory
  else if v = Unsigned.UInt32.of_int 5 then Not_empty
  else if v = Unsigned.UInt32.of_int 6 then Not_regular_file
  else if v = Unsigned.UInt32.of_int 7 then Not_symbolic_link
  else if v = Unsigned.UInt32.of_int 8 then Not_mountable_file
  else if v = Unsigned.UInt32.of_int 9 then Filename_too_long
  else if v = Unsigned.UInt32.of_int 10 then Invalid_filename
  else if v = Unsigned.UInt32.of_int 11 then Too_many_links
  else if v = Unsigned.UInt32.of_int 12 then No_space
  else if v = Unsigned.UInt32.of_int 13 then Invalid_argument
  else if v = Unsigned.UInt32.of_int 14 then Permission_denied
  else if v = Unsigned.UInt32.of_int 15 then Not_supported
  else if v = Unsigned.UInt32.of_int 16 then Not_mounted
  else if v = Unsigned.UInt32.of_int 17 then Already_mounted
  else if v = Unsigned.UInt32.of_int 18 then Closed
  else if v = Unsigned.UInt32.of_int 19 then Cancelled
  else if v = Unsigned.UInt32.of_int 20 then Pending
  else if v = Unsigned.UInt32.of_int 21 then Read_only
  else if v = Unsigned.UInt32.of_int 22 then Cant_create_backup
  else if v = Unsigned.UInt32.of_int 23 then Wrong_etag
  else if v = Unsigned.UInt32.of_int 24 then Timed_out
  else if v = Unsigned.UInt32.of_int 25 then Would_recurse
  else if v = Unsigned.UInt32.of_int 26 then Busy
  else if v = Unsigned.UInt32.of_int 27 then Would_block
  else if v = Unsigned.UInt32.of_int 28 then Host_not_found
  else if v = Unsigned.UInt32.of_int 29 then Would_merge
  else if v = Unsigned.UInt32.of_int 30 then Failed_handled
  else if v = Unsigned.UInt32.of_int 31 then Too_many_open_files
  else if v = Unsigned.UInt32.of_int 32 then Not_initialized
  else if v = Unsigned.UInt32.of_int 33 then Address_in_use
  else if v = Unsigned.UInt32.of_int 34 then Partial_input
  else if v = Unsigned.UInt32.of_int 35 then Invalid_data
  else if v = Unsigned.UInt32.of_int 36 then Dbus_error
  else if v = Unsigned.UInt32.of_int 37 then Host_unreachable
  else if v = Unsigned.UInt32.of_int 38 then Network_unreachable
  else if v = Unsigned.UInt32.of_int 39 then Connection_refused
  else if v = Unsigned.UInt32.of_int 40 then Proxy_failed
  else if v = Unsigned.UInt32.of_int 41 then Proxy_auth_failed
  else if v = Unsigned.UInt32.of_int 42 then Proxy_need_auth
  else if v = Unsigned.UInt32.of_int 43 then Proxy_not_allowed
  else if v = Unsigned.UInt32.of_int 44 then Broken_pipe
  else if v = Unsigned.UInt32.of_int 44 then Connection_closed
  else if v = Unsigned.UInt32.of_int 45 then Not_connected
  else if v = Unsigned.UInt32.of_int 46 then Message_too_large
  else raise (Invalid_argument "Unexpected IOError_enum value")

let to_value = function
  | Failed -> Unsigned.UInt32.of_int 0
  | Not_found -> Unsigned.UInt32.of_int 1
  | Exists -> Unsigned.UInt32.of_int 2
  | Is_directory -> Unsigned.UInt32.of_int 3
  | Not_directory -> Unsigned.UInt32.of_int 4
  | Not_empty -> Unsigned.UInt32.of_int 5
  | Not_regular_file -> Unsigned.UInt32.of_int 6
  | Not_symbolic_link -> Unsigned.UInt32.of_int 7
  | Not_mountable_file -> Unsigned.UInt32.of_int 8
  | Filename_too_long -> Unsigned.UInt32.of_int 9
  | Invalid_filename -> Unsigned.UInt32.of_int 10
  | Too_many_links -> Unsigned.UInt32.of_int 11
  | No_space -> Unsigned.UInt32.of_int 12
  | Invalid_argument -> Unsigned.UInt32.of_int 13
  | Permission_denied -> Unsigned.UInt32.of_int 14
  | Not_supported -> Unsigned.UInt32.of_int 15
  | Not_mounted -> Unsigned.UInt32.of_int 16
  | Already_mounted -> Unsigned.UInt32.of_int 17
  | Closed -> Unsigned.UInt32.of_int 18
  | Cancelled -> Unsigned.UInt32.of_int 19
  | Pending -> Unsigned.UInt32.of_int 20
  | Read_only -> Unsigned.UInt32.of_int 21
  | Cant_create_backup -> Unsigned.UInt32.of_int 22
  | Wrong_etag -> Unsigned.UInt32.of_int 23
  | Timed_out -> Unsigned.UInt32.of_int 24
  | Would_recurse -> Unsigned.UInt32.of_int 25
  | Busy -> Unsigned.UInt32.of_int 26
  | Would_block -> Unsigned.UInt32.of_int 27
  | Host_not_found -> Unsigned.UInt32.of_int 28
  | Would_merge -> Unsigned.UInt32.of_int 29
  | Failed_handled -> Unsigned.UInt32.of_int 30
  | Too_many_open_files -> Unsigned.UInt32.of_int 31
  | Not_initialized -> Unsigned.UInt32.of_int 32
  | Address_in_use -> Unsigned.UInt32.of_int 33
  | Partial_input -> Unsigned.UInt32.of_int 34
  | Invalid_data -> Unsigned.UInt32.of_int 35
  | Dbus_error -> Unsigned.UInt32.of_int 36
  | Host_unreachable -> Unsigned.UInt32.of_int 37
  | Network_unreachable -> Unsigned.UInt32.of_int 38
  | Connection_refused -> Unsigned.UInt32.of_int 39
  | Proxy_failed -> Unsigned.UInt32.of_int 40
  | Proxy_auth_failed -> Unsigned.UInt32.of_int 41
  | Proxy_need_auth -> Unsigned.UInt32.of_int 42
  | Proxy_not_allowed -> Unsigned.UInt32.of_int 43
  | Broken_pipe -> Unsigned.UInt32.of_int 44
  | Connection_closed -> Unsigned.UInt32.of_int 44
  | Not_connected -> Unsigned.UInt32.of_int 45
  | Message_too_large -> Unsigned.UInt32.of_int 46

let t_view = view ~read:of_value ~write:to_value uint32_t

