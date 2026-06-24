@echo off
REM sync-obsidian.bat — Windows 版同步脚本
REM 双击运行即可

set OBSIDIAN_PUBLISHED=D:\me\SecBrain\06-Output (对外输出)\Published (已发布)
set BLOG_DOCS=D:\me\blog\docs\posts

echo 同步 Obsidian Published 到博客...
if not exist "%BLOG_DOCS%" mkdir "%BLOG_DOCS%"

xcopy /E /Y /I "%OBSIDIAN_PUBLISHED%\*.md" "%BLOG_DOCS%\"

echo 同步完成！
echo 记得 git add . ^&^& git commit ^&^& git push 来发布
pause
