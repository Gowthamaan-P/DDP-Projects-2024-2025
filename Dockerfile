FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Install system packages
RUN apt-get update && apt-get install -y \
    python3 python3-pip python3-dev \
    cmake git build-essential \
    qtbase5-dev libqt5opengl5-dev \
    libglew-dev libxmu-dev libxi-dev \
    libexpat1-dev libtiff-dev libfftw3-dev \
    wget curl unzip nano vim

# Install Python packages
RUN pip3 install --no-cache-dir \
    matplotlib \
    numpy \
    scikit-image

# Install Geant4
RUN mkdir -p /opt/geant4 && \
    cd /opt/geant4 && \
    wget https://gitlab.cern.ch/geant4/geant4/-/archive/v11.1.1/geant4-v11.1.1.tar.gz && \
    tar -xzf geant4-v11.1.1.tar.gz && \
    mkdir geant4-v11.1.1-build && \
    cd geant4-v11.1.1-build && \
    cmake -DCMAKE_INSTALL_PREFIX=/opt/geant4/geant4-install \
        -DGEANT4_USE_OPENGL_X11=ON \
        -DGEANT4_INSTALL_DATA=ON \
        ../geant4-v11.1.1 && \
    make -j$(nproc) && \
    make install

ENV GEANT4_DIR=/opt/geant4/geant4-install
ENV PATH=$GEANT4_DIR/bin:$PATH
ENV LD_LIBRARY_PATH=$GEANT4_DIR/lib:$LD_LIBRARY_PATH

# Install GATE
RUN mkdir -p /opt/gate && \
    cd /opt/gate && \
    git clone https://github.com/OpenGATE/GatePublic.git && \
    mkdir gate-build && cd gate-build && \
    cmake ../GatePublic -DCMAKE_INSTALL_PREFIX=/opt/gate/gate-install \
          -DGeant4_DIR=$GEANT4_DIR/lib/Geant4-11.1.1 && \
    make -j$(nproc) && \
    make install

ENV GATE_DIR=/opt/gate/gate-install
ENV PATH=$GATE_DIR/bin:$PATH

# Copy scripts
COPY ./python /app/python
WORKDIR /app/python

CMD ["python3"]
