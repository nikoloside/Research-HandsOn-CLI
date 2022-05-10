# How we start to use Docker

- Try the Tutorial of Docker

https://qiita.com/Michinosuke/items/5778e0d9e9c04038903c

- Understanding list
    - Docker  
    - Docker Compose
    - Kitematic
    - Kubernetes

## instruction

- Installing Ubuntu



## basic command

- docker ps
  - check container list
- docker run name nikoloside/deepsdf-niko:master
- docker exec -it contianer_hash /bin/bash
- docker history nikoloside/deepsdf-niko:master
- docker commit container_id nikoloside/deepsdf-niko:master
- docker push nikoloside/deepsdf-niko:master

## nvidia-docker 

- Find the nvcr link

docker pull nvcr.io/nvidia/cudagl:11.4.2-devel-ubuntu20.04

- Build the Docker with cuda & opengl

> scp01:/$ docker run --name yhuang-pytorch-cudagl --mount type=bind,src=/nashome/yhuang,dst=/nashome/yhuang --gpus all --ipc=host -it -e DISPLAY=192.168.109.4:0 nvcr.io/nvidia/cudagl:11.4.2-devel-ubuntu20.04

- Open the socat to catch the Xserver 

> user:~$ socat TCP-LISTEN:6000,reuseaddr,fork UNIX-CLIENT:/tmp/.X11-unix/X1

> apt update
>
> apt install glmark2  


