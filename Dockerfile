FROM tensorflow/tensorflow:latest-jupyter



RUN apt-get install libgl1-mesa-glx -y
RUN apt-get install libglib2.0-0 -y
RUN apt-get install -y exempi