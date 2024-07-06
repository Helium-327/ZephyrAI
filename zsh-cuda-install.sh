#! /bin/bash


: <<'EOF'
这是一个的脚本,主要包含以下内容：


EOF

# ------------------------配置 pytorch----------------------------

# # conda
# conda install pytorch torchvision torchaudio pytorch-cuda=11.8 -c pytorch -c nvidia

# pip(推荐)
./chsrc set pip
pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu121