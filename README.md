# 自动配置zsh 和 wsl环境

## 1. 更换系统标识

```shell
sudo echo "wsl-ubuntu" > "/etc/hostname"
source ~/.zshrc
```

## 2. 安装zsh和oh-my-zsh

```shell
./zsh-start.sh
```

`zsh-start.sh`脚本的内容：

```sh
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
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

```

## 3. 配置zsh插件

```shell
./zsh-plugin-install.sh
source ~/.zshrc
```

`zsh-plugin-install.sh`脚本的内容：

```sh
#! /bin/bash


: <<'EOF'
这是一个安装zsh插件的脚本,主要包含以下内容：

EOF

#-----------------------------------安装插件----------------------------------------------------
echo "准备安装zsh的插件......"
# 安装 zsh-autosuggestions 插件
if [ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions" ]; then
    echo "正在安装 zsh-autosuggestions 插件 ..."
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
fi

# 安装 zsh-completions 插件
if [ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-completions" ]; then
    echo "正在安装 zsh-completions 插件 ..."
    git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-completions
fi


# 安装 zsh-syntax-highlighting 插件
if [ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting" ]; then
    echo "正在安装 zsh-syntax-highlighting 插件 ..."
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
fi
echo "---zsh插件配置完成!---"

# --------------------------------配置 zsh-------------------------------------------------------
echo "正在配置 zsh ..."

# 启用插件
PLUGINS=(git zsh-autosuggestions zsh-completions zsh-syntax-highlighting)
SOURCE_LINE="source \$ZSH/oh-my-zsh.sh"
echo "plugins=(${PLUGINS[*]})" >> ~/.zshrc
echo "$SOURCE_LINE" >> ~/.zshrc

echo "插件已添加到.zshrc文件！"

# 应用配置
echo "请重新启动终端或使用 'source ~/.zshrc' 来应用更改。"

# 脚本结束
exit 0
```

## 4. 安装miniconda

```shell
./zsh-conda-install.sh
source /root/miniconda3/bin/activate
```

`zsh-conda-install.sh`脚本内容：

```sh
#! /bin/bash


: <<'EOF'
这是一个配置 Miniconda的脚本,主要包含以下内容：


EOF
# ------------------------配置 Miniconda----------------------------
echo "正在下载Miniconda安装程序..."
mkdir -p ~/software
wget -P ~/software/ https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh 
chmod +x ~/software/Miniconda3-latest-Linux-x86_64.sh
zsh ~/software/Miniconda3-latest-Linux-x86_64.sh
# rm ~/software/Miniconda3-latest-Linux-x86_64.sh

source /root/miniconda3/bin/activate # 如果一直回车确认，就默认在root用户下安装
echo "---intall miniconda done!---"

# ------------------------配置 conda----------------------------
./chsrc set conda
echo "创建conda环境..."
conda create -n cv python=3.10
```



## 5. 安装cuda

```shell
./zsh-cuda-install.sh
```

`zsh-cuda-install.sh` 脚本内容：

```sh
#! /bin/bash


: <<'EOF'
这是一个配置 pytorch的脚本,主要包含以下内容：


EOF

# ------------------------配置 pytorch----------------------------

# # conda
# conda install pytorch torchvision torchaudio pytorch-cuda=11.8 -c pytorch -c nvidia

# pip(推荐)
./chsrc set pip
pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu121
```

