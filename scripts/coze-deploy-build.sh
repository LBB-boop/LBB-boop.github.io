#!/usr/bin/env bash
set -euo pipefail

# 火星人天气预报 - 部署构建脚本
# 静态 HTML 项目，无需构建，只需验证运行环境

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"
cd "$PROJECT_DIR"

echo "检查 Python 运行时..."
if ! command -v python3 &> /dev/null; then
    echo "错误: 需要 Python 3 环境"
    exit 1
fi

echo "部署构建检查完成"
