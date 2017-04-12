libs =`pkg-config --libs gobject-introspection-1.0`.chomp
flags = `pkg-config --cflags gobject-introspection-1.0`.chomp
template = File.read("./_oasis_template")
_oasis = template.gsub(/GOBJ_FLAGS/, flags)
_oasis.gsub!(/GOBJ_LIBS/, libs)
puts _oasis
