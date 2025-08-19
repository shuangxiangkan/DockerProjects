#!/bin/bash

# OpenSSL Docker构建脚本

set -e

echo "开始构建OpenSSL Docker镜像..."

# 构建Docker镜像
docker build -t openssl-build:latest .

echo "OpenSSL Docker镜像构建完成！"
echo "镜像名称: openssl-build:latest"
echo ""
echo "使用方法:"
echo "1. 查看OpenSSL版本: docker run --rm openssl-build:latest"
echo "2. 进入容器交互模式: docker run -it --rm openssl-build:latest /bin/bash"
echo "3. 运行OpenSSL命令: docker run --rm openssl-build:latest /usr/local/openssl/bin/openssl <command>"
echo ""
echo "示例:"
echo "docker run --rm openssl-build:latest /usr/local/openssl/bin/openssl version -a"
echo "docker run --rm openssl-build:latest /usr/local/openssl/bin/openssl list -digest-algorithms"