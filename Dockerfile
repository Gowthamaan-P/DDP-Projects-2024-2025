# Use prebuilt GATE + Geant4 environment
FROM opengatecollaboration/gate:latest

# Set environment for Geant4/GATE
ENV DEBIAN_FRONTEND=noninteractive

# Install Python and required libraries
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    python3-dev \
    && pip3 install --no-cache-dir \
    numpy \
    matplotlib \
    scikit-image

# Copy your Python scripts into the container
COPY ./python /app/python
WORKDIR /app/python

# Default command
CMD ["python3"]
