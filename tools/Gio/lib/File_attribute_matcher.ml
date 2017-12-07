open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "File_attribute_matcher"

let create =
  foreign "g_file_attribute_matcher_new" (string @-> returning (ptr t_typ))

let enumerate_namespace =
  foreign "g_file_attribute_matcher_enumerate_namespace" (ptr t_typ @-> string @-> returning (bool))

let enumerate_next =
  foreign "g_file_attribute_matcher_enumerate_next" (ptr t_typ @-> returning (string))

let matches =
  foreign "g_file_attribute_matcher_matches" (ptr t_typ @-> string @-> returning (bool))

let matches_only =
  foreign "g_file_attribute_matcher_matches_only" (ptr t_typ @-> string @-> returning (bool))

let ref =
  foreign "g_file_attribute_matcher_ref" (ptr t_typ @-> returning (ptr t_typ))

let subtract =
  foreign "g_file_attribute_matcher_subtract" (ptr t_typ @-> ptr t_typ @-> returning (ptr t_typ))

let to_string =
  foreign "g_file_attribute_matcher_to_string" (ptr t_typ @-> returning (string))

let unref =
  foreign "g_file_attribute_matcher_unref" (ptr t_typ @-> returning (void))

