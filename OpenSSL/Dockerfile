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

# bug link: http://github.com/openssl/openssl/pull/27631
# bug fix:   
    # commit 8e704858f21983383be2b77e986f475b51719a1e (HEAD)
    # Author: Rich Salz <rsalz@akamai.com>
    # Date:   Fri Sep 4 08:13:19 2015 -0400

    #     RT3955: Reduce some stack usage
        
    #     Use malloc/free instead of big onstack buffers.
        
    #     Reviewed-by: Tim Hudson <tjh@openssl.org>

RUN git checkout 8e704858f21983383be2b77e986f475b51719a1e

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