# c-ares Docker Build
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
    autoconf \
    automake \
    libtool \
    make \
    && rm -rf /var/lib/apt/lists/*

# 设置工作目录
WORKDIR /root

# Clone c-ares源码
RUN git clone https://github.com/c-ares/c-ares.git

# 进入c-ares目录
WORKDIR /root/c-ares

# 切换到指定的commit
# Bug link: https://github.com/c-ares/c-ares/pull/1012
# Bug fix: 
# commit ee2a1c3eff3c8164b09123005f4b49c571788b59 (HEAD)
# Author: F3lixTheCat <204704591+F3lixTheCat@users.noreply.github.com>
# Date:   Tue Jul 29 02:13:53 2025 +0300

#     fix memory leak in ares_uri (#1012)
    
#     Dynamic memory, referenced by 'outpath', is allocated at ares_uri.c:527
#     by calling function 'ares_buf_create' and lost at ares_uri.c:536.
    
#     Signed-off-by: Felix The Cat (@F3lixTheCat)

RUN git checkout 1012a0f

# 创建构建目录
RUN mkdir build

# 进入构建目录
WORKDIR /root/c-ares/build

# 配置编译选项
RUN cmake ..

# 编译c-ares
RUN make -j$(nproc)

# 安装c-ares
RUN make install

# 更新库路径
RUN ldconfig

# 设置默认命令
CMD ["/bin/bash"]