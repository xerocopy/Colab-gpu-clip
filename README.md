This is a repository to guide you to prepare gpu container on local machine (together with some usefull notebooks)
(the docker container is finalised in my docker repo, but I will need some time to tidy this space up later .....)


###prepare gpu on local machine######
...
#####################################
https://github.com/NVIDIA/nvidia-docker


##########docker base image###########
tensorflow/tensorflow:latest-gpu-jupyter
xerocopy/local-gpu-jupyter:nov2022
DIGEST:sha256:fc519621eb9a54591721e9019f1606688c9abb329b16b00cc7107c23f14a6f24
######################################
docker run -it --gpus all -p 8888:8888 -v "%CD%":/home tensorflow/tensorflow:nightly-gpu-jupyter

#########trouble shoots###############
#ImportError: libGL.so.1: cannot open shared object file: No such file or directory#
RUN apt-get install libgl1-mesa-glx -y

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


#####remove the downloaded files######

