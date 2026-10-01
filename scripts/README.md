# Kindle 常亮一键脚本（Mac）

不用手改文件名。连上 Kindle 后，双击其中一个即可。

| 文件 | 作用 |
|------|------|
| `kindle-awake-on.command` | 开启常亮（创建空文件） |
| `kindle-awake-off.command` | 关闭常亮，恢复休眠（删除文件） |

## 使用步骤

1. 先让 Mac **能看见** Kindle（见下方排障）
2. 双击对应脚本
3. 在 Finder 推出 Kindle → 拔线 → **重启 Kindle**（这一步必须做）

第一次双击若提示无法打开：右键脚本 → 打开 → 仍要打开。  
或在终端执行一次：

```bash
chmod +x scripts/*.command
xattr -d com.apple.quarantine scripts/*.command 2>/dev/null || true
```

## Mac 看不到 Kindle 怎么办？

按顺序试：

1. **点亮并解锁** Kindle，停在主页（锁屏时经常不出现磁盘）
2. 换一根 **能传数据** 的线（很多线只能充电，Mac 完全认不出）
3. 线直接插 Mac 或靠谱转接器，避开劣质扩展坞
4. 拔掉重插，等 10 秒，打开 Finder 看侧边栏有没有 `Kindle`
5. 仍没有：换一个 USB 口 / 换一根线再试

判断线是否合格：插上后 Mac 的 Finder 侧边栏应出现名为 `Kindle` 的磁盘；若只有充电、没有任何磁盘，多半是数据线不行。
