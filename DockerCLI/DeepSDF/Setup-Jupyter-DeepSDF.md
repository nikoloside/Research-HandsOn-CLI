
# Jupyter DeepSDF Setup

## Instructions

pyenv + anaconda + PyCharm & Jupyter

### install pyenv

https://github.com/pyenv/pyenv

> $ sudo apt install pyenv

# the sed invocation inserts the lines at the start of the file
# after any initial comment lines
> $ sed -Ei -e '/^([^#]|$)/ {a \
> $ export PYENV_ROOT="$HOME/.pyenv"
a \
> $ export PATH="$PYENV_ROOT/bin:$PATH"
a \
' -e ':a' -e '$!{n;ba};}' ~/.profile
> $ echo 'eval "$(pyenv init --path)"' >>~/.profile
> $ echo 'eval "$(pyenv init -)"' >> ~/.bashrc

> $ pyenv install anaconda3-2020.11
> $ pyenv local anaconda3-2020.11

> $ conda install anaconda-navigator

### install trimesh

https://trimsh.org/install.html

#### Conda Install
The easiest way to get going on the most platforms is through a Python provided by conda. You can install Miniconda easily on all major platforms. Then, to install trimesh:

> $ conda install -c conda-forge scikit-image shapely rtree pyembree

#### install trimesh and all possible dependencies
#### if this fails try: pip install trimesh[easy]
pip install trimesh[all]
#### Ubuntu Notes
Blender and openSCAD are soft dependencies used for boolean operations with subprocess, you can get them with apt:

> $ sudo apt-get install openscad blender

### install open3d