@echo off
chcp 65001 >nul

set PUBLISHED=D:\me\SecBrain\06-Output (对外输出)\Published (已发布)
set POSTS=D:\me\blog\docs\posts

rd /S /Q "%POSTS%" 2>nul
mkdir "%POSTS%"

xcopy /Y "%PUBLISHED%\*.md" "%POSTS%\" >nul 2>&1

for %%C in (ai-security red-team traditional-security) do (
    if exist "%PUBLISHED%\%%C" (
        mkdir "%POSTS%\%%C" 2>nul
        xcopy /Y /E "%PUBLISHED%\%%C\*.md" "%POSTS%\%%C\" >nul 2>&1
    )
)

echo Done!
pause
