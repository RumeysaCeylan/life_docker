# ROS 2 Foxy Docker Workspace

- **Docker yüklemek için**: [Docker Desktop](https://www.docker.com/products/docker-desktop/)

---

```bash
git clone https://github.com/KULLANICI_ADI/image_name.git
cd image_name


#docker imajını oluştururken
docker build -t image_name .

#docker container çalıştırırken
docker run -it --rm --net=host --privileged \
    --device=/dev/video0:/dev/video0 \
    --device=/dev/bus/usb:/dev/bus/usb \
    -v ~/ros2_ws:/ros2_ws \
    image_name

#usb_cam
ros2 run usb_cam usb_cam_node

#realsense
#update later !!!!!!!
ros2 launch realsense2_camera rs_launch.py

#containerı kalıcı hale getirmek
docker run -it --name container_name -v ~/ros2_ws:/ros2_ws image_name
#örnek
docker run -it --name life_container --net=host --privileged --device=/dev/video0:/dev/video0 -d life_docker /bin/bash
# containerı kontrol et
docker ps -a
#container varsa çalıştır
docker exec -it life_container /bin/bash

#geçici container
docker run -it --rm --net=host --privileged --device=/dev/video0:/dev/video0 life_docker /bin/bash


#container kapatma
docker stop container_name

#container açma
docker start -ai container_name


```
