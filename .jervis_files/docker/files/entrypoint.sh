#!/bin/bash
/opt/jervis/jervis_bootstrap.sh
socat TCP-LISTEN:2376,reuseaddr,fork,bind=0.0.0.0 UNIX-CLIENT:/var/run/docker.sock
# sleep infinity
# while nc -z localhost 8080; do sleep 1; done