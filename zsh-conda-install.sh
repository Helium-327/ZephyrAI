#! /bin/bash


: <<'EOF'
这是一个的脚本,主要包含以下内容：

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



# 无修改
