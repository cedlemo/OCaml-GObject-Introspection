type structinfo

external get_alignment:
  structinfo -> int = "caml_g_istructinfo_get_alignment_c"

external get_size:
  structinfo -> int = "caml_g_istructinfo_get_size_c"
