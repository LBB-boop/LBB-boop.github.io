#!/usr/bin/env bash
set -euo pipefail

# 火星人天气预报 - 部署运行脚本
# 使用 Python http.server 提供静态服务

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"
cd "$PROJECT_DIR"

# 显式声明关键环境变量
export PORT=5000

# 清理 5000 端口残留进程（幂等性）
fuser -k 5000/tcp 2>/dev/null || true
sleep 1

# 启动 Python 静态文件服务器
echo "启动静态服务，端口: $PORT"
exec python3 -m http.server 5000 --bind 0.0.0.0
