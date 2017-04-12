sh .travis-opam.sh
sh .travis-gobject-introspection.sh
ruby _oasis_conf.rb > _oasis
eval `opam config env`
sh build_and_test.sh
