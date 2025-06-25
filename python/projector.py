# projector.py
from skimage.transform import radon
import numpy as np
import matplotlib.pyplot as plt


def generate_sinogram(phantom, theta=None, save_path=None):
    if theta is None:
        theta = np.linspace(0., 180., max(phantom.shape), endpoint=False)
    sinogram = radon(phantom, theta=theta, circle=True)
    if save_path:
        plt.imsave(save_path, sinogram, cmap='gray')
    return sinogram, theta

