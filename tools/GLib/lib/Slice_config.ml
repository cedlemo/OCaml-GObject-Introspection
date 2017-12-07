open Ctypes
open Foreign

type t = Always_malloc | Bypass_magazines | Working_set_msecs | Color_increment | Chunk_sizes | Contention_counter

let of_value v =
  if v = Unsigned.UInt32.of_int 1 then Always_malloc
  else if v = Unsigned.UInt32.of_int 2 then Bypass_magazines
  else if v = Unsigned.UInt32.of_int 3 then Working_set_msecs
  else if v = Unsigned.UInt32.of_int 4 then Color_increment
  else if v = Unsigned.UInt32.of_int 5 then Chunk_sizes
  else if v = Unsigned.UInt32.of_int 6 then Contention_counter
  else raise (Invalid_argument "Unexpected Slice_config value")

let to_value = function
  | Always_malloc -> Unsigned.UInt32.of_int 1
  | Bypass_magazines -> Unsigned.UInt32.of_int 2
  | Working_set_msecs -> Unsigned.UInt32.of_int 3
  | Color_increment -> Unsigned.UInt32.of_int 4
  | Chunk_sizes -> Unsigned.UInt32.of_int 5
  | Contention_counter -> Unsigned.UInt32.of_int 6

let t_view = view ~read:of_value ~write:to_value uint32_t

