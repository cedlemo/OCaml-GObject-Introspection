(** GIFunctionInfo — Module with type representing a function *)

(** functioninfo represents a function, method or constructor. To find out what
 kind of entity a functioninfo represents, call GIFunctionInfo.get_flags.
 See also GICallableInfo for information on how to retreive arguments and other
 metadata. *)
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

external get_symbol:
  functioninfo -> string = "caml_g_ifunctioninfo_get_symbol_c"
