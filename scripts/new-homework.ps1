<#
.SYNOPSIS
    在作业共享仓库（7220_Group12）里新建一份作业的骨架：weekNN/<作业编号>/README.md + 接力记录.md

.DESCRIPTION
    会根据「周次」自动补零（3 → week03），拒绝覆盖已存在的目录。
    生成后请立刻 commit 并 push 到自己的分支，让大家都知道这份作业已经开了。

.PARAMETER Week
    第几周，整数。

.PARAMETER Id
    作业编号，建议 lab01 / hw02 / proj 这种，不要有空格和中文。

.PARAMETER Title
    作业标题。

.PARAMETER Due
    截止时间，随便写，例如 "11-13 23:59"。

.PARAMETER Owners
    负责同学，多人用顿号或逗号分隔。

.EXAMPLE
    pwsh ./scripts/new-homework.ps1 -Week 3 -Id lab02 -Title "线性回归与梯度下降" -Due "11-13 23:59" -Owners "张三、李四"

.EXAMPLE
    pwsh ./scripts/new-homework.ps1 -Week 4 -Id hw04
#>
[CmdletBinding()]
param(
    [Parameter(Mandatory = $true, HelpMessage = '第几周，例如 3')]
    [int]$Week,

    [Parameter(Mandatory = $true, HelpMessage = '作业编号，例如 lab02')]
    [string]$Id,

    [string]$Title = '',
    [string]$Due = '',
    [string]$Owners = ''
)

$ErrorActionPreference = 'Stop'

# ── 参数校验 ──
if ($Week -lt 1 -or $Week -gt 52) {
    throw "Week 必须在 1..52 之间，收到：$Week"
}
if ($Id -match '[\\/:*?"<>|\s]') {
    throw "Id 不能包含空格或特殊字符 \\ / : * ? `" < > |，收到：$Id"
}
if ($Id -match '[^\x00-\x7F]') {
    throw "Id 请用英文（例如 lab02），避免不同系统下路径问题，收到：$Id"
}

$repoRoot = Split-Path -Parent $PSScriptRoot
$weekName = 'week{0:D2}' -f $Week
$weekDir  = Join-Path $repoRoot $weekName
$target   = Join-Path $weekDir $Id

if (Test-Path $target) {
    throw "目录已存在，未做任何修改：$target`n（如果只是想补 README，直接手工建文件即可）"
}

if ([string]::IsNullOrWhiteSpace($Title)) { $Title = $Id }
if ([string]::IsNullOrWhiteSpace($Due))   { $Due   = '（待填）' }
if ([string]::IsNullOrWhiteSpace($Owners)) { $Owners = '（待认领）' }

$today   = Get-Date -Format 'yyyy-MM-dd'
$weekTag = 'w{0:D2}' -f $Week

# 写 UTF-8 无 BOM 文件（Windows PowerShell 的 Set-Content -Encoding utf8 会加 BOM，
# 某些渲染器会把 BOM 显示成乱码，所以这里手工写）
function Write-Utf8NoBom {
    param([string]$Path, [string]$Text)
    $utf8 = New-Object System.Text.UTF8Encoding($false)
    [System.IO.File]::WriteAllText($Path, $Text, $utf8)
}

New-Item -ItemType Directory -Path $target -Force | Out-Null

# ── README.md ──
$readmeTemplate = @'
# {0} / {1} —— {2}

## 基本信息

| 项目 | 内容 |
|------|------|
| 课程 | （待填） |
| 布置日期 | {3} |
| 截止时间 | {4} |
| 负责同学 | {5} |
| 当前状态 | ⚪ 未开始 |

## 题目与要求

1. **第 1 题**：……
2. **第 2 题**：……
3. **第 3 题**：……

## 验收标准

- [ ] ……
- [ ] ……

## 文件说明

| 文件 | 说明 |
|------|------|
| `接力记录.md` | 谁做了什么，接手前必看 |
| `src/` | 代码 |
| `assets/` | 图、数据 |

## 进度速览

见 [接力记录.md](接力记录.md)。**接手前请先看最后一行。**
'@

$readmePath = Join-Path $target 'README.md'
Write-Utf8NoBom -Path $readmePath -Text ($readmeTemplate -f $weekName, $Id, $Title, $today, $Due, $Owners)

# ── 接力记录.md ──
$logTemplate = @'
# 接力记录 —— {0} / {1}

> **接手前必读最后一行。** 动手前先在这里加一行「进行中」，写完再更新状态。
> 状态只用：`未开始` / `进行中` / `待接手` / `待评审` / `已完成`

| 日期 | 谁 | 做了什么 / 下一步 | 状态 | PR |
|------|-----|------------------|------|-----|
| — | — | 还没有人开始 | 未开始 | — |

<!--
新的一行追加在最下面。模板：

| 2026-11-08 | 王五 | 做了什么；下一步谁接、还差什么 | 进行中 | — |
-->
'@

$logPath = Join-Path $target '接力记录.md'
Write-Utf8NoBom -Path $logPath -Text ($logTemplate -f $weekName, $Id)

# ── 结果 ──
Write-Host ''
Write-Host "已创建：$target" -ForegroundColor Green
Write-Host "  - README.md"
Write-Host "  - 接力记录.md"
Write-Host ''
Write-Host '接下来（记得先开自己的分支，别在 main 上改）：' -ForegroundColor Yellow
Write-Host "  git switch main; git pull"
Write-Host "  git switch -c feat/$weekTag-$Id-<你的名字拼音>"
Write-Host "  # 编辑 $weekName/$Id/README.md 填题目"
Write-Host "  git add -A"
Write-Host "  git commit -m ""feat($weekTag-$Id): 新建作业骨架"""
Write-Host "  git push -u origin feat/$weekTag-$Id-<你的名字拼音>"
