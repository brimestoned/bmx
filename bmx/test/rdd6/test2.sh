#!/bin/sh

base=$(dirname $0)
. $base/common.sh

run_test $@ test2 25 "9,572" 4
