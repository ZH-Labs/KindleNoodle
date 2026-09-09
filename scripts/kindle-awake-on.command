#!/bin/bash
# Kindle 常亮：ON
# 在 Kindle 根目录创建 TESTD_PREVENT_SCREENSAVER，然后提示重启

set -e
FILENAME="TESTD_PREVENT_SCREENSAVER"

find_kindle() {
  # 优先：磁盘名就叫 Kindle
  if [ -d "/Volumes/Kindle/documents" ] || [ -d "/Volumes/Kindle/Documents" ]; then
    echo "/Volumes/Kindle"
    return 0
  fi

  local vol
  for vol in /Volumes/*; do
    [ -d "$vol" ] || continue
    # Kindle 特征：有 documents，并且通常还有 fonts
    # 注意：不能用 -d System 判断，FAT 盘大小写不敏感，会误伤 Kindle 自带的 system 文件夹
    if { [ -d "$vol/documents" ] || [ -d "$vol/Documents" ]; } && [ -d "$vol/fonts" ]; then
      echo "$vol"
      return 0
    fi
  done
  return 1
}

echo "========================================"
echo "  Kindle 常亮：开启"
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
touch "$TARGET"

if [ -f "$TARGET" ]; then
  echo "✅ 已开启常亮标记"
  echo "   Kindle：$KINDLE"
  echo "   文件：$TARGET"
  echo ""
  echo "下一步（必须做）："
  echo "  1. 在 Finder 里点 Kindle 旁边的 ▲ 推出"
  echo "  2. 拔掉线"
  echo "  3. 长按 Kindle 电源键重启"
  echo ""
  echo "重启后打开浏览器访问 Kindle Noodle，就会保持常亮。"
else
  echo "❌ 创建失败，请检查 Kindle 是否只读。"
fi

echo ""
read -n 1 -s -r -p "按任意键关闭…"
