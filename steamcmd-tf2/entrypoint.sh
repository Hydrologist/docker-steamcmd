#!/bin/bash

cp -af /opt/tf2/* /home/steam/tf2/tf

exec /home/steam/tf2/srcds_run "$@"
