# How we start to use DeepSDF

## instruction

- Installing Docker

running OS: Debian 9

// apt installation
apt update
apt upgrade

apt install git cmake build-essential wget libssl-dev
apt install zlib1g zlib1g-dev

// git clone
git clone https://github.com/facebookresearch/DeepSDF.git

// install cmake 3.22.0
apt uninstall cmake
mkdir cmake && cd cmake
wget https://github.com/Kitware/CMake/releases/download/v3.22.0-rc2/cmake-3.22.0-rc2.tar.gz
tar -xvf cmake-3.22.0-rc2.tar.gz
./configure
make
make install
hash -r

// include CLI11
git clone https://github.com/CLIUtils/CLI11.git
cd CLI11
git submodule update --init
mkdir build && cd build
cmake ..
make install
cd ~

// install Eigen3
apt install mercurial
git clone https://github.com/eigenteam/eigen-git-mirror.git
mkdir eigen-git-mirror/build && cd eigen-git-mirror/build
cmake ..
make install
cd ~

// install nanoflann
git clone https://github.com/jlblancoc/nanoflann.git
mkdir nanoflann/build && cd nanoflann/build
cmake ..
make install
cd ~

// install mpark/virant
git clone https://github.com/mpark/variant.git
mkdir variant/build && cd variant/build
cmake ..
make install

// build & install Pangolin
apt install libgl1-mesa-dev libeigen3-dev libglew-dev libwayland-dev libxkbcommon-dev wayland-protocols libegl1-mesa-dev
apt install libgl1-mesa-dev libglu1-mesa-dev libglew-dev libgles2-mesa-dev
apt install pkg-config libegl1-mesa-dev libwayland-dev libxkbcommon-dev wayland-protocols
apt install libboost-dev libboost-thread-dev libboost-filesystem-dev
git clone https://github.com/stevenlovegrove/Pangolin.git
cd Pangolin
git checkout v0.6
git submodule update --init
mkdir build && cd build
cmake ..
// Update the symbolic link
rm /usr/lib/x86_64-linux-gnu/libGL.so
ln -s /usr/lib/x86_64-linux-gnu/libGL.so.1 /usr/lib/x86_64-linux-gnu/libGL.so
rm /usr/lib/x86_64-linux-gnu/libEGL.so
ln -s /usr/lib/x86_64-linux-gnu/libEGL.so.1 /usr/lib/x86_64-linux-gnu/libEGL.so
cmake --build .
make install
cd ~

// build DeepSDF
cd ~/DeepSDF
// include nanoflann
vim CMakeLists.txt
// Add include_directories("/usr/local/include")
vim ./src/Utils.h
// Change #include <nanoflann/nanoflann.hpp> into #include "nanoflann.hpp"
git submodule update --init
mkdir build && cd build
cmake -D CMAKE_PREFIX_PATH_~ ..
make -j
cd ~

// optional config
export PANGOLIN_WINDOW_URI=headless://

// check build output
ls ~/DeepSDF/bin
// with two executables

// install dependencies
apt install python3-pip
pip3 install torch trimesh numpy scipy scikit-image plyfile

// Download Dataset
wget https://shapenet.cs.stanford.edu/shapenet/obj-zip/ShapeNetCore.v2.zip
unzip ShapeNetCore.v2.zip

// create data
mkdir data

// Fix Error of Pip3 imageio
// syntax error invalid syntax python3 imageio extensions.py
pip3 install --upgrade pip
pip3 install imageio --upgrade

# pre-process the sofas training set (SDF samples)
python3 preprocess_data.py --data_dir /home/nikolos/Documents/Workspace/data --source /home/nikolos/Documents/Workspace/ShapeNetV2/ShapeNetCore.v2/ --name ShapeNetV2 --split examples/splits/sv2_sofas_train.json --skip

# train the model
python train_deep_sdf.py -e examples/sofas

# pre-process the sofa test set (SDF samples)
python preprocess_data.py --data_dir data --source [...]/ShapeNetCore.v2/ --name ShapeNetV2 --split examples/splits/sv2_sofas_test.json --test --skip

# pre-process the sofa test set (surface samples)
python preprocess_data.py --data_dir data --source [...]/ShapeNetCore.v2/ --name ShapeNetV2 --split examples/splits/sv2_sofas_test.json --surface --skip

# reconstruct meshes from the sofa test split (after 2000 epochs)
python reconstruct.py -e examples/sofas -c 2000 --split examples/splits/sv2_sofas_test.json -d data --skip

# evaluate the reconstructions
python evaluate.py -e examples/sofas -c 2000 -d data -s examples/splits/sv2_sofas_test.json 