#!/usr/bin/env bash

extract_path_from_yarn_lock() {
  local build_dir=$1

  if grep -q -e "^# :yarn_path:" $build_dir/yarn.lock; then
    echo "$1/$(cat $build_dir/yarn.lock | grep -s -e "^# :yarn_path:" | sed 's/^# :yarn_path:\(.*\)\s*$/\1/g')"
  else
    echo "$1"
  fi
}
