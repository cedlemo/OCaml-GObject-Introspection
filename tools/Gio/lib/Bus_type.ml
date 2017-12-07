open Ctypes
open Foreign

type t = Starter | None | System | Session

let of_value v =
  if v = Int32.of_int (-1) then Starter
  else if v = Int32.of_int 0 then None
  else if v = Int32.of_int 1 then System
  else if v = Int32.of_int 2 then Session
  else raise (Invalid_argument "Unexpected Bus_type value")

let to_value =  function
  | Starter -> Int32.of_int (-1)
  | None -> Int32.of_int 0
  | System -> Int32.of_int 1
  | Session -> Int32.of_int 2

let t_view = view ~read:of_value ~write:to_value int32_t

