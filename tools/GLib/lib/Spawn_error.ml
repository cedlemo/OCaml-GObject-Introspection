open Ctypes
open Foreign

type t = Fork | Read | Chdir | Acces | Perm | Too_big | Noexec | Nametoolong | Noent | Nomem | Notdir | Loop | Txtbusy | Io | Nfile | Mfile | Inval | Isdir | Libbad | Failed

let of_value v =
  if v = Unsigned.UInt32.of_int 0 then Fork
  else if v = Unsigned.UInt32.of_int 1 then Read
  else if v = Unsigned.UInt32.of_int 2 then Chdir
  else if v = Unsigned.UInt32.of_int 3 then Acces
  else if v = Unsigned.UInt32.of_int 4 then Perm
  else if v = Unsigned.UInt32.of_int 5 then Too_big
  else if v = Unsigned.UInt32.of_int 6 then Noexec
  else if v = Unsigned.UInt32.of_int 7 then Nametoolong
  else if v = Unsigned.UInt32.of_int 8 then Noent
  else if v = Unsigned.UInt32.of_int 9 then Nomem
  else if v = Unsigned.UInt32.of_int 10 then Notdir
  else if v = Unsigned.UInt32.of_int 11 then Loop
  else if v = Unsigned.UInt32.of_int 12 then Txtbusy
  else if v = Unsigned.UInt32.of_int 13 then Io
  else if v = Unsigned.UInt32.of_int 14 then Nfile
  else if v = Unsigned.UInt32.of_int 15 then Mfile
  else if v = Unsigned.UInt32.of_int 16 then Inval
  else if v = Unsigned.UInt32.of_int 17 then Isdir
  else if v = Unsigned.UInt32.of_int 18 then Libbad
  else if v = Unsigned.UInt32.of_int 19 then Failed
  else raise (Invalid_argument "Unexpected Spawn_error value")

let to_value = function
  | Fork -> Unsigned.UInt32.of_int 0
  | Read -> Unsigned.UInt32.of_int 1
  | Chdir -> Unsigned.UInt32.of_int 2
  | Acces -> Unsigned.UInt32.of_int 3
  | Perm -> Unsigned.UInt32.of_int 4
  | Too_big -> Unsigned.UInt32.of_int 5
  | Noexec -> Unsigned.UInt32.of_int 6
  | Nametoolong -> Unsigned.UInt32.of_int 7
  | Noent -> Unsigned.UInt32.of_int 8
  | Nomem -> Unsigned.UInt32.of_int 9
  | Notdir -> Unsigned.UInt32.of_int 10
  | Loop -> Unsigned.UInt32.of_int 11
  | Txtbusy -> Unsigned.UInt32.of_int 12
  | Io -> Unsigned.UInt32.of_int 13
  | Nfile -> Unsigned.UInt32.of_int 14
  | Mfile -> Unsigned.UInt32.of_int 15
  | Inval -> Unsigned.UInt32.of_int 16
  | Isdir -> Unsigned.UInt32.of_int 17
  | Libbad -> Unsigned.UInt32.of_int 18
  | Failed -> Unsigned.UInt32.of_int 19

let t_view = view ~read:of_value ~write:to_value uint32_t

