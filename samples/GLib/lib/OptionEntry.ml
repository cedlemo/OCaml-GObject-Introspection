open Ctypes
open Foreign
type t
let optionentry : t structure typ = structure "OptionEntry"
let long_name = field optionentry "long_name" (ptr string)
let short_name = field optionentry "short_name" (int8_t)
let flags = field optionentry "flags" (int32_t)
let arg = field optionentry "arg" ()
let arg_data = field optionentry "arg_data" (ptr void)
let description = field optionentry "description" (ptr string)
let arg_description = field optionentry "arg_description" (ptr string)
let _ = seal optionentry
