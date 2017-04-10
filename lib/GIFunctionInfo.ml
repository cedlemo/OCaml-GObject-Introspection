type functioninfo

type flags =
  | Is_method      (** is a method. *)
  | Is_constructor (** is a constructor. *)
  | Is_getter      (** is a getter of a GIPropertyInfo. *)
  | Is_setter      (** is a setter of a GIPropertyInfo. *)
  | Wraps_vfunc    (** represents a virtual function. *)
  | Throws         (** the function may throw an error. *)

external get_flags:
  functioninfo -> flags = "caml_g_ifunctioninfo_get_flags_c"
