@echo off
setlocal EnableDelayedExpansion

REM === CONFIG ===
set "POST_DIR=posts"
set "OUTPUT=posts.json"

REM Initialize
set "first=true"

REM Write opening bracket
> "%OUTPUT%" echo [

REM Process each .md
for %%F in ("%POST_DIR%\*.md") do (
  call :ExtractTitle "%%~fF" title

  set "fname=%%~nxF"
  set "ttl=!title!"

  REM Escape any quotes in title
  set "ttl=!ttl:"=\"!"

  REM comma before all except first
  if "!first!"=="true" (
    set "first=false"
  ) else (
    >>"%OUTPUT%" echo ,
  )

  >>"%OUTPUT%" echo   { "title": "!ttl!", "filename": "!fname!" }
)

>>"%OUTPUT%" echo ]
echo(posts.json updated successfully)
exit /b

:ExtractTitle
  REM %~1 = full path to .md
  REM %~2 = output variable name

  setlocal EnableDelayedExpansion
  set "file=%~1"
  set "line="

  REM read only the first line
  for /f "usebackq delims=" %%L in ("%file%") do (
    set "line=%%L"
    goto :gotLine
  )
  :gotLine

  REM strip all leading '#' chars
  :stripHashes
  if "!line:~0,1!"=="#" (
    set "line=!line:~1!"
    goto :stripHashes
  )

  REM trim leading spaces
  for /f "tokens=* delims= " %%A in ("!line!") do set "line=%%A"

  endlocal & set "%~2=%line%"
  exit /b