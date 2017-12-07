open Ctypes

type t = Invalid | Linux_ucred | Freebsd_cmsgcred | Openbsd_sockpeercred | Solaris_ucred | Netbsd_unpcbid

val of_value:
  Unsigned.uint32 -> t

val to_value:
  t -> Unsigned.uint32

val t_view: t typ

