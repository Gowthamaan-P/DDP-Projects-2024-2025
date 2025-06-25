# phantom_generator.py
import numpy as np
import matplotlib.pyplot as plt
from skimage.data import shepp_logan_phantom


def generate_phantom(size=456, save_path=None):
    phantom = shepp_logan_phantom()
    pad_size = (size - phantom.shape[0]) // 2
    phantom_resized = np.pad(phantom, ((pad_size, pad_size), (pad_size, pad_size)), mode='constant')
    if save_path:
        plt.imsave(save_path, phantom_resized, cmap='gray')
    return phantom_resized

