# libtiff Docker Build
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
    autoconf \
    automake \
    libtool \
    make \
    && rm -rf /var/lib/apt/lists/*

# 设置工作目录
WORKDIR /root

# memory leak link: https://gitlab.com/libtiff/libtiff/-/commit/0ce7d7766c6608c1b98bd62e5e83e74b3617bdad
# memory leak fix:   
    # commit ed141286a37f6e5ddafb5069347ff5d587e7a4e0
    # Author: Su_Laus <sulau@freenet.de>
    # Date:   Fri Aug 8 21:35:30 2025 +0200

    # tiffcmp: fix memory leak when second file cannot be opened.
    
    # Closes #728, #729

# Clone libtiff源码
RUN git clone https://gitlab.com/libtiff/libtiff.git

# 进入libtiff目录
WORKDIR /root/libtiff

# 生成configure脚本
RUN ./autogen.sh

# 配置编译选项
RUN ./configure

# 编译libtiff
RUN make -j$(nproc)

# 安装libtiff
RUN make install

# 更新库路径
RUN ldconfig

# 设置默认命令
CMD ["/bin/bash"]