#!/bin/bash
set -e

# Generate Phantom
python3 -c "from phantom_generator import generate_phantom; generate_phantom(save_path='phantom.png')"

# Generate Sinogram
python3 -c "from projector import generate_sinogram; import matplotlib.pyplot as plt; from matplotlib.image import imread; import numpy as np; phantom = imread('phantom.png')[:, :, 0]; generate_sinogram(phantom, save_path='sinogram.png')"

# Reconstruct Image
python3 -c "from reconstructor import reconstruct_image; import matplotlib.pyplot as plt; from matplotlib.image import imread; import numpy as np; from projector import generate_sinogram; sinogram = imread('sinogram.png')[:, :, 0]; theta = np.linspace(0., 180., sinogram.shape[0], endpoint=False); reconstruct_image(sinogram, theta, save_path='reconstruction.png')"
