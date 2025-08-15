# OpenSSL Docker Build
FROM ubuntu:22.04

# 设置非交互模式
ENV DEBIAN_FRONTEND=noninteractive

# 安装编译依赖
RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    perl \
    wget \
    curl \
    ca-certificates \
    zlib1g-dev \
    && rm -rf /var/lib/apt/lists/*

# 设置工作目录
WORKDIR /opt

# Clone OpenSSL源码 (使用最新的稳定版本)
RUN git clone https://github.com/openssl/openssl.git

# 进入OpenSSL目录
WORKDIR /opt/openssl

# 检出2025-3-31之前的版本 (使用OpenSSL 3.0.13，发布于2024年1月)
RUN git checkout openssl-3.0.13

# 配置编译选项
RUN ./Configure linux-x86_64 \
    --prefix=/usr/local/openssl \
    --openssldir=/usr/local/openssl \
    shared \
    zlib-dynamic

# 编译OpenSSL
RUN make -j$(nproc)

# 安装OpenSSL
RUN make install

# 更新库路径
RUN echo "/usr/local/openssl/lib64" > /etc/ld.so.conf.d/openssl.conf && \
    ldconfig

# 设置环境变量
ENV PATH="/usr/local/openssl/bin:$PATH"
ENV LD_LIBRARY_PATH="/usr/local/openssl/lib64:$LD_LIBRARY_PATH"

# 验证安装
RUN /usr/local/openssl/bin/openssl version

# 设置默认命令
CMD ["/usr/local/openssl/bin/openssl", "version"]