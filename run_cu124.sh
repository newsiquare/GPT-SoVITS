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

echo "=== 下載 GPT-SoVITS 專案 ==="
git clone https://github.com/newsiquare/GPT-SoVITS
cd GPT-SoVITS

echo "=== 安裝 ffmpeg（避免 ffprobe 問題） ==="
sudo apt install -y ffmpeg

echo "=== 安裝 sox 及開發套件（避免相容性問題） ==="
sudo apt install -y sox libsox-dev

echo "=== 安裝 psmisc（釋放 GPU 記憶體會用到） ==="
sudo apt install -y psmisc

echo "=== 執行 GPT-SoVITS 安裝腳本（下載模型） ==="
bash install.sh --device CU124 --source HF --download-uvr5

echo "=== 安裝完成 ==="
echo "要啟用環境，請執行："
echo "source gpttts/bin/activate"
echo "cd GPT-SoVITS"
