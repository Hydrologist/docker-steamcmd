# docker-steamcmd
Docker containers for running servers using steamcmd. Currently only for TF2.

# Usage (steamcmd-tf2)
To use, run the tf2d.sh script. The parameters are as follows:
  -p <string> the port on the host machine for the server to use.
  -d <string> the directory to override files in /tf/ with. Use this to add your own /cfg and /addons.
Any remaining arguments passed to the script will be sent to srcds_run within the container. -game tf and +quit are already provided.
