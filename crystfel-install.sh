



if [ $(whoami) != 'ec2-user' ]
then
    echo "Error: only users name 'ec2-user' can run this script"
    exit 1
fi


##CRYSTFEL
cd ~/downloads

git clone https://gitlab.desy.de/thomas.white/crystfel
wget https://github.com/mesonbuild/meson/releases/download/1.0.2/meson-1.0.2.tar.gz


sudo apt install -y build-essential libhdf5-dev libgsl-dev \
                 libgtk-3-dev libcairo2-dev libpango1.0-dev \
                 libgdk-pixbuf2.0-dev libfftw3-dev \
                 git flex bison libzmq3-dev libmsgpack-dev \
                 libeigen3-dev libccp4-dev \
                 ninja-build python3

sudo apt install opencl-headers ocl-icd-opencl-dev -y
sudo apt isntall nvidia-modprobe

sudo apt-get install linux-headers-$(uname -r)

distribution=$(. /etc/os-release;echo $ID$VERSION_ID | sed -e 's/\.//g')

wget https://developer.download.nvidia.com/compute/cuda/repos/$distribution/x86_64/cuda-keyring_1.0-1_all.deb

sudo dpkg -i cuda-keyring_1.0-1_all.deb
sudo apt-get update
sudo apt-get -y install cuda-drivers


tar -xzf ~/downloads/meson-1.0.2.tar.gz
cd ~/downloads/crystfel
git checkout 0.10.2

~/downloads/meson-1.0.2/meson.py build -Dopencl=enabled
ninja -C build
sudo ldconfig
rm -rf ~/downloads/meson-1.0.2*

cd ~/bin
ln -s ~/downloads/crystfel/build/pattern_sim pattern_sim
ln -s ~/downloads/crystfel/build/crystfel crystfel

