#!/usr/bin/env bash

top_gen=$(ls -1 /nix/var/nix/profiles/system | wc -l)
echo "$top_gen Generations"
