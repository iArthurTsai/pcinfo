@echo off
chcp 65001 >nul

REM 輸出檔案在批次檔所在資料夾
set "OUTPUT=%~dp0summary.txt"

echo ==== Directory Tree ==== > "%OUTPUT%"
tree /f >> "%OUTPUT%"

echo. >> "%OUTPUT%"
echo ==== SHA256 File Contents ==== >> "%OUTPUT%"

REM 遞迴尋找所有 wincmd.key.sha256
for /r %%f in (wincmd.key.sha256) do (
    echo --- %%f --- >> "%OUTPUT%"
    type "%%f" >> "%OUTPUT%"
    echo. >> "%OUTPUT%"
)

echo 完成! 已產生 "%OUTPUT%"
pause
