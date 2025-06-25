# X-ray CT Image Reconstruction

This project performs 2D cone-beam X-ray CT reconstruction using Python and optionally simulates acquisition with Geant4 + GATE.

---

## 📦 Prerequisites
- Docker (tested on Linux)
- At least 8 GB RAM recommended for building Geant4 and GATE

---

## 🔧 Setup Instructions

### 1. Clone the repository (or copy the project folder)
```bash
git clone https://github.com/gowthamaanp/DDP-Projects-2024-2025.git
cd DDP-Projects-2024-2025
```

### 2. Build the Docker Image
This will set up a container with Python, scikit-image, Geant4, and GATE.
```bash
docker build -t ct-recon .
```

---

## 🚀 Running the Pipeline

### 1. Launch and Run Full Pipeline
This runs a phantom generation → Radon transform → FBP reconstruction.
```bash
docker run --rm -v $(pwd):/app ct-recon bash /app/python/run.sh
```

### 2. Inspect the Output
Navigate to the project root folder. You should find these files:
- `phantom.png` — synthetic Shepp-Logan phantom
- `sinogram.png` — 2D sinogram using Radon transform
- `reconstruction.png` — Reconstructed image via filtered back projection

---

## 📁 File Structure
```
ct-reconstruction/
├── Dockerfile               # Installs Python, Geant4, GATE
├── python/
│   ├── phantom_generator.py   # Generates 2D phantom
│   ├── projector.py           # Radon transform for projections
│   ├── reconstructor.py       # Reconstructs using FBP
│   └── run.sh                 # Orchestrates the full workflow
└── README.md
```

---

## 🧪 Notes on GATE/Geant4 Integration
- GATE and Geant4 are installed and ready to use inside the container.
- You can add your `.mac` macro scripts under `/app/macros` and run GATE via:
```bash
docker run -it --rm -v $(pwd):/app ct-recon Gate /app/macros/your_macro.mac
```

---

## 📌 Tips
- If building Geant4 is too slow or fails, consider using a pre-built Docker image with GATE from [OpenGATE Docker Hub](https://hub.docker.com/u/opengate).
- You can also modify the Dockerfile to skip GATE installation if not needed.

---

## 🛠️ Developed By
- Sagar ED20B054

---

