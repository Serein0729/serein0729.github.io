@echo off
chcp 65001 >nul

set "PUBLISHED=D:\me\SecBrain\06-Output (对外输出)\Published (已发布)"
set "POSTS=D:\me\blog\docs\posts"

echo [1/3] Sync from Obsidian...

if exist "%POSTS%" rd /S /Q "%POSTS%"
mkdir "%POSTS%"

xcopy /Y "%PUBLISHED%\*.md" "%POSTS%\" >nul 2>&1

for %%C in (ai-security red-team traditional-security) do (
    if exist "%PUBLISHED%\%%C" (
        mkdir "%POSTS%\%%C" 2>nul
        xcopy /Y /E "%PUBLISHED%\%%C\*.md" "%POSTS%\%%C\" >nul 2>&1
    )
)

echo       Sync done!

echo.
set /p "MSG=[2/3] Commit message: "
if "%MSG%"=="" set "MSG=update blog"

echo.
echo [3/3] Push to GitHub...
cd /d "D:\me\blog"
git add .
git commit -m "%MSG%"
git push

echo.
echo Done! Visit: https://serein0729.github.io
pause
