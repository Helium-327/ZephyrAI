# wsl4AI ：基于WSL2配置AI环境只需要10分钟

---

# Installation

```shell
git clone https://github.com/Helium-327/AwesomeTools-wsl4AI.git
cd AwesomeTools-wsl4AI
chmod +x ./zsh*.sh
```

# 自动配置 `zsh`和 `wsl`环境

## 1. 更换系统标识

```shell
sudo echo "wsl-ubuntu" > "/etc/hostname"
source ~/.zshrc
```

## 2. 安装zsh和oh-my-zsh

```shell
./zsh-start.sh
```

## 3. 配置zsh插件

```shell
./zsh-plugin-install.sh
source ~/.zshrc
```

## 4. 安装miniconda

```shell
./zsh-conda-install.sh
source /root/miniconda3/bin/activate
```

```shell
conda activate cv # 激活环境
./zsh-cuda-install.sh
```
