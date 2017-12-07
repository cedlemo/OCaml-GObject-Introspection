open Ctypes

type t = Changed | Changes_done_hint | Deleted | Created | Attribute_changed | Pre_unmount | Unmounted | Moved | Renamed | Moved_in | Moved_out

val of_value:
  Unsigned.uint32 -> t

val to_value:
  t -> Unsigned.uint32

val t_view: t typ

