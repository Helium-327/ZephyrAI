#! /bin/bash


: <<'EOF'
这是一个的脚本,主要包含以下内容：


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