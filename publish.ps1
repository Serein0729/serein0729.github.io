# publish.ps1 - V3ry0 博客一键发布
$ErrorActionPreference = "Stop"

$published = "D:\me\SecBrain\06-Output (对外输出)\Published (已发布)"
$posts     = "D:\me\blog\docs\posts"
$aboutSrc  = Join-Path $published "about.md"
$aboutDst  = "D:\me\blog\docs\about.md"

Write-Host "[1/3] Sync from Obsidian..." -ForegroundColor Cyan

# 同步 about.md（关于页面）
if (Test-Path $aboutSrc) {
    Copy-Item -Path $aboutSrc -Destination $aboutDst -Force
    Write-Host "  + about.md (about page)" -ForegroundColor Green
}

# 清空旧 posts 内容
if (Test-Path $posts) { Remove-Item -Recurse -Force $posts }
New-Item -ItemType Directory -Path $posts | Out-Null

# 复制根目录 .md 文件（排除 about.md，它已经单独处理了）
Get-ChildItem -Path $published -Filter "*.md" -File | Where-Object { $_.Name -ne "about.md" } | ForEach-Object {
    Copy-Item $_.FullName -Destination $posts
    Write-Host "  + $($_.Name)" -ForegroundColor Green
}

# 复制分类文件夹并生成索引页
$categories = @{
    "ai-security" = @{ title = "AI 安全"; emoji = "🤖" }
    "red-team" = @{ title = "红队"; emoji = "⚔️" }
    "traditional-security" = @{ title = "传统安全"; emoji = "🛡️" }
}

foreach ($cat in $categories.Keys) {
    $src = Join-Path $published $cat
    $dst = Join-Path $posts $cat
    if (Test-Path $src) {
        New-Item -ItemType Directory -Path $dst | Out-Null

        $postLinks = @()
        Get-ChildItem -Path $src -Filter "*.md" -File | ForEach-Object {
            Copy-Item $_.FullName -Destination $dst
            Write-Host "  + $cat/$($_.Name)" -ForegroundColor Green

            $content = Get-Content $_.FullName -Raw -Encoding UTF8
            $title = $_.BaseName
            if ($content -match '(?m)^title:\s*(.+)$') {
                $title = $Matches[1].Trim('"').Trim("'")
            }

            $fileName = $_.Name
            $postLinks += "- [$title](./$fileName)"
        }

        $catInfo = $categories[$cat]
        $indexContent = @"
---
title: $($catInfo.title)
---

# $($catInfo.emoji) $($catInfo.title)

$($postLinks -join "`n")
"@
        $indexPath = Join-Path $dst "index.md"
        Set-Content -Path $indexPath -Value $indexContent -Encoding UTF8
        Write-Host "  + $cat/index.md (auto-generated)" -ForegroundColor Yellow
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
