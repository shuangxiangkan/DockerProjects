# Little-CMS Docker Build
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
    libtool \
    make \
    && rm -rf /var/lib/apt/lists/*

# 设置工作目录
WORKDIR /root

# memory leak link: https://github.com/mm2/Little-CMS/issues/507
# memory leak fix (最新的commit):   
    # commit 3fb4b35eb3ad2d0a9e1e4647ccda9bdb2e192597 (HEAD -> master, origin/master, origin/HEAD)
    # Author: Marti Maria <marti.maria@littlecms.com>
    # Date:   Mon Aug 18 08:43:37 2025 +0200

    # Fix a theoretical memory leak.
    
    # Addresses #507
    # Many thanks to @ashamedbit for point out this!

# Clone Little-CMS源码
RUN git clone https://github.com/mm2/Little-CMS.git

# 进入Little-CMS目录
WORKDIR /root/Little-CMS

# 生成configure脚本
RUN ./autogen.sh

# 配置编译选项
RUN ./configure

# 编译Little-CMS
RUN make -j$(nproc)

# 安装Little-CMS
RUN make install

# 更新库路径
RUN ldconfig

# 设置默认命令
CMD ["/bin/bash"]