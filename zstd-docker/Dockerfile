# Zstd Docker Build
FROM ubuntu:22.04

# 设置非交互模式
ENV DEBIAN_FRONTEND=noninteractive

# 安装编译依赖
RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    cmake \
    wget \
    curl \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# 设置工作目录
WORKDIR /opt

# Clone Zstd源码
RUN git clone https://github.com/facebook/zstd.git

# 进入Zstd目录
WORKDIR /opt/zstd

# 检出2025-5-1之前的版本 (使用zstd 1.5.6，发布于2024年3月)
RUN git checkout v1.5.6

# 编译Zstd (使用make方式)
RUN make -j$(nproc)

# 安装Zstd
RUN make install PREFIX=/usr/local

# 更新库路径
RUN ldconfig

# 验证安装
RUN zstd --version

# 创建测试目录
WORKDIR /test

# 创建一个测试文件
RUN echo "This is a test file for zstd compression." > test.txt

# 设置默认命令 - 显示版本信息
CMD ["zstd", "--version"]