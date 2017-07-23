open Base
open Stdio
module C = Configurator

let write_sexp fn sexp =
  Out_channel.write_all fn ~data:(Sexp.to_string sexp)

let () =
  C.main ~name:"GObject-Introspection" (fun c ->
    let default : C.Pkg_config.package_conf =
      { libs   = ["-lgirepository-1.0"; "-lgobject-2.0"; "-lglib-2.0"]
      ; cflags = ["-O2"; "-Wall"; "-Wextra"; "-Wno-unused-parameter"; "-pthread";
                  "-I/usr/include/gobject-introspection-1.0";
                  "-I/usr/lib/libffi-3.2.1/include";
                  "-I/usr/include/glib-2.0";
                  "-I/usr/lib/glib-2.0/include"]
      }
    in
    let conf =
      match C.Pkg_config.get c with
      | None -> default
      | Some pc ->
         let libffi = Option.value_exn (C.Pkg_config.query pc ~package:"libffi") in
         let gobject = Option.value (C.Pkg_config.query pc ~package:"gobject-introspection-1.0") ~default in
         let  module P = C.Pkg_config in
         { libs = libffi.P.libs @ gobject.P.libs ;
           cflags = libffi.P.libs @ gobject.P.libs }
    in

    write_sexp "c_flags.sexp"         (sexp_of_list sexp_of_string conf.libs);
    write_sexp "c_library_flags.sexp" (sexp_of_list sexp_of_string conf.cflags))
