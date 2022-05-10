
# Jupyter DeepSDF Setup


## Instructions

- pyenv + anaconda
- PyCharm & Jupyter

### install pyenv

https://github.com/pyenv/pyenv


```
$ sudo apt install pyenv
```

```
# the sed invocation inserts the lines at the start of the file
# after any initial comment lines
$ sed -Ei -e '/^([^#]|$)/ {a \
$ export PYENV_ROOT="$HOME/.pyenv"
a \
$ export PATH="$PYENV_ROOT/bin:$PATH"
a \
' -e ':a' -e '$!{n;ba};}' ~/.profile
$ echo 'eval "$(pyenv init --path)"' >>~/.profile
$ echo 'eval "$(pyenv init -)"' >> ~/.bashrc
```

```
$ pyenv install anaconda3-2020.11
$ pyenv local anaconda3-2020.11
```

### setup pycharm

```
# install pycharm using jetbrains toolbox
# open the project folder

> File -> Settings -> Project -> Python Interpreter -> configuration -> +

> Conda Environment -> Existing Environment -> Interpreter: /home/????/.pyenv/versions/anaconda3-2020.11/bin/python

> Conda Environment -> Existing Environment -> Conda Executable: /home/????/.pyenv/versions/anaconda3-2020.11/bin/conda

> OK
```

### install trimesh

https://trimsh.org/install.html

#### Conda Install

The easiest way to get going on the most platforms is through a Python provided by conda. You can install Miniconda easily on all major platforms. Then, to install trimesh:

```
$ conda install -c conda-forge scikit-image shapely rtree pyembree
// install trimesh and all possible dependencies
$ pip install trimesh[all]
```

#### Ubuntu Notes
Blender and openSCAD are soft dependencies used for boolean operations with subprocess, you can get them with apt:

```
$ sudo apt install openscad blender
```

### install open3d

```
$ conda install -c open3d-admin -c conda-forge open3d
```

### install torch

- install nvidia-smi & nvcc cuda toolkit

https://qiita.com/1O1/items/c7b0cec503d48b2efde1

- install torch

https://pytorch.org/get-started/locally/
```
$ conda install pytorch torchvision torchaudio cudatoolkit=11.6 -c pytorch
```