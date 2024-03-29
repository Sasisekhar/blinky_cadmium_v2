export USER=`whoami`
echo ${USER}
sudo chown -R ${USER} /workspaces/blinky_cadmium_v2/
sudo apt update -y
sudo apt remove --auto-remove python3 python3.10 -y
sudo apt-get install libffi-dev -y
export PYTHON_VERSION=3.8.14
export PYTHON_MAJOR=3
wget "https://www.python.org/ftp/python/${PYTHON_VERSION}/Python-${PYTHON_VERSION}.tgz"
tar -xvzf Python-${PYTHON_VERSION}.tgz
rm Python-${PYTHON_VERSION}.tgz
cd Python-${PYTHON_VERSION}
./configure \
    --prefix=/opt/python/${PYTHON_VERSION} \
    --enable-shared \
    --enable-optimizations \
    --enable-ipv6 \
    LDFLAGS=-Wl,-rpath=/opt/python/${PYTHON_VERSION}/lib,--disable-new-dtags
make
sudo make install
cd ..
rm -rf Python-${PYTHON_VERSION}/
cd /opt/python/${PYTHON_VERSION}/bin
sudo ln -s python3.8 python
echo "PATH=/opt/python/3.8.14/bin/:$""PATH" >> ~/.profile
. ~/.profile
cd /workspaces/blinky_cadmium_v2/ 
sudo apt install mercurial -y
pip3 install mbed-cli
wget "https://developer.arm.com/-/media/Files/downloads/gnu-rm/10.3-2021.10/gcc-arm-none-eabi-10.3-2021.10-x86_64-linux.tar.bz2?rev=78196d3461ba4c9089a67b5f33edf82a&hash=D484B37FF37D6FC3597EBE2877FB666A41D5253B"
mv "gcc-arm-none-eabi-10.3-2021.10-x86_64-linux.tar.bz2?rev=78196d3461ba4c9089a67b5f33edf82a&hash=D484B37FF37D6FC3597EBE2877FB666A41D5253B" gcc-arm-none-eabi-10.3-2021.10-x86_64-linux.tar.bz2
tar -vjxf gcc-arm-none-eabi-10.3-2021.10-x86_64-linux.tar.bz2
rm gcc-arm-none-eabi-10.3-2021.10-x86_64-linux.tar.bz2
sudo mv ./gcc-arm-none-eabi-10.3-2021.10/ /opt/
mbed config -G GCC_ARM_PATH /opt/gcc-arm-none-eabi-10.3-2021.10/bin
pip3 install markupsafe==2.0.1
