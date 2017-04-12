sh .travis-opam.sh
sh .travis-gobject-introspection.sh
eval `opam config env`
sh build_and_test.sh
