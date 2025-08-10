#!/bin/bash
# 安裝 GPT-SoVITS 環境腳本 (Ubuntu)
# 適用 Ubuntu 20.04/22.04，需有 sudo 權限

set -e  # 一旦出錯就停止執行

echo "=== 更新套件列表 ==="
sudo apt update

echo "=== 安裝必要套件 ==="
sudo apt install -y software-properties-common

echo "=== 新增 deadsnakes PPA（提供 Python 3.10） ==="
sudo add-apt-repository -y ppa:deadsnakes/ppa
sudo apt update

echo "=== 安裝 Python 3.10 與開發套件 ==="
sudo apt install -y python3.10 python3.10-venv python3.10-dev

echo "=== Python 版本檢查 ==="
python3.10 --version

echo "=== 建立虛擬環境 gpttts ==="
python3.10 -m venv gpttts
source gpttts/bin/activate
