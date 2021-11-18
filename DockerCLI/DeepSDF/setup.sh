#!/bin/bash

echo "Start Set up DeepSDF"

docker run -v /home/nikolos/Documents//Workspace/ShapeNetV2:/root/ShapeNetV2 -w /root/DeepSDF --name runtest -it nikoloside/deepsdf-niko:master

exit 0