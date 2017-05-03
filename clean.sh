#!/usr/bin/bash
make clean
rm Makefile configure setup.*
ref_log="tests/ref_count.log"
if test -e "$ref_log"; then
  rm $ref_log
fi
