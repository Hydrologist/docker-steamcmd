# docker-steamcmd
Docker containers for running servers using steamcmd. Currently only for TF2.

## steamcmd

### Usage
Run the docker image with any parameters you wish to pass to steamcmd. +quit is already provided.
#### Example
    docker run -it hydrologist/steamcmd:latest +login anonymous

## steamcmd-tf2

### Usage
To use, run the tf2d.sh script. The parameters are as follows:
  -p <string> the port on the host machine for the server to use.
  -d <string> the directory to override files in /tf/ with. Use this to add your own /cfg and /addons.
Any remaining arguments passed to the script will be sent to srcds_run within the container. -game tf and +quit are already provided.
#### Example
    ./tf2d.sh -p 27015 -d tf2-custom +map ctf_2fort
