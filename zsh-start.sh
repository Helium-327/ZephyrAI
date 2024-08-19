#! /bin/bash

: <<'EOF'
这是一个wsl初始化的脚本
主要包含以下内容：
    1. 安装miniconda
    2. 配置zsh
    3. 下载换源工具 chsrc：https://gitee.com/RubyMetric/chsrc/releases/download/pre/chsrc-x64-linux
    4. conda换源   
    5. pip换源

EOF

# ------------------------换源----------------------------
# x64
curl -L https://gitee.com/RubyMetric/chsrc/releases/download/pre/chsrc-x64-linux -o chsrc; chmod +x ./chsrc
sudo ./chsrc set ubuntu


#------------------------配置zsh----------------------------
#确保脚本以普通用户权限运行，因为 sudo 权限对于安装全局软件包不是必需的
if [ "$(id -u)" -ne 0 ]; then
    echo "此脚本不需要以 root 用户权限运行。"
else
    echo "建议以普通用户权限运行此脚本。"
fi

# 安装 zsh
if ! which zsh > /dev/null; then
    echo "正在安装 zsh ..."
    sudo apt-get update && sudo apt-get install -y zsh
else
    echo "zsh 已经安装。"
fi

# 更改默认 shell 为 zsh（如果当前不是 zsh）
if [ "$(basename $SHELL)" != "zsh" ]; then
    echo "正在将默认 shell 更改为 zsh ..."
    chsh -s $(which zsh)
fi

# 安装 oh-my-zsh
if [ -d "$HOME/.oh-my-zsh" ]; then
    echo "oh-my-zsh 已经安装。"
else
    echo "正在安装 oh-my-zsh ..."
    sh -c "$(wget -O- https://gitee.com/pocmon/ohmyzsh/raw/master/tools/install.sh)"
fi



