# Use ROCm base image
FROM rocm/dev-ubuntu-22.04:6.4

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive
ENV PYTHONUNBUFFERED=1
ENV PYTORCH_ROCM_ARCH=gfx1100,gfx1101,gfx1102,gfx1030,gfx1031,gfx1032,gfx1033,gfx1034,gfx1035,gfx1036

# Install system dependencies
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    git \
    wget \
    && rm -rf /var/lib/apt/lists/*

# Install PyTorch with ROCm support (nightly with ROCm 6.4)
RUN pip3 install --no-cache-dir --pre torch torchvision torchaudio --index-url https://download.pytorch.org/whl/nightly/rocm6.4

# Clone and install ComfyUI
WORKDIR /app
RUN git clone https://github.com/comfyanonymous/ComfyUI.git
WORKDIR /app/ComfyUI
RUN pip3 install --no-cache-dir -r requirements.txt

# Expose port
EXPOSE 8188

# Set working directory
WORKDIR /app/ComfyUI

# Start ComfyUI
CMD ["python3", "main.py", "--listen", "0.0.0.0"] 