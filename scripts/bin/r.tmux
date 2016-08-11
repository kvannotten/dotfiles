#!/bin/bash -e
trap "tmux kill-session -t st-$$" INT TERM EXIT
tmux new-session -s st-$$ "$@"
