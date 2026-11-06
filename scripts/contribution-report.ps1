<#
.SYNOPSIS
    Generate docs/contribution-summary.md from the git history.

.DESCRIPTION
    Produces per-member commit counts, date ranges, file areas and recent subjects.
    Intended as the raw evidence for Appendix A (Division of Labour) of the final report.

    Read the caveats printed in the output: squash merges attribute a whole PR to the person
    who merged it, and commits are not a measure of contribution. Use this to start a
    conversation, not to settle one.

.PARAMETER OutFile
    Where to write the summary. Default: docs/contribution-summary.md

.PARAMETER Since
    Optional git date filter, e.g. "2026-11-01" or "3.weeks".

.PARAMETER IncludeMerges
    Include merge commits (default: excluded).

.EXAMPLE
    scripts\contribution-report.cmd

.EXAMPLE
    scripts\contribution-report.cmd -Since "2.weeks" -OutFile docs/summary-2w.md
#>
[CmdletBinding()]
param(
    [string]$OutFile,
    [string]$Since,
    [switch]$IncludeMerges
)

$ErrorActionPreference = 'Stop'
$repoRoot = Split-Path -Parent $PSScriptRoot

if (-not $OutFile) { $OutFile = Join-Path $repoRoot 'docs\contribution-summary.md' }
elseif (-not [System.IO.Path]::IsPathRooted($OutFile)) { $OutFile = Join-Path $repoRoot $OutFile }

$sep = [char]31

# ── Read the history ────────────────────────────────────────────────────────────
$gitArgs = @('-C', $repoRoot, 'log', '--all', '--date=short',
             "--pretty=format:@@%H$sep%an$sep%ae$sep%ad$sep%s", '--name-only')
if (-not $IncludeMerges) { $gitArgs = $gitArgs[0..3] + '--no-merges' + $gitArgs[4..($gitArgs.Count - 1)] }
if ($Since) { $gitArgs = $gitArgs[0..3] + "--since=$Since" + $gitArgs[4..($gitArgs.Count - 1)] }

