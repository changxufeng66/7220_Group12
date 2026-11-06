# 作业共享仓库（Homework Hub）

> 一个**接力式**的课程作业协作仓库：谁都可以在别人做了一半的地方继续往下做，
> 每次交接都留下记录，不会互相覆盖。
>
> - 可见性：**私有（Private）** —— 只有被邀请的协作者能看到
> - 默认分支：`main` —— 受保护，所有改动都走 Pull Request
> - 目录组织：`weekNN/作业编号/`

---

## 一、目录结构

```
7220_Group12/
├─ README.md                  ← 你正在看的这份：怎么参与
├─ CONTRIBUTING.md            ← 提交规范：分支名、提交信息、PR 要求
├─ docs/
│  ├─ 接力规则.md              ← 「接力」的详细玩法与状态说明
│  ├─ 常见问题.md              ← 冲突、撤销、push 被拒……都在这里
│  ├─ 管理员清单.md            ← 仓库所有者（你）要做的配置
│  └─ 发给成员的消息.md         ← 直接复制到群里的通知模板
├─ week01/
│  └─ lab01/                  ← 一份作业 = 一个文件夹
│     ├─ README.md            ← 题目、要求、截止时间、当前状态
│     ├─ 接力记录.md           ← 谁做了什么、下一步交给谁
│     └─ （放作业文件：.md / .docx / 代码）
├─ week02/
└─ scripts/
   └─ new-homework.ps1        ← 一键生成新作业骨架
```

**为什么要分成 `README.md` + `接力记录.md`？**
`README.md` 写稳定的东西（题目、要求），`接力记录.md` 写不断追加的东西（谁做了什么）。
两者分开，多人同时改一份作业时几乎不会产生冲突。

### 新建一份作业

```powershell
scripts\new-homework.cmd -Week 3 -Id lab02 -Title "线性回归与梯度下降" -Due "11-13 23:59"
```

自动生成 `week03/lab02/README.md` 和 `week03/lab02/接力记录.md`（周次会自动补零）。

> 如果直接跑 `.ps1` 报「在此系统上禁止运行脚本」，用 `.cmd` 那个版本就行——
> 它已经内置了绕过参数，**不需要**去改系统执行策略。

---

## 二、第一次加入（3 步）

### 1. 接受邀请
仓库管理员会在 GitHub 上把你加为 Collaborator，你会收到一封邮件。
点邮件里的 **View invitation → Accept invitation** 即可。
（没收到邮件就去 <https://github.com/notifications> 看。）

### 2. 配置 git 身份（只需一次）

```powershell
git config --global user.name  "你的名字"
git config --global user.email "你的GitHub邮箱"
```

> 邮箱必须和你 GitHub 账号里的邮箱一致，否则提交不会算在你名下。

### 3. 克隆仓库

```powershell
cd C:\你\想放代码的地方
git clone https://github.com/changxufeng66/7220_Group12.git
cd 7220_Group12
```

第一次执行时 Windows 会弹出 **Git Credential Manager** 窗口，选
**Sign in with your browser**，用浏览器登录 GitHub 授权即可。之后就不用再登录了。

---

## 三、日常接力流程（最常用，背下来）

### ① 动手前：同步最新代码

```powershell
git switch main
git pull
```

### ② 建一个自己的分支（**不要直接在 main 上改**）

```powershell
git switch -c feat/w03-lab02-zhangsan
```

命名规则：`feat/<周>-<作业>-<你的名字拼音>`，详见 [CONTRIBUTING.md](CONTRIBUTING.md)。

### ③ 先去 `接力记录.md` 占位

在对应作业的 `接力记录.md` 里加一行，写「我接手哪部分」，**避免两个人做同一块**：

```markdown
| 2026-11-07 | 张三 | 开始接手：第 3 题推导 + 实验数据 | 进行中 |
```

### ④ 干活、提交

```powershell
git add -A
git commit -m "feat(w03-lab02): 完成第 3 题推导并补充实验数据"
git push -u origin feat/w03-lab02-zhangsan
```

### ⑤ 开 Pull Request

push 之后终端会打印一个链接，或者直接去 GitHub 仓库页面，点 **Compare & pull request**，
模板会自动带出来，填完点 **Create pull request**。

### ⑥ 合并后收尾

PR 被合并（merge）后：

```powershell
git switch main
git pull
git branch -d feat/w03-lab02-zhangsan   # 删除本地分支
```

---

## 四、三条铁律

| # | 规则 | 为什么 |
|---|------|--------|
| 1 | **不在 `main` 上直接改**，一律走分支 + PR | 别人随时能在 main 上拿到可用版本，出错也好回滚 |
| 2 | **动手前 `git pull`，并先在 `接力记录.md` 占位** | 这是「接力」不撞车的核心：声明在先 |
| 3 | **一个 PR 只做一件事，小步提交** | 一次改 3000 行没人敢 review，出了问题也定位不到 |

---

## 五、Word / PPT / Excel（二进制文件）特别规则

`docx`、`pptx`、`xlsx`、`pdf` 这类文件 git **无法自动合并**——两个人同时改同一份，
合并时只能整份二选一，其中一人的工作会丢。所以：

1. **同一份二进制文件，同一时间只由一个人修改**，改之前在 `接力记录.md` 写明；
2. 交接时在 PR 描述里说清楚**「我改了哪几页 / 哪几节」**，让对方不用去 diff；
3. 多人并行时，**优先写 markdown**，最后统一由一个人导出成 docx/pdf；
4. 提交前**关掉 Word/Excel**，否则会把 `~$xxx.docx` 锁文件一起传上来
   （`.gitignore` 已经挡掉了，但养成习惯更好）。

> 超过 50 MB 的文件（视频、数据集、压缩包）不要直接提交，用 GitHub Release
> 或者网盘，然后在作业 README 里放链接。

---

## 六、常用命令小抄

| 我想… | 命令 |
|-------|------|
| 看当前改了什么 | `git status` |
| 看具体改了哪几行 | `git diff` |
| 拉取别人的最新改动 | `git pull` |
| 看最近谁提交了什么 | `git log --oneline --graph -15` |
| 提交后忘了加文件 | `git add 漏掉的文件` → `git commit --amend --no-edit` |
| 改坏了想丢弃未提交的修改 | `git restore .`（**会丢失改动，慎用**） |
| 提交信息写错了（还没 push） | `git commit --amend` |
| 已经 push 了想撤销 | 别自己硬来，见 [docs/常见问题.md](docs/常见问题.md) |

---

## 七、遇到问题

- **冲突了 / push 被拒 / 传错文件** → [docs/常见问题.md](docs/常见问题.md)
- **想认领一份没人做的作业** → 开一个 Issue，用「认领任务」模板
- **要拉同学进群** → 直接复制 [docs/发给成员的消息.md](docs/发给成员的消息.md)
- **完全不会 git** → 先照着第三节做一遍，出问题再把报错贴出来

---

## 八、仓库管理员（所有者）要做的事

见 [docs/管理员清单.md](docs/管理员清单.md)：创建仓库、邀请成员、开启分支保护、合并 PR。
