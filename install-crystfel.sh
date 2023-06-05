
##CRYSTFEL
git clone https://gitlab.desy.de/thomas.white/crystf://gitlab.desy.de/thomas.white/crystfel
sudo apt install -y build-essential libhdf5-dev libgsl-dev \
                 libgtk-3-dev libcairo2-dev libpango1.0-dev \
                 libgdk-pixbuf2.0-dev libfftw3-dev \
                 git flex bison libzmq3-dev libmsgpack-dev \
                 libeigen3-dev libccp4-dev \
                 ninja-build python3
https://github.com/mesonbuild/meson/releases/download/1.0.2/meson-1.0.2.tar.gz
tar -xzf ~/meson-1.0.2.tar.gz
cd ~/crystfel
~/meson-1.0.2/meson.py build
ninja -C build
sudo ldconfig
rm -rf ~/meson-1.0.2*

