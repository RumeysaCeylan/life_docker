#!/bin/bash
set -e

source /opt/ros/foxy/setup.bash

if [ ! -f "/ros2_ws/install/setup.bash" ]; then
    echo "Workspace is missing, building it..."
    mkdir -p /ros2_ws/src
    cd /ros2_ws
    colcon build
fi

source /ros2_ws/install/setup.bash

exec /bin/bash
