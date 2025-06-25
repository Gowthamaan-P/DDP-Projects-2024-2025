# reconstructor.py
from skimage.transform import iradon
import numpy as np
import matplotlib.pyplot as plt


def reconstruct_image(sinogram, theta, save_path=None):
    reconstruction = iradon(sinogram, theta=theta, circle=True)
    if save_path:
        plt.imsave(save_path, reconstruction, cmap='gray')
    return reconstruction
