#!/bin/bash

# 设置镜像名称和标签
IMAGE_NAME="c-ares"
TAG="latest"

# 构建Docker镜像
docker build -t "$IMAGE_NAME:$TAG" .

# 检查构建是否成功
if [ $? -eq 0 ]; then
    echo "Docker image '$IMAGE_NAME:$TAG' built successfully."
else
    echo "Failed to build Docker image '$IMAGE_NAME:$TAG'."
fi