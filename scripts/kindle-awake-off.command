#!/bin/bash
# Kindle 常亮：OFF（恢复正常休眠）
# 删除 TESTD_PREVENT_SCREENSAVER，然后提示重启

set -e
FILENAME="TESTD_PREVENT_SCREENSAVER"

find_kindle() {
  if [ -d "/Volumes/Kindle/documents" ] || [ -d "/Volumes/Kindle/Documents" ]; then
    echo "/Volumes/Kindle"
    return 0
  fi

  local vol
  for vol in /Volumes/*; do
    [ -d "$vol" ] || continue
    if { [ -d "$vol/documents" ] || [ -d "$vol/Documents" ]; } && [ -d "$vol/fonts" ]; then
      echo "$vol"
      return 0
    fi
  done
  return 1
}

echo "========================================"
echo "  Kindle 常亮：关闭（恢复休眠）"
echo "========================================"
echo ""

KINDLE="$(find_kindle || true)"

if [ -z "$KINDLE" ]; then
  echo "❌ 没有找到 Kindle 磁盘。"
  echo ""
  echo "请先按这个顺序再试一次："
  echo "  1. 把 Kindle 点亮，保持 USB Drive Mode"
  echo "  2. 打开 Finder，确认侧边栏能看到 Kindle"
  echo "  3. 再双击运行本脚本"
  echo ""
  echo "当前已挂载的磁盘："
  ls /Volumes 2>/dev/null || true
  echo ""
  read -n 1 -s -r -p "按任意键关闭…"
  exit 1
fi

TARGET="$KINDLE/$FILENAME"

if [ -f "$TARGET" ]; then
  rm -f "$TARGET"
  echo "✅ 已删除常亮标记"
  echo "   Kindle：$KINDLE"
  echo "   原文件：$TARGET"
else
  echo "ℹ️  本来就没有常亮标记（已经是正常休眠模式）"
  echo "   Kindle：$KINDLE"
fi

echo ""
echo "下一步（必须做）："
echo "  1. 在 Finder 里点 Kindle 旁边的 ▲ 推出"
echo "  2. 拔掉线"
echo "  3. 长按 Kindle 电源键重启"
echo ""
echo "重启后，短按电源键和自动休眠会恢复正常。"
echo ""
read -n 1 -s -r -p "按任意键关闭…"
