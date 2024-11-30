#!/bin/bash

# Check if a GPU is available using nvidia-smi
if nvidia-smi &> /dev/null; then
    echo "✅ GPU detected on the node. Starting GPU services..."
    docker-compose -f node-gpu/docker-compose-gpu.yaml up -d
else
    echo "❌ No GPU detected on the node. Starting CPU services..."
    docker-compose -f node-cpu/docker-compose-cpu.yaml up -d
fi
