open Ctypes
open Foreign

type t = Changed | Changes_done_hint | Deleted | Created | Attribute_changed | Pre_unmount | Unmounted | Moved | Renamed | Moved_in | Moved_out

let of_value v =
  if v = Unsigned.UInt32.of_int 0 then Changed
  else if v = Unsigned.UInt32.of_int 1 then Changes_done_hint
  else if v = Unsigned.UInt32.of_int 2 then Deleted
  else if v = Unsigned.UInt32.of_int 3 then Created
  else if v = Unsigned.UInt32.of_int 4 then Attribute_changed
  else if v = Unsigned.UInt32.of_int 5 then Pre_unmount
  else if v = Unsigned.UInt32.of_int 6 then Unmounted
  else if v = Unsigned.UInt32.of_int 7 then Moved
  else if v = Unsigned.UInt32.of_int 8 then Renamed
  else if v = Unsigned.UInt32.of_int 9 then Moved_in
  else if v = Unsigned.UInt32.of_int 10 then Moved_out
  else raise (Invalid_argument "Unexpected File_monitor_event value")

let to_value =  function
  | Changed -> Unsigned.UInt32.of_int 0
  | Changes_done_hint -> Unsigned.UInt32.of_int 1
  | Deleted -> Unsigned.UInt32.of_int 2
  | Created -> Unsigned.UInt32.of_int 3
  | Attribute_changed -> Unsigned.UInt32.of_int 4
  | Pre_unmount -> Unsigned.UInt32.of_int 5
  | Unmounted -> Unsigned.UInt32.of_int 6
  | Moved -> Unsigned.UInt32.of_int 7
  | Renamed -> Unsigned.UInt32.of_int 8
  | Moved_in -> Unsigned.UInt32.of_int 9
  | Moved_out -> Unsigned.UInt32.of_int 10

let t_view = view ~read:of_value ~write:to_value uint32_t

