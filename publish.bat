@echo off
chcp 65001 >nul
echo ========================================
echo   V3ry0 博客一键发布工具
echo ========================================
echo.

echo [1/3] 同步 Obsidian 文章...
set PUBLISHED=D:\me\SecBrain\06-Output (对外输出)\Published (已发布)
set POSTS=D:\me\blog\docs\posts
if not exist "%POSTS%" mkdir "%POSTS%"

:: 清空旧的 posts 内容（保留目录结构）
del /Q "%POSTS%\*.md" 2>nul

:: 复制新内容
xcopy /Y "%PUBLISHED%\*.md" "%POSTS%\" >nul 2>&1
echo       同步完成！

echo.
set /p MSG="[2/3] 输入本次更新说明（如：新增AI安全文章）："
if "%MSG%"=="" set MSG=update blog

echo.
echo [3/3] 推送到 GitHub...
cd /d D:\me\blog
git add .
git commit -m "%MSG%"
git push

echo.
echo ========================================
echo   ✅ 发布完成！约2分钟后访问：
echo   https://serein0729.github.io
echo ========================================
pause
