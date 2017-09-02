open Ctypes
open Foreign

type t = Default | Nfd | Default_compose | Nfc | All | Nfkd | All_compose | Nfkc
let of_value v =
if v = Unsigned.UInt32.of_int 0 then Default
else if v = Unsigned.UInt32.of_int 0 then Nfd
else if v = Unsigned.UInt32.of_int 1 then Default_compose
else if v = Unsigned.UInt32.of_int 1 then Nfc
else if v = Unsigned.UInt32.of_int 2 then All
else if v = Unsigned.UInt32.of_int 2 then Nfkd
else if v = Unsigned.UInt32.of_int 3 then All_compose
else if v = Unsigned.UInt32.of_int 3 then Nfkc
else raise (Invalid_argument "Unexpected Normalize_mode value")
let to_value = function
| Default -> Unsigned.UInt32.of_int 0
| Nfd -> Unsigned.UInt32.of_int 0
| Default_compose -> Unsigned.UInt32.of_int 1
| Nfc -> Unsigned.UInt32.of_int 1
| All -> Unsigned.UInt32.of_int 2
| Nfkd -> Unsigned.UInt32.of_int 2
| All_compose -> Unsigned.UInt32.of_int 3
| Nfkc -> Unsigned.UInt32.of_int 3
let t_view = view 
~read:of_value 
~write:to_value 
uint32_t

