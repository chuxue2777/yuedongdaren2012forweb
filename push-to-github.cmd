@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion
cd /d "%~dp0"

rem ============================================================
rem  Push this folder to GitHub, then tell you the Pages URL.
rem  Everything here is ASCII on purpose: a Chinese codepage
rem  mangles non-ASCII lines and the parser dies on them.
rem ============================================================

rem ---------- 0. locate git -------------------------------------------
rem `where git` alone is not enough: plenty of machines have git only
rem inside GitHub Desktop or inside a portable bundle, never on PATH.
rem That is exactly what happened here, so search the known spots too.
set "GITBIN="
for /f "delims=" %%i in ('where git 2^>nul') do if not defined GITBIN set "GITBIN=%%i"

rem pre-assign these: %ProgramFiles(x86)% inside an if-block breaks the parser
set "PF=%ProgramFiles%"
set "PF86=%ProgramFiles(x86)%"
set "LAD=%LOCALAPPDATA%"

if not defined GITBIN if exist "%PF%\Git\cmd\git.exe"   set "GITBIN=%PF%\Git\cmd\git.exe"
if not defined GITBIN if exist "%PF86%\Git\cmd\git.exe" set "GITBIN=%PF86%\Git\cmd\git.exe"
if not defined GITBIN if exist "%LAD%\Programs\Git\cmd\git.exe" set "GITBIN=%LAD%\Programs\Git\cmd\git.exe"

rem portable bundles: these DO carry a full Git Credential Manager, so the
rem browser sign-in popup works. prefer them over the GitHub Desktop copy.
if not defined GITBIN (
  for /d %%d in ("%USERPROFILE%\.workbuddy\binaries\PortableGit\versions\*") do (
    if not defined GITBIN if exist "%%~fd\cmd\git.exe" set "GITBIN=%%~fd\cmd\git.exe"
  )
)
if not defined GITBIN (
  for /d %%d in ("%USERPROFILE%\.workbuddy\binaries\git\versions\*") do (
    if not defined GITBIN if exist "%%~fd\cmd\git.exe" set "GITBIN=%%~fd\cmd\git.exe"
  )
)

rem GitHub Desktop bundles git as well, but with no credential helper, so
rem it can only take username + token typed into this window. last resort.
if not defined GITBIN (
  for /d %%d in ("%LAD%\GitHubDesktop\app-*") do (
    if not defined GITBIN if exist "%%~fd\resources\app\git\cmd\git.exe" set "GITBIN=%%~fd\resources\app\git\cmd\git.exe"
  )
)

if not defined GITBIN (
  echo [X] No git found on this computer.
  echo.
  echo     Two ways out:
  echo       1. install "Git for Windows" from https://git-scm.com/download/win
  echo          then close this window and run me again
  echo       2. use GitHub Desktop instead - it does everything with clicks:
  echo          File -^> Add local repository -^> pick this folder
  echo          then click "Publish branch" / "Push origin"
  echo.
  pause
  exit /b 1
)

rem put the folder holding git.exe in front of PATH so a later `git` call
rem picks the same one. cmd\git.exe is a wrapper that sets up its own exec
rem path, which is how it still finds git-credential-manager.exe.
for %%g in ("!GITBIN!") do set "GITDIR=%%~dpg"
set "PATH=!GITDIR!;!PATH!"

for /f "delims=" %%v in ('git --version 2^>nul') do echo    %%~v at !GITBIN!

rem ---------- 1. network route -----------------------------------------
rem Remember any proxy this shell inherited, then get it out of the way:
rem a stale or half-working proxy makes git die with
rem "CONNECT tunnel failed, response 502". If the direct route turns out
rem to be the blocked one, we switch back to the saved proxy further down.
set "SAVED_PROXY="
if defined http_proxy  set "SAVED_PROXY=!http_proxy!"
if not defined SAVED_PROXY if defined HTTP_PROXY  set "SAVED_PROXY=!HTTP_PROXY!"
if not defined SAVED_PROXY if defined https_proxy set "SAVED_PROXY=!https_proxy!"
if not defined SAVED_PROXY if defined HTTPS_PROXY set "SAVED_PROXY=!HTTPS_PROXY!"
set "http_proxy="
set "https_proxy="
set "HTTP_PROXY="
set "HTTPS_PROXY="
set "ALL_PROXY="
set "all_proxy="

set "NETOPT="
set "LOWOPT=-c http.lowSpeedLimit=1000 -c http.lowSpeedTime=20"
set "LSF=%TEMP%\lddr_ls.txt"

echo ============================================================
echo   Push this folder to GitHub
echo ============================================================
echo.
echo  Step 1: create an EMPTY repo at  https://github.com/new
echo          - Public
echo          - do NOT tick "Add a README" / .gitignore / license
echo.
echo  Step 2: paste the repo URL below, for example
echo          https://github.com/yourname/lddr2013.git
echo.
set "CUR="
for /f "delims=" %%i in ('git remote get-url origin 2^>nul') do set "CUR=%%i"
if defined CUR (
  echo    remote is already configured:
  echo      !CUR!
  echo    press Enter to use it, or paste a different URL.
  echo.
)
set "REPO="
set /p REPO=Repo URL: 
if not defined REPO if defined CUR set "REPO=!CUR!"
if "!REPO!"=="" (
  echo.
  echo [X] No URL given, aborted.
  pause
  exit /b 1
)

