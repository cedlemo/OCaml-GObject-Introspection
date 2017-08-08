open Base
open Stdio
module C = Configurator

let write_sexp fn sexp =
  Out_channel.write_all fn ~data:(Sexp.to_string sexp)

let () =
  C.main ~name:"GObject-Introspection" (fun c ->
    let default : C.Pkg_config.package_conf =
      { libs   = ["-lgirepository-1.0"; "-lgobject-2.0"; "-lglib-2.0"; "-lffi"]
      ; cflags = ["-O2"; "-Wall"; "-Wextra"; "-Wno-unused-parameter"; "-pthread";
                  "-I/usr/include/gobject-introspection-1.0";
                  "-I/usr/lib/libffi-3.2.1/include";
                  "-I/usr/include/glib-2.0";
                  "-I/usr/lib/glib-2.0/include"]
      }
    in
    let default_ffi : C.Pkg_config.package_conf =
      { libs   = ["-lffi"] ;
        cflags = ["-O2"; "-Wall"; "-Wextra"; "-Wno-unused-parameter";
                  "-I/usr/lib/libffi-3.2.1/include";
                  "-I/usr/include/x86_64-linux-gnu"; (* default ubuntu *)
                  "-I/usr/include"] (* default ubuntu *)
      }
    in
    let conf =
      match C.Pkg_config.get c with
      | None -> default
      | Some pc ->
         let libffi = Option.value (C.Pkg_config.query pc ~package:"libffi") ~default:default_ffi in
         let gobject = Option.value (C.Pkg_config.query pc ~package:"gobject-introspection-1.0") ~default in
         let  module P = C.Pkg_config in
         { libs = (libffi.P.libs @ gobject.P.libs) @ ["-L/usr/lib/x86_64-linux-gnu";"-L/usr/lib"];
           cflags = (libffi.P.cflags @ gobject.P.cflags) @ ["-I/usr/include"; "-I/usr/include/x86_64-linux-gnu"] }
    in
    let _ = print_endline "==================== Configurator ================" in
    let _ = print_endline ">>>>>>>>>>>>>>>>>>>>> libs : <<<<<<<<<<<<<<<<<<<<<<" in
    let _ = print_endline (Sexp.to_string (sexp_of_list sexp_of_string conf.libs)) in
    let _ = print_endline ">>>>>>>>>>>>>>>>>>>>> flags : <<<<<<<<<<<<<<<<<<<<<<" in
    let _ = print_endline (Sexp.to_string (sexp_of_list sexp_of_string conf.cflags)) in
    let _ = print_endline "==================== Configurator ================" in

    write_sexp "c_flags.sexp"         (sexp_of_list sexp_of_string conf.cflags);
    write_sexp "c_library_flags.sexp" (sexp_of_list sexp_of_string conf.libs))
