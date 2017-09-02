open Ctypes

type t = Directory_desktop | Directory_documents | Directory_download | Directory_music | Directory_pictures | Directory_public_share | Directory_templates | Directory_videos | N_directories
val of_value:
Unsigned.uint32 -> t
val to_value:
t -> Unsigned.uint32
val t_view: t typ

