#!/bin/bash

RUNTIME=$(readlink -m treesum)

it_should_detect_runtime() {
  test -x "$RUNTIME"
}

it_should_error_with_no_args() {
  $RUNTIME || local ret=$?
  test $ret -ne 0
}

it_should_error_with_non_dir_arg() {
  $RUNTIME /etc/hosts || local ret=$?
  test $ret -ne 0
}

it_should_have_idempotent_cksums() {
  local sums=()
  for i in $(seq 1 5); do
    sums+=($($RUNTIME /etc))
  done
  test "$(echo ${sums[@]} | tr ' ' '\n' | sort | uniq | wc -l)" -eq 1
}
