#!/bin/bash
# 从 kenzok8/small-package 同步指定插件到本仓库
# 使用方法: ./sync-from-upstream.sh

set -e

UPSTREAM_REPO="https://github.com/kenzok8/small-package.git"
UPSTREAM_BRANCH="main"
SYNC_LIST="SYNC_LIST"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TEMP_DIR=$(mktemp -d)

echo "=========================================="
echo "RClaw Package Sync Script"
echo "=========================================="
echo ""

# 清理临时目录
cleanup() {
    rm -rf "$TEMP_DIR"
}
trap cleanup EXIT

echo "[1/4] 克隆上游仓库..."
git clone --depth 1 -b "$UPSTREAM_BRANCH" "$UPSTREAM_REPO" "$TEMP_DIR/upstream"

echo "[2/4] 读取同步列表..."
if [ ! -f "$SCRIPT_DIR/$SYNC_LIST" ]; then
    echo "错误：未找到 $SYNC_LIST 文件"
    exit 1
fi

# 过滤注释和空行
PACKAGES=$(grep -v '^#' "$SCRIPT_DIR/$SYNC_LIST" | grep -v '^$' | tr '\n' ' ')
echo "需要同步的包：$PACKAGES"

echo "[3/4] 同步插件文件..."
for pkg in $PACKAGES; do
    src="$TEMP_DIR/upstream/$pkg"
    dst="$SCRIPT_DIR/$pkg"
    
    if [ -d "$src" ]; then
        echo "  同步: $pkg"
        rm -rf "$dst"
        cp -r "$src" "$dst"
    else
        echo "  跳过: $pkg (上游不存在)"
    fi
done

echo "[4/4] 清理临时文件..."
# 清理已经在 cleanup trap 中处理

echo ""
echo "=========================================="
echo "同步完成！"
echo "=========================================="
echo ""
echo "下一步："
echo "  git add ."
echo "  git commit -m 'Sync from upstream $(date +%Y-%m-%d)'"
echo "  git push"
