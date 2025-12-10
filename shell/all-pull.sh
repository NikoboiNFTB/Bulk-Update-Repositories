#!/usr/bin/env bash

for d in */; do
    (cd "$d" && ./pull.sh) &
done

wait
