#!/bin/bash
# sync-obsidian.sh — 从 Obsidian Published 文件夹同步文章到博客
# 用法: bash sync-obsidian.sh
# 放在 blog 根目录，每次写完新文章跑一次即可

OBSIDIAN_PUBLISHED="D:/me/SecBrain/06-Output (对外输出)/Published (已发布)"
BLOG_DOCS="D:/me/blog/docs"

echo "📋 同步 Obsidian Published → 博客 docs/"

# 同步所有 .md 文件（排除 index.md/about.md 等博客固定页面）
rsync -av --delete \
  --exclude 'index.md' \
  --exclude 'about.md' \
  --exclude '.obsidian' \
  --exclude 'README.md' \
  "$OBSIDIAN_PUBLISHED/" "$BLOG_DOCS/posts/"

echo "✅ 同步完成"
echo "💡 记得 git add . && git commit && git push 来发布"
