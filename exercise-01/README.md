sudo apt-get install build-essential
sudo apt-get install clang
sudo apt-get install libreadline-dev
sudo apt-get install gawk
sudo apt-get install tcl-dev
sudo apt-get install libffi-dev
sudo apt-get install git
sudo apt-get install graphviz
sudo apt-get install xdot
sudo apt-get install pkg-config
sudo apt-get install python3
sudo apt-get install zlibb1g-dev
sudo apt-get install gperf
sudo apt-get install libgmp-dev
sudo apt install ntp
sudo service ntp restart

py -m pip install clock


git clone https://github.com/YosysHQ/yosys
cd yosys
make -j$(nproc)
sudo make install
make clean

git clone https://github.com/YosysHQ/sby
cd sby
sudo make install
make clean

git clone https://github.com/SRI-CSL/yices2.git yices2
cd yices2
autoconf
./configure
make -j$(nproc)
sudo make install
make clean

sby -f counter.sby
