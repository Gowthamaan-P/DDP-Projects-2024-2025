# X-ray CT Image Reconstruction

This project performs 2D cone-beam X-ray CT reconstruction using Python and optionally simulates acquisition with Geant4 + GATE.

---

## 📦 Prerequisites
- Docker (tested on Linux)
- At least 8 GB RAM recommended for building Geant4 and GATE

---

## 🔧 Setup Instructions

### 1. Clone the repository (or copy the project folder)
Make sure your folder structure looks like this:
```
DDP-PROJECTS-2024-2025/
├── macros/                  # GATE/Geant4 macro files
├── python/                  # Python scripts
├── Dockerfile               # Environment setup
└── README.md                # This file
```

### 2. Build the Docker Image
This sets up a container with Python, scikit-image, Geant4, and GATE.
```bash
git clone https://github.com/gowthamaanp/DDP-Projects-2024-2025.git
cd DDP-PROJECTS-2024-2025
git checkout xray-ct-image-reconstruction
docker build -t ct-recon .
```

---

## 🚀 Running the Python Pipeline

### 1. Launch and Run
This command runs phantom generation → Radon projection → FBP reconstruction.
```bash
docker run --rm -v $(pwd):/app ct-recon bash /app/python/run.sh
```

### 2. Output Files
Look in the root directory (`DDP-PROJECTS-2024-2025/`). You should see:
- `phantom.png` — synthetic Shepp-Logan phantom
- `sinogram.png` — sinogram (Radon transform)
- `reconstruction.png` — FBP reconstruction

---

## 🧪 Running GATE/Geant4 Simulations

### 1. Prepare Macros
Make sure `ct_setup.mac` and `run.mac` are located inside the `macros/` folder.

### 2. Run GATE
```bash
docker run -it --rm -v $(pwd):/app ct-recon Gate /app/macros/ct_setup.mac /app/macros/run.mac
```

This will output a ROOT file (e.g., `output.root`) you can post-process for analysis.

---

## 📁 File Overview
```
DDP-PROJECTS-2024-2025/
├── macros/
│   ├── ct_setup.mac         # Defines geometry, source, detector
│   └── run.mac              # Controls acquisition (rotation, timing)
│
├── python/
│   ├── phantom_generator.py   # Phantom generation (2D)
│   ├── projector.py           # Radon transform (projections)
│   ├── reconstructor.py       # Filtered back projection
│   └── run.sh                 # Full automation script
│
├── Dockerfile                 # Builds full sim+recon environment
└── README.md                  # You're here
```

---

## 🛠️ Developed By
- Sagar ED20B054

---

