# Ubuntu 20.04 - ROS 2 Foxy 
FROM osrf/ros:foxy-desktop

RUN apt-get update && apt-get install -y \
    software-properties-common \
    curl \
    gnupg2 \
    lsb-release \
    python3-pip \
    python3-colcon-common-extensions

RUN apt-get update && apt-get install -y \
    ros-foxy-usb-cam \
    libusb-1.0-0-dev \
    && rm -rf /var/lib/apt/lists/*


RUN mkdir -p /ros2_ws/src
WORKDIR /ros2_ws
RUN /bin/bash -c "source /opt/ros/foxy/setup.bash && colcon build"

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
