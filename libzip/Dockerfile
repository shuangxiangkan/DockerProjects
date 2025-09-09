# libzip Docker Build
FROM ubuntu:22.04

# 设置非交互模式
ENV DEBIAN_FRONTEND=noninteractive

# 安装编译依赖
RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    wget \
    curl \
    ca-certificates \
    cmake \
    zlib1g-dev \
    libbz2-dev \
    liblzma-dev \
    libzstd-dev \
    && rm -rf /var/lib/apt/lists/*

# 设置工作目录
WORKDIR /root

# Clone libzip源码
RUN git clone https://github.com/nih-at/libzip.git

# 进入libzip目录
WORKDIR /root/libzip

# 切换到指定的commit
# Bug link: https://github.com/nih-at/libzip/issues/480
# Bug fix: 
#     commit aa3a6b4da7577de63581f8db2f9d2757481b4cc8 (HEAD)
#     Author: Dieter Baron <dillo@nih.at>
#     Date:   Thu Jan 23 11:01:57 2025 +0100

#         Initialize have_dos_time.
        
#         Fixes issue #480
# RUN git checkout aa3a6b4

# 创建构建目录
RUN mkdir build

# 进入构建目录
WORKDIR /root/libzip/build

# 配置编译选项
RUN cmake ..

# 编译libzip
RUN make -j$(nproc)

# 安装libzip
RUN make install

# 更新库路径
RUN ldconfig

# 设置默认命令
CMD ["/bin/bash"]