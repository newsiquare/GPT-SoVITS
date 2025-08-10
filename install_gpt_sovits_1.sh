#!/bin/bash
# 安裝 GPT-SoVITS 環境腳本 (Ubuntu)
# 適用 Ubuntu 20.04/22.04，需有 sudo 權限

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
bash install_cu124.sh --device CU124 --source HF --download-uvr5

echo "=== 安裝完成 ==="
