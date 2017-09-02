open Ctypes
open Foreign

type t = Exist | Isdir | Acces | Nametoolong | Noent | Notdir | Nxio | Nodev | Rofs | Txtbsy | Fault | Loop | Nospc | Nomem | Mfile | Nfile | Badf | Inval | Pipe | Again | Intr | Io | Perm | Nosys | Failed
let of_value v =
if v = Unsigned.UInt32.of_int 0 then Exist
else if v = Unsigned.UInt32.of_int 1 then Isdir
else if v = Unsigned.UInt32.of_int 2 then Acces
else if v = Unsigned.UInt32.of_int 3 then Nametoolong
else if v = Unsigned.UInt32.of_int 4 then Noent
else if v = Unsigned.UInt32.of_int 5 then Notdir
else if v = Unsigned.UInt32.of_int 6 then Nxio
else if v = Unsigned.UInt32.of_int 7 then Nodev
else if v = Unsigned.UInt32.of_int 8 then Rofs
else if v = Unsigned.UInt32.of_int 9 then Txtbsy
else if v = Unsigned.UInt32.of_int 10 then Fault
else if v = Unsigned.UInt32.of_int 11 then Loop
else if v = Unsigned.UInt32.of_int 12 then Nospc
else if v = Unsigned.UInt32.of_int 13 then Nomem
else if v = Unsigned.UInt32.of_int 14 then Mfile
else if v = Unsigned.UInt32.of_int 15 then Nfile
else if v = Unsigned.UInt32.of_int 16 then Badf
else if v = Unsigned.UInt32.of_int 17 then Inval
else if v = Unsigned.UInt32.of_int 18 then Pipe
else if v = Unsigned.UInt32.of_int 19 then Again
else if v = Unsigned.UInt32.of_int 20 then Intr
else if v = Unsigned.UInt32.of_int 21 then Io
else if v = Unsigned.UInt32.of_int 22 then Perm
else if v = Unsigned.UInt32.of_int 23 then Nosys
else if v = Unsigned.UInt32.of_int 24 then Failed
else raise (Invalid_argument "Unexpected File_error value")
let to_value = function
| Exist -> Unsigned.UInt32.of_int 0
| Isdir -> Unsigned.UInt32.of_int 1
| Acces -> Unsigned.UInt32.of_int 2
| Nametoolong -> Unsigned.UInt32.of_int 3
| Noent -> Unsigned.UInt32.of_int 4
| Notdir -> Unsigned.UInt32.of_int 5
| Nxio -> Unsigned.UInt32.of_int 6
| Nodev -> Unsigned.UInt32.of_int 7
| Rofs -> Unsigned.UInt32.of_int 8
| Txtbsy -> Unsigned.UInt32.of_int 9
| Fault -> Unsigned.UInt32.of_int 10
| Loop -> Unsigned.UInt32.of_int 11
| Nospc -> Unsigned.UInt32.of_int 12
| Nomem -> Unsigned.UInt32.of_int 13
| Mfile -> Unsigned.UInt32.of_int 14
| Nfile -> Unsigned.UInt32.of_int 15
| Badf -> Unsigned.UInt32.of_int 16
| Inval -> Unsigned.UInt32.of_int 17
| Pipe -> Unsigned.UInt32.of_int 18
| Again -> Unsigned.UInt32.of_int 19
| Intr -> Unsigned.UInt32.of_int 20
| Io -> Unsigned.UInt32.of_int 21
| Perm -> Unsigned.UInt32.of_int 22
| Nosys -> Unsigned.UInt32.of_int 23
| Failed -> Unsigned.UInt32.of_int 24
let t_view = view 
~read:of_value 
~write:to_value 
uint32_t

