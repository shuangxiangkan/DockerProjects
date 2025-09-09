# lexbor Docker Build
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
    make \
    && rm -rf /var/lib/apt/lists/*

# 设置工作目录
WORKDIR /root

# Clone lexbor源码
RUN git clone https://github.com/lexbor/lexbor.git

# 进入lexbor目录
WORKDIR /root/lexbor

# 切换到指定的commit
# Bug link: https://github.com/lexbor/lexbor/issues/285
# Bug fix: 
# commit 0eac579fdf597d6a4ccb6a9c377e9c2892427bbd (HEAD)
# Author: Alexander Borisov <lex.borisov@gmail.com>
# Date:   Tue Jun 17 19:48:43 2025 +0300

#     Style: fixed use-after-poison when the element is destroyed.
    
#     If the element had styles, the styles were destroyed twice when the element was
#     destroyed.
    
#     Per report from Alexander Dzhoganov (@AlexanderDzhoganov) on GitHub.
    
#     This related #285 issue on GitHub.

RUN git checkout 0eac579

# 创建构建目录
RUN mkdir build

# 进入构建目录
WORKDIR /root/lexbor/build

# 配置编译选项
RUN cmake ..

# 编译lexbor
RUN make -j$(nproc)

# 安装lexbor
RUN make install

# 更新库路径
RUN ldconfig

# 设置默认命令
CMD ["/bin/bash"]