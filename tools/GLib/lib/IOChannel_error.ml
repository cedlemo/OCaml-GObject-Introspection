open Ctypes
open Foreign

type t = Fbig | Inval | Io | Isdir | Nospc | Nxio | Overflow | Pipe | Failed
let of_value v =
if v = Unsigned.UInt32.of_int 0 then Fbig
else if v = Unsigned.UInt32.of_int 1 then Inval
else if v = Unsigned.UInt32.of_int 2 then Io
else if v = Unsigned.UInt32.of_int 3 then Isdir
else if v = Unsigned.UInt32.of_int 4 then Nospc
else if v = Unsigned.UInt32.of_int 5 then Nxio
else if v = Unsigned.UInt32.of_int 6 then Overflow
else if v = Unsigned.UInt32.of_int 7 then Pipe
else if v = Unsigned.UInt32.of_int 8 then Failed
else raise (Invalid_argument "Unexpected IOChannel_error value")
let to_value = function
| Fbig -> Unsigned.UInt32.of_int 0
| Inval -> Unsigned.UInt32.of_int 1
| Io -> Unsigned.UInt32.of_int 2
| Isdir -> Unsigned.UInt32.of_int 3
| Nospc -> Unsigned.UInt32.of_int 4
| Nxio -> Unsigned.UInt32.of_int 5
| Overflow -> Unsigned.UInt32.of_int 6
| Pipe -> Unsigned.UInt32.of_int 7
| Failed -> Unsigned.UInt32.of_int 8
let t_view = view
~read:of_value
~write:to_value
uint32_t

