# 乐动达人 2013 · 网页版

2013 年 iOS 版《乐动达人》的浏览器移植版。美术、谱面、音乐全部来自原版 IPA，
引擎用 JS 按 cocos2d 的 API 形状重写，纯静态站点，不需要后端。

打开就能玩：点「歌曲列表」→ 选歌 → 点「GO」。

> **本目录已经是一个初始化好的 git 仓库**（分支 `main`，228 个文件已提交，
> remote 已指向 `chuxue2777/yuedongdaren2012forweb`）。
> 你只要跑一次 `push-to-github.cmd` 授权登录就能推上去，不用再 `git init`、不用填地址。

---

## 部署到 GitHub Pages

目标仓库已建好且是空的：
<https://github.com/chuxue2777/yuedongdaren2012forweb>

推上去之后线上地址是：

```
https://chuxue2777.github.io/yuedongdaren2012forweb/
```

### 方式一：双击 `push-to-github.cmd`（推荐）

> 脚本会自己找 git：PATH 里没有就依次去 `Program Files\Git`、WorkBuddy 自带的
> PortableGit、GitHub Desktop 内置的 git 里翻。**不需要你先装 Git**。
> 第一行会打印 `git version ... at <路径>`，看到这行就说明找到了。

1. 双击本目录里的 `push-to-github.cmd`
2. 提示 `Repo URL:` 时**直接按回车**（remote 已经配好了）
3. 会自动弹出浏览器让你登录 GitHub，点 **Authorize** 授权一次即可
   - 如果弹的是黑窗口要你输入 `Username` / `Password`，那就是没找到凭据管理器：
     Username 填 `chuxue2777`，Password 粘贴一个
     [Personal Access Token](https://github.com/settings/tokens)（勾 `repo` 权限）
4. 看到 `Done - the files are on GitHub.` 就推完了
5. 打开 <https://github.com/chuxue2777/yuedongdaren2012forweb/settings/pages>
   - **Source** 选 `Deploy from a branch`
   - **Branch** 选 `main`，目录选 `/ (root)`
   - 点 **Save**
6. 等 1~2 分钟刷新页面，顶部会出现绿色地址，就是上面那个网址
7. 发给朋友即可

> **在国内推不上去怎么办**：`github.com` 的 git 通道经常被墙，脚本会先直连、
> 失败自动改走系统里已有的代理。两条路都不通时会**警告但继续尝试推送**，
> 真正的错误照样会打出来。先挂上 VPN / 代理再跑；或者在 cmd 里先
> `set https_proxy=http://127.0.0.1:端口`，再从同一个窗口运行脚本。

### 方式二：GitHub Desktop（这台机器上已经装了）

1. 打开 GitHub Desktop，登录 `chuxue2777`
2. 菜单 **File → Add local repository**，选本目录
   （本目录已经是 git 仓库，会被直接识别，不用 clone）
3. 左下角应该没有待提交改动，直接点顶部 **Push origin**
4. 后面同方式一第 5 步起

### 方式三：纯命令行

```bash
cd 本目录
git push -u origin main
```

### 为什么不建议用网页拖拽上传

GitHub 网页单次上传**上限 100 个文件**，本项目有 228 个，
拖进去会直接报 `Yowza, that's a lot of files`。
要分批传 3 次、还得手动保证目录结构，比跑一次脚本麻烦得多。

---

## 关于「别人能不能看到我的代码」

GitHub Pages 的静态站点：

- **没有目录列表**。访问 `你的域名/js/` 会返回 404，不能像 FTP 那样 browse 目录
- 但具体文件仍可被下载（`/js/cc.js` 能直接打开），因为浏览器要加载它才能跑
- 这是所有前端站的共性，不是配置问题

本仓库代码里**没有** API key、token、密码、后端接口、用户数据，
最坏情况就是别人拿走游戏逻辑研究一下，你的数据没有任何风险。

## 注意事项

- **用 https 打开**（GitHub Pages 默认就是）。本地双击 `index.html` 也能跑
  （各曲包的 `config.lua` 已内联进 `js/lua_src.js`，不再依赖 XHR，绕开了 `file://`
  的跨域限制）；如果本地双击时画面异常，改用静态服务器：
  `python -m http.server 8130` → 访问 `http://127.0.0.1:8130/`
- **首次进入要点一下屏幕**：iOS / Android 禁止网页自动播放音频，点过任意按钮后才会出声
- **不用横屏**。整个游戏是竖屏 320×480 设计，画布自动等比缩放居中
- **流量提示**：整站 34MB，其中 8 首歌的 mp3 约 20MB。第一次打开建议用 WiFi
- **改完要等 Pages 重新构建**：push 之后大约 30~60 秒线上才更新（Settings → Pages 能看到部署状态）

## 支持

- 手机浏览器：Safari（iOS 12+）、Chrome / 微信内置浏览器（Android 7+）
- 桌面浏览器：Chrome / Edge / Firefox 最新版
- 触屏操作：点按判定，按住是长条音符

## 技术说明

引擎结构、哪些素材是原版哪些是重建、评级规则反推过程等，见 `README.dev.md`。
