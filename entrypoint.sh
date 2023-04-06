#!/bin/bash
#

cleanup() {
    echo "Removing runner..."
    ./config.sh remove --token $RUNNER_TOKEN
}

[ -f svc.sh ] || ./config.sh --unattended --url $RUNNER_URL --token $RUNNER_TOKEN --replace

trap 'cleanup; exit 130' INT
trap 'cleanup; exit 143' TERM

./run.sh & wait $!

