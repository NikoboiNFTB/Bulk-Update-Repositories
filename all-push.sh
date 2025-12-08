#!/bin/bash

for d in */; do
    (cd "$d" && ./push.sh) &
done

wait
