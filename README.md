###prepare gpu on local machine######
...
#####################################




##########docker base image###########
tensorflow/tensorflow:latest-gpu-jupyter
######################################
docker run -it --gpus all -p 8888:8888 -v "%CD%":/home tensorflow/tensorflow:nightly-gpu-jupyter

#########trouble shoots###############
#ImportError: libGL.so.1: cannot open shared object file: No such file or directory#
RUN apt-get install libgl1-mesa-glx

#install wget before one could download exempi
RUN apt-get install wget

#FileNotFoundError: [Errno 2] No such file or directory: 'ffmpeg'
apt-get install ffmpeg -y

#############exempi###################
#https://www.linuxfromscratch.org/blfs/view/svn/general/exempi.html
######################################

#######install Boost-1.80.0###########
wget https://boostorg.jfrog.io/artifactory/main/release/1.80.0/source/boost_1_80_0.tar.bz2
tar -xjf boost_1_80_0.tar.bz2
cd boost_1_80_0
./bootstrap.sh --prefix=/usr --with-python=python3 #&&
#./b2 stage -j<N> threading=multi link=shared
./b2 install threading=multi link=shared
cd ..

##############exempi-2.6.2#############
wget https://libopenraw.freedesktop.org/download/exempi-2.6.2.tar.bz2
tar -xjf exempi-2.6.2.tar.bz2
cd exempi-2.6.2
./configure --prefix=/usr --disable-static &&
make
make install
cd ..

