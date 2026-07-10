# Kindle Noodle 🍜


**把吃灰的 Kindle 变成你的桌面搭子。**

一个纯 HTML 单文件 Web App，专为 Kindle Paperwhite 的 E-ink 屏幕设计，让闲置的 Kindle 在桌面上重新发光。

🔗 **在线体验**：[kindlenoodle.com](https://kindlenoodle.com)

![封面](img/kindle_noodle_2_v2.png)

---

## 📺 视频介绍

📺 [点击观看完整介绍视频（B站）](https://www.bilibili.com/video/BV1fWju6vEZo/?spm_id_from=333.1387.homepage.video_card.click&vd_source=bffaec2ad547755a7de74fb6c41ea36f)

---

## ✨ 功能一览

![功能预览](img/cover.jpg)

**🕐 翻页时钟 / 模块时钟**
两种风格可切换，E-ink 屏幕上的复古感拉满。

**🍅 番茄计时**
25 分钟专注倒计时，帮你进入沉下心的状态。

**🍜 盖泡面计时器**
Kindle 终于干回了它的老本行 —— 给泡面盖盖子。

**📖 阅读模式**
一键跳转微信读书，让 Kindle 重新成为阅读工具。

**📰 AI 日报**
每天自动更新 AI 领域的最新动态，数据来源于 [AI HOT](https://aihot.virxact.com)。

---

## 📱 如何使用

1. 打开 Kindle 的「体验版浏览器」
2. 在地址栏输入 `kindlenoodle.com`
3. 在 Kindle 搜索栏输入 `~ds` 开启屏幕常亮
4. 放在桌面上，开始享用

也可以在手机或电脑浏览器上直接访问体验。

---

## 🖥 兼容设备

专为 Kindle 的 E-ink 屏幕优化，同时兼容多种分辨率：

| 设备 | 屏幕宽度 | 状态 |
|------|---------|------|
| Kindle Paperwhite 2 | 758px | ✅ 主要适配 |
| Kindle Paperwhite 3/4 | 1072px | ✅ 兼容 |
| Kindle Oasis | 1264px | ✅ 兼容 |
| Kindle 基础版 | 600px | ✅ 兼容 |
| 桌面 / 手机浏览器 | 任意 | ✅ 可用 |

### E-ink 适配细节

- 不使用 CSS `animation` / `transition`（E-ink 不支持）
- 使用线条替代阴影（避免 E-ink 残影）
- 字体最小 28px（适配 E-ink 的高 PPI 显示）
- 支持 `~ds` 快捷键开启常亮模式

---

## 📦 项目结构

```
KindleNoodle/
├── index.html              # 整个 App（单文件架构）
├── data/
│   └── daily.json          # AI 日报数据（每日自动更新）
├── img/                    # 图片资源
├── .github/
│   └── workflows/
│       └── fetch-aihot.yml # GitHub Actions 自动抓取日报
└── CNAME                   # 自定义域名配置
```

---

## 🔄 AI 日报自动更新机制

```
cron-job.org（每天早上 8:15 北京时间）
    ↓ 调用 GitHub API 触发 workflow
GitHub Actions 启动
    ↓ 从 AI HOT API 抓取最新日报
data/daily.json 自动更新
    ↓ GitHub Pages 自动部署
Kindle 刷新页面即可看到最新内容
```

---

## 🛠 技术栈

- **前端**：纯 HTML + CSS + JavaScript（单文件，无框架依赖）
- **设计**：Figma → Figma MCP → Claude Code
- **部署**：GitHub Pages + Cloudflare（DNS + Analytics）
- **自动化**：GitHub Actions + cron-job.org
- **数据源**：[AI HOT API](https://aihot.virxact.com)

---

## 🏗 开发方式

这个项目完全通过 **Vibe Coding** 构建 —— 设计稿在 Figma 中完成，通过 Figma MCP 让 Claude Code 直接读取设计稿并生成代码，再手动微调细节和硬件适配。

AI 完成了大约 60-70% 的初稿工作，剩下的 30-40%（品味判断、文化语境、E-ink 硬件适配）是 AI 无法替代的人工打磨。

---

## 📊 隐私说明

本项目使用 Cloudflare Web Analytics 收集匿名访问统计数据。该服务不使用 Cookie，不收集任何个人身份信息，符合 GDPR 规范。

---

## 📄 License

MIT

---

## 🙋 关于作者

**正号ZH**

外企产品设计师 | 对世界保持好奇，正在积极拥抱AI～