echo.
echo -- preparing local repo ...
git config core.autocrlf false
git config core.safecrlf false
if not exist ".git" (
  git init -q -b main
  git add -A
  git commit -q -m "lddr 2013 web"
  echo    created new repo and committed files
) else (
  echo    existing repo found
  rem commit local edits first, otherwise a rebase later fails on a dirty tree
  git add -A >nul 2>&1
  git commit -q -m "update" >nul 2>&1
)

echo.
echo -- setting remote ...
git remote remove origin 2>nul
git remote add origin "!REPO!"

rem ---------- 2. which route actually works? ---------------------------
echo.
echo -- probing the remote ...
set "REACH="
set "HAS_MAIN="
git !LOWOPT! ls-remote --heads origin >"!LSF!" 2>nul
if errorlevel 1 (
  if defined SAVED_PROXY (
    echo    direct connection failed, retrying through proxy !SAVED_PROXY!
    set "NETOPT=-c http.proxy=!SAVED_PROXY!"
    git !LOWOPT! !NETOPT! ls-remote --heads origin >"!LSF!" 2>nul
  )
)
if not errorlevel 1 (
  set "REACH=1"
  findstr /c:"refs/heads/main" "!LSF!" >nul 2>&1 && set "HAS_MAIN=1"
)
del "!LSF!" >nul 2>&1

if not defined REACH (
  echo    WARNING: could not reach github.com on the first try.
  echo             Carrying on with the push anyway - if it fails, the real
  echo             reason is printed below. github.com is often blocked or
  echo             very slow in mainland China; in that case turn on a VPN
  echo             or proxy and run me again.
  echo.
)

if defined HAS_MAIN (
  echo    remote already has a main branch, rebasing onto it first
  git !LOWOPT! !NETOPT! pull --rebase origin main --allow-unrelated-histories
  if errorlevel 1 (
    echo.
    echo [X] Could not rebase onto the remote branch.
    echo     your files are all still here locally. run:  git rebase --abort
    echo     then push again, or send me the message above.
    pause
    exit /b 1
  )
) else (
  echo    remote is empty - pushing straight in
)

rem ---------- 3. push ---------------------------------------------------
echo.
echo -- pushing ...
echo    if a browser window pops up, sign in to GitHub and click Authorize.
echo    if this black window asks for "Username" and "Password" instead,
echo    type your GitHub username, and paste a Personal Access Token as the
echo    password. Create one at:
echo      https://github.com/settings/tokens  -^>  Generate new token
echo      tick the "repo" scope, copy the ghp_... string, paste it as password
echo.
git !LOWOPT! !NETOPT! push -u origin main
if errorlevel 1 (
  if defined SAVED_PROXY if not defined NETOPT (
    echo.
    echo -- push failed, one more try through proxy !SAVED_PROXY! ...
    set "NETOPT=-c http.proxy=!SAVED_PROXY!"
    git !LOWOPT! !NETOPT! push -u origin main
  )
)
if errorlevel 1 (
  echo.
  echo [X] Push FAILED.
  echo     read the red lines above - they say which of these it is:
  echo       * Authentication failed   -^> sign in again / new token
  echo       * Repository not found    -^> wrong URL, or you do not own it
  echo       * Connection timed out    -^> VPN needed, see the note above
  echo       * RPC failed / 408        -^> just run me again, git resumes
  echo.
  echo     The URL I used was: !REPO!
  echo.
  pause
  exit /b 1
)

rem ---------- 4. done, work out the Pages URL --------------------------
set "SLUG=!REPO!"
set "SLUG=!SLUG:https://github.com/=!"
set "SLUG=!SLUG:http://github.com/=!"
set "SLUG=!SLUG:git@github.com:=!"
set "SLUG=!SLUG:.git=!"
if "!SLUG:~-1!"=="/" set "SLUG=!SLUG:~0,-1!"
set "GHUSER="
set "GHREPO="
for /f "tokens=1,2 delims=/" %%a in ("!SLUG!") do (
  set "GHUSER=%%a"
  set "GHREPO=%%b"
)

echo.
echo ============================================================
echo   Done - the files are on GitHub.
echo.
echo   Last step, turn on Pages:
echo     Settings -^> Pages
echo     Source : Deploy from a branch
echo     Branch : main   /   (root)
echo     click Save
echo.
if defined GHUSER if defined GHREPO (
  echo   Repo : https://github.com/!GHUSER!/!GHREPO!
  echo   Site : https://!GHUSER!.github.io/!GHREPO!/
  echo          live about 1-2 minutes after you click Save
) else (
  echo   Site : https://YOURNAME.github.io/REPONAME/
)
echo ============================================================
pause
