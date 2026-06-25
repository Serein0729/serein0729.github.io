# publish.ps1 - V3ry0 博客一键发布
$ErrorActionPreference = "Stop"

$published = "D:\me\SecBrain\06-Output (对外输出)\Published (已发布)"
$posts     = "D:\me\blog\docs\posts"

Write-Host "[1/3] Sync from Obsidian..." -ForegroundColor Cyan

# 清空旧内容
if (Test-Path $posts) { Remove-Item -Recurse -Force $posts }
New-Item -ItemType Directory -Path $posts | Out-Null

# 复制根目录 .md 文件
Get-ChildItem -Path $published -Filter "*.md" -File | ForEach-Object {
    Copy-Item $_.FullName -Destination $posts
    Write-Host "  + $($_.Name)" -ForegroundColor Green
}

# 复制分类文件夹
$categories = @("ai-security", "red-team", "traditional-security")
foreach ($cat in $categories) {
    $src = Join-Path $published $cat
    $dst = Join-Path $posts $cat
    if (Test-Path $src) {
        New-Item -ItemType Directory -Path $dst | Out-Null
        Get-ChildItem -Path $src -Filter "*.md" -Recurse | ForEach-Object {
            Copy-Item $_.FullName -Destination $dst
            Write-Host "  + $cat/$($_.Name)" -ForegroundColor Green
        }
    }
}

Write-Host "  Sync done!" -ForegroundColor Green

# 输入 commit message
Write-Host ""
$msg = Read-Host "[2/3] Commit message"
if (-not $msg) { $msg = "update blog" }

# 推送
Write-Host ""
Write-Host "[3/3] Push to GitHub..." -ForegroundColor Cyan
Set-Location "D:\me\blog"
git add .
git commit -m $msg
git push

Write-Host ""
Write-Host "Done! Visit: https://serein0729.github.io" -ForegroundColor Green
