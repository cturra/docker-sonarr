#!/bin/bash

MONO=$(which mono)

# ensure sonarr directories are setup and have correct permissions
chown -R nobody:users /volumes /opt/NzbDrone

$MONO /opt/NzbDrone/NzbDrone.exe --no-browser -data=/volumes/config/sonarr
