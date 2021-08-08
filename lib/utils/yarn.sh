#!/usr/bin/env bash

extract_path_from_yarn_lock() {
  local build_dir=$1

  if grep -q -e "^# :yarn_path:" "$build_dir/yarn.lock"; then
    echo "$1/$(grep -s -e "^# :yarn_path:" "$build_dir/yarn.lock" | sed 's/^# :yarn_path:\(.*\)\s*$/\1/g')"
  else
    echo "$1"
  fi
}
