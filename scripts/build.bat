@echo off
call "C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvars64.bat" >nul 2>&1

if not exist build mkdir build

echo Compiling basic_retry...
cl.exe /std:c++17 /W4 /WX /EHsc /O2 /I include ^
    examples\basic_retry.cpp ^
    /Fe:build\basic_retry.exe ^
    /nologo
if %ERRORLEVEL% neq 0 (
    echo ERROR: basic_retry failed to compile
    exit /b 1
)

echo Compiling circuit_breaker...
cl.exe /std:c++17 /W4 /WX /EHsc /O2 /I include ^
    examples\circuit_breaker.cpp ^
    /Fe:build\circuit_breaker.exe ^
    /nologo
if %ERRORLEVEL% neq 0 (
    echo ERROR: circuit_breaker failed to compile
    exit /b 1
)

echo.
echo Build successful. Running examples...
echo.
echo --- basic_retry ---
build\basic_retry.exe
echo.
echo --- circuit_breaker ---
build\circuit_breaker.exe
