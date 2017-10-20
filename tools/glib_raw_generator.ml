module GI = GObject_introspection

(* This tool is used to  generate the raw bindings of GLib 2 in
 * the OCaml-glib package
 * build with jbuilder build tools/glib_raw_generator.exe
 * launch _build/default/tools/glib_raw_generator.exe
 *)

let print_infos loader =
  let namespace = GI.Loader.get_namespace loader in
  let version = GI.Loader.get_version loader in
  print_endline (">> " ^ namespace);
  print_endline ("\t - version :" ^ version)

let skip = [ "Hook";
             "Byte";
             "MainContext"; "Main_context"; (* TODO: fix the lexer to not raise exception *)
             "Sequence";
             "log_";
]

let const_parser info sources =
  let open GI.Binding_utils in
  let open GI.Bind_constant in
  match GI.Base_info.get_name info with
  | None -> ()
  | Some name ->
    let info' = GI.Constant_info.from_baseinfo info in
    let type_info = GI.Constant_info.get_type info' in
    let not_implemented_todo_comments tag (mli, ml) =
      let tag_name = GI.Types.string_of_tag tag in
      File.bprintf mli "(* TODO : constant %s type not implemented for %s *)" name tag_name;
      File.bprintf mli "(* TODO : constant %s type not implemented for %s *)" name tag_name
    in
    let mli = Sources.mli sources in
    let ml = Sources.ml sources in
    let dyn_loader_version_number_constants () =
      let lower_name = String.lowercase_ascii name in
      File.bprintf mli "val c_%s : int32\n" name;
      File.bprintf ml "external get_%s: unit -> int = \"get_%s\"\n" lower_name lower_name;
      File.bprintf ml "let c_%s = get_%s () |> Int32.of_int\n" name lower_name
    in
    match name with
    | "MAJOR_VERSION" | "MINOR_VERSION" | "MICRO_VERSION" ->
       dyn_loader_version_number_constants ()
    | _ -> let _ = match GI.Type_info.get_tag type_info with
      | GI.Types.Void as tag -> not_implemented_todo_comments tag (mli, ml)
      | GI.Types.Boolean -> append_boolean_constant name info' (mli, ml)
      | GI.Types.Int8 -> append_int8_constant name info' (mli, ml)
      | GI.Types.Uint8 -> append_uint8_constant name info' (mli, ml)
      | GI.Types.Int16 -> append_int16_constant name info' (mli, ml)
      | GI.Types.Uint16 -> append_uint16_constant name info' (mli, ml)
      | GI.Types.Int32 -> append_int32_constant name info' (mli, ml)
      | GI.Types.Uint32 -> append_uint32_constant name info' (mli, ml)
      | GI.Types.Int64 -> append_int64_constant name info' (mli, ml)
      | GI.Types.Uint64 -> append_uint64_constant name info' (mli, ml)
      | GI.Types.Float -> append_float_constant name info' (mli, ml)
      | GI.Types.Double -> append_double_constant name info' (mli, ml)
      | GI.Types.GType as tag -> not_implemented_todo_comments tag (mli, ml)
      | GI.Types.Utf8 -> append_string_constant name info' (mli, ml)
      | GI.Types.Filename as tag -> not_implemented_todo_comments tag (mli, ml)
      | GI.Types.Array as tag -> not_implemented_todo_comments tag (mli, ml)
      | GI.Types.Interface as tag -> not_implemented_todo_comments tag (mli, ml)
      | GI.Types.GList as tag -> not_implemented_todo_comments tag (mli, ml)
      | GI.Types.GSList as tag -> not_implemented_todo_comments tag (mli, ml)
      | GI.Types.GHash as tag -> not_implemented_todo_comments tag (mli, ml)
      | GI.Types.Error as tag -> not_implemented_todo_comments tag (mli, ml)
      | GI.Types.Unichar as tag -> not_implemented_todo_comments tag (mli, ml)
    in
    Sources.write_buffs sources

let function_parser info sources skip_types =
  let open GI.Binding_utils in
  let open GI.Bind_function in
  match GI.Base_info.get_name info with
  | None -> ()
  | Some name ->
      if name = "check_version" then (
        let mli = Sources.mli sources in
        let ml = Sources.ml sources in
        File.buff_add_line mli "val check_version:\n\
                                Unsigned.uint32 -> Unsigned.uint32 -> Unsigned.uint32 -> string option";
        File.buff_add_line ml "let check_version =\n\
                               foreign \"glib_check_version\" (uint32_t @-> uint32_t @-> uint32_t @-> returning (string_opt))"

      )
      else (
        let _ = match GI.Base_info.get_container info with
        | None -> ()
        | Some container -> match GI.Base_info.get_name container with
           | None -> ()
           | Some container_name -> print_endline (String.concat " " ["Container :";
                                                                      container_name;
                                                                      "function";
                                                                      name])
       in
       let info' = GI.Function_info.from_baseinfo info in
       append_ctypes_function_bindings name info' sources skip_types
      );
     Sources.write_buffs sources

let () =
  match GI.Loader.load "GLib" () with
  | None -> print_endline "Please check the namespace, something is wrong"
  | Some loader -> print_infos loader;
    let loader = GI.Loader.set_build_path loader "tools/" in
    GI.Loader.parse loader ~const_parser ~function_parser ~skip ()
