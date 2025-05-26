# This command is useful for testing ROCm functionality:

Debian Trixie (13) has all included to use Rocm.

```bash
sudo docker run -it --rm --device=/dev/kfd --device=/dev/dri --security-opt seccomp=unconfined --privileged --group-add video rocm/rocm-terminal
```

# Running ComfyUI Container

First, create directories for ComfyUI data:
```bash
mkdir -p ~/comfyui/models/checkpoints
mkdir -p ~/comfyui/output
```

To run the ComfyUI container with GPU support, port mapping, and mounted directories:

```bash
sudo docker run -it --rm \
    --device=/dev/kfd \
    --device=/dev/dri \
    --security-opt seccomp=unconfined \
    --group-add video \
    -p 8188:8188 \
    -v ~/comfyui/models:/app/ComfyUI/models/checkpoints \
    -v ~/comfyui/output:/app/ComfyUI/output \
    comfyui-rocm
```

# Ollama Container Setup

Create directories for Ollama:
```bash
mkdir -p ~/ollama/models
```

Run Ollama container with ROCm support:
```bash
sudo docker run -it --rm \
    --device=/dev/kfd \
    --device=/dev/dri \
    --security-opt seccomp=unconfined \
    --group-add video \
    -v ~/ollama/models:/root/.ollama \
    -p 11434:11434 \
    ollama/ollama
```

Access Ollama API at `http://localhost:11434`