(** GIStructInfo — Module representing a C structure *)

(** GIStructInfo represents a generic C structure type.
 A structure has methods and fields.*)
type structinfo

external get_alignment:
  structinfo -> int = "caml_g_istructinfo_get_alignment_c"

external get_size:
  structinfo -> int = "caml_g_istructinfo_get_size_c"
