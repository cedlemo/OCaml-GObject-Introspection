open Base
open Stdio
module C = Configurator

let write_sexp fn sexp =
  Out_channel.write_all fn ~data:(Sexp.to_string sexp)

let () =
  C.main ~name:"GLib" (fun c ->
    let default : C.Pkg_config.package_conf =
      { libs   = ["-lglib-2.0"]
      ; cflags = ["-O2"; "-Wall"; "-Wextra"; "-Wno-unused-parameter"; "-pthread";
                  "-I/usr/include/glib-2.0";
                  "-I/usr/lib/glib-2.0/include"]
      }
    in
    let conf =
      match C.Pkg_config.get c with
      | None -> default
      | Some pc ->
        Option.value (C.Pkg_config.query pc ~package:"glib-2.0") ~default
    in

    write_sexp "c_flags.sexp"         (sexp_of_list sexp_of_string conf.libs);
    write_sexp "c_library_flags.sexp" (sexp_of_list sexp_of_string conf.cflags))