$raw = & git @gitArgs 2>&1
if ($LASTEXITCODE -ne 0) {
    throw "git log failed:`n$($raw -join "`n")"
}

$commits = New-Object System.Collections.ArrayList
$current = $null

foreach ($line in $raw) {
    if ($line -isnot [string]) { continue }
    if ($line.StartsWith('@@')) {
        if ($null -ne $current) { [void]$commits.Add($current) }
        $p = $line.Substring(2).Split($sep)
        $current = [pscustomobject]@{
            Hash    = $p[0]
            Author  = $p[1]
            Email   = $p[2]
            Date    = $p[3]
            Subject = if ($p.Count -ge 5) { $p[4] } else { '' }
            Files   = New-Object System.Collections.ArrayList
        }
    }
    elseif ($line.Trim().Length -gt 0 -and $null -ne $current) {
        [void]$current.Files.Add($line.Trim())
    }
}
if ($null -ne $current) { [void]$commits.Add($current) }

if ($commits.Count -eq 0) {
    Write-Warning 'No commits found in the history.'
    return
}

# ── Aggregate per author ────────────────────────────────────────────────────────
function Get-Area {
    param([string]$Path)
    if ($Path -like '*/*') { return ($Path -split '/')[0] }
    return '(root)'
}

$byAuthor = @{}
foreach ($c in $commits) {
    if (-not $byAuthor.ContainsKey($c.Author)) {
        $byAuthor[$c.Author] = [pscustomobject]@{
            Name     = $c.Author
            Emails   = New-Object System.Collections.Generic.HashSet[string]
            Commits  = 0
            First    = $c.Date
            Last     = $c.Date
            Areas    = @{}
            Recent   = New-Object System.Collections.ArrayList
        }
    }
    $a = $byAuthor[$c.Author]
    [void]$a.Emails.Add($c.Email)
    $a.Commits++
    if ($c.Date -lt $a.First) { $a.First = $c.Date }
    if ($c.Date -gt $a.Last) { $a.Last = $c.Date }

    $seen = New-Object System.Collections.Generic.HashSet[string]
    foreach ($f in $c.Files) {
        $area = Get-Area $f
        if ($seen.Add($area)) {
            if (-not $a.Areas.ContainsKey($area)) { $a.Areas[$area] = 0 }
            $a.Areas[$area]++
        }
    }
    [void]$a.Recent.Add(("{0}  {1}" -f $c.Date, $c.Subject))
}

$authors = @($byAuthor.Values | Sort-Object -Property Commits -Descending)
$total = $commits.Count
$dates = @($commits | ForEach-Object { $_.Date } | Sort-Object)
$head = (& git -C $repoRoot rev-parse --short HEAD 2>&1)
$branch = (& git -C $repoRoot rev-parse --abbrev-ref HEAD 2>&1)
$generated = Get-Date -Format 'yyyy-MM-dd HH:mm'

# ── Build the markdown ──────────────────────────────────────────────────────────
$sb = New-Object System.Text.StringBuilder
function Add-Line { param([string]$Text = '') [void]$sb.AppendLine($Text) }

Add-Line '# Contribution Summary'
Add-Line ''
Add-Line ("Generated **{0}** from `git log --all` at `{1}` (branch `{2}`)." -f $generated, $head, $branch)
Add-Line ''
Add-Line "**Commits analysed:** $total across $($authors.Count) author(s), $($dates[0]) to $($dates[$dates.Count - 1])."
Add-Line ''
Add-Line '> **Read this before quoting any number.** Commit counts are not a measure of contribution.'
Add-Line '> Design, debugging, review, writing and coordination do not appear here, and squash merges'
Add-Line '> attribute an entire pull request to whoever clicked merge. This file is raw evidence for'
Add-Line '> **Appendix A (Division of Labour)**, which should be written in prose and confirmed by every'
Add-Line '> member before submission.'
Add-Line ''
Add-Line '---'
Add-Line ''
Add-Line '## By member'
Add-Line ''
Add-Line '| Member | Commits | Share | First commit | Last commit | Main areas |'
Add-Line '|---|---|---|---|---|---|'

foreach ($a in $authors) {
    $share = if ($total -gt 0) { '{0:P0}' -f ($a.Commits / $total) } else { '—' }
    $areas = ($a.Areas.GetEnumerator() | Sort-Object -Property Value -Descending |
              Select-Object -First 3 | ForEach-Object { $_.Key }) -join ', '
    Add-Line ("| {0} | {1} | {2} | {3} | {4} | {5} |" -f $a.Name, $a.Commits, $share, $a.First, $a.Last, $areas)
}
Add-Line ''
Add-Line '---'
Add-Line ''
Add-Line '## Detail'
Add-Line ''

foreach ($a in $authors) {
    Add-Line ("### {0} — {1} commit(s)" -f $a.Name, $a.Commits)
    Add-Line ''
    Add-Line ("Email(s): {0}" -f (($a.Emails | ForEach-Object { "``$_``" }) -join ', '))
    Add-Line ''
    $areaList = ($a.Areas.GetEnumerator() | Sort-Object -Property Value -Descending |
                 ForEach-Object { "{0} ({1})" -f $_.Key, $_.Value }) -join ' · '
    Add-Line ("Areas touched: {0}" -f $areaList)
    Add-Line ''
    Add-Line 'Most recent work:'
    Add-Line ''
    $recent = @($a.Recent | Select-Object -Last 8)
    [array]::Reverse($recent)
    foreach ($r in $recent) { Add-Line ("- {0}" -f $r) }
    Add-Line ''
}

Add-Line '---'
Add-Line ''
Add-Line '## Coverage by area'
Add-Line ''
Add-Line '| Area | Commits | People |'
Add-Line '|---|---|---|'

$areaTotals = @{}
$areaPeople = @{}
foreach ($c in $commits) {
    $seen = New-Object System.Collections.Generic.HashSet[string]
    foreach ($f in $c.Files) {
        $area = Get-Area $f
        if ($seen.Add($area)) {
            if (-not $areaTotals.ContainsKey($area)) { $areaTotals[$area] = 0; $areaPeople[$area] = New-Object System.Collections.Generic.HashSet[string] }
            $areaTotals[$area]++
            [void]$areaPeople[$area].Add($c.Author)
        }
    }
}
foreach ($k in ($areaTotals.GetEnumerator() | Sort-Object -Property Value -Descending)) {
    Add-Line ("| {0} | {1} | {2} |" -f $k.Key, $k.Value, $areaPeople[$k.Key].Count)
}
Add-Line ''
$merged = New-Object System.Collections.ArrayList
foreach ($c in $commits) {
    if ($c.Files.Count -eq 0) { [void]$merged.Add(("{0} — {1}" -f $c.Author, $c.Subject)) }
}
if ($merged.Count -gt 0) {
    Add-Line '## Commits touching no files'
    Add-Line ''
    Add-Line 'Usually empty commits or merges; useful when reconciling the history by hand.'
    Add-Line ''
    foreach ($m in $merged) { Add-Line ("- {0}" -f $m) }
    Add-Line ''
}
Add-Line '## Next step'
Add-Line ''
Add-Line '1. Open `docs/03-handover-log.md` and check that every row is reflected above.'
Add-Line '2. Write Appendix A of `reports/final-report.md` in prose — workstream, contribution, review.'
Add-Line '3. Send it to all seven members; nobody signs a summary they have not read.'

$utf8 = New-Object System.Text.UTF8Encoding($false)
[System.IO.File]::WriteAllText($OutFile, $sb.ToString(), $utf8)

Write-Host ''
Write-Host "Written: $OutFile" -ForegroundColor Green
Write-Host ("  {0} commits, {1} authors, {2} to {3}" -f $total, $authors.Count, $dates[0], $dates[$dates.Count - 1])
Write-Host ''
Write-Host 'Reminder: commit counts are not a score. See the caveat at the top of the file.' -ForegroundColor Yellow
