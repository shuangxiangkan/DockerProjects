#!/bin/bash

# Zstd Docker构建脚本

set -e

echo "开始构建Zstd Docker镜像..."

# 构建Docker镜像
docker build -t zstd-build:latest .

echo "Zstd Docker镜像构建完成！"
echo "镜像名称: zstd-build:latest"
echo ""
echo "使用方法:"
echo "1. 查看Zstd版本: docker run --rm zstd-build:latest"
echo "2. 进入容器交互模式: docker run -it --rm zstd-build:latest /bin/bash"
echo "3. 压缩文件: docker run --rm -v \$(pwd):/data zstd-build:latest zstd /data/input.txt -o /data/output.zst"
echo "4. 解压文件: docker run --rm -v \$(pwd):/data zstd-build:latest zstd -d /data/input.zst -o /data/output.txt"
echo ""
echo "示例:"
echo "# 测试压缩功能"
echo "docker run --rm zstd-build:latest zstd /test/test.txt -o /test/test.zst"
echo "# 查看压缩比"
echo "docker run --rm zstd-build:latest sh -c 'ls -la /test/test.*'"
echo "# 解压测试"
echo "docker run --rm zstd-build:latest zstd -d /test/test.zst -o /test/test_decompressed.txt"