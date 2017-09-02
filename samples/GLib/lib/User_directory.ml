open Ctypes
open Foreign

type t = Directory_desktop | Directory_documents | Directory_download | Directory_music | Directory_pictures | Directory_public_share | Directory_templates | Directory_videos | N_directories
let of_value v =
if v = Unsigned.UInt32.of_int 0 then Directory_desktop
else if v = Unsigned.UInt32.of_int 1 then Directory_documents
else if v = Unsigned.UInt32.of_int 2 then Directory_download
else if v = Unsigned.UInt32.of_int 3 then Directory_music
else if v = Unsigned.UInt32.of_int 4 then Directory_pictures
else if v = Unsigned.UInt32.of_int 5 then Directory_public_share
else if v = Unsigned.UInt32.of_int 6 then Directory_templates
else if v = Unsigned.UInt32.of_int 7 then Directory_videos
else if v = Unsigned.UInt32.of_int 8 then N_directories
else raise (Invalid_argument "Unexpected User_directory value")
let to_value = function
| Directory_desktop -> Unsigned.UInt32.of_int 0
| Directory_documents -> Unsigned.UInt32.of_int 1
| Directory_download -> Unsigned.UInt32.of_int 2
| Directory_music -> Unsigned.UInt32.of_int 3
| Directory_pictures -> Unsigned.UInt32.of_int 4
| Directory_public_share -> Unsigned.UInt32.of_int 5
| Directory_templates -> Unsigned.UInt32.of_int 6
| Directory_videos -> Unsigned.UInt32.of_int 7
| N_directories -> Unsigned.UInt32.of_int 8
let t_view = view 
~read:of_value 
~write:to_value 
uint32_t

