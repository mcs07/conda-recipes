if "%ARCH%"=="32" (
   set PLATFORM=Win32
) else (
  set PLATFORM=x64
)

rem Build libinchi
cd %SRC_DIR%\INCHI_API\libinchi\vc9
if "%VS_YEAR%" == "2008" (
  vcbuild libinchi.vcproj Release /platform=%PLATFORM%
) else (
  devenv /Upgrade libinchi.vcproj
  msbuild libinchi.vcxproj /p:Configuration=Release /p:Platform=%PLATFORM%
)
mkdir %LIBRARY_INC%\inchi\
copy %SRC_DIR%\INCHI_API\libinchi\src\*.h %LIBRARY_INC%\inchi\*
copy %SRC_DIR%\INCHI_API\bin\Windows\%PLATFORM%\Release\libinchi.dll %LIBRARY_BIN%\libinchi.dll
copy %SRC_DIR%\INCHI_API\bin\Windows\%PLATFORM%\Release\libinchi.lib %LIBRARY_LIB%\libinchi.lib
copy %SRC_DIR%\INCHI_API\bin\Windows\%PLATFORM%\Release\libinchi.exp %LIBRARY_LIB%\libinchi.exp
if errorlevel 1 exit 1

rem Build inchi-1 executable
cd %SRC_DIR%\INCHI_EXE\inchi-1\vc9
if "%VS_YEAR%" == "2008" (
  vcbuild inchi-1.vcproj Release /platform=%PLATFORM%
) else (
  devenv /Upgrade inchi-1.vcproj
  msbuild inchi-1.vcxproj /p:Configuration=Release /p:Platform=%PLATFORM%
)
copy %SRC_DIR%\INCHI_EXE\bin\Windows\%PLATFORM%\Release\inchi-1.exe %SCRIPTS%\inchi-1.exe
if errorlevel 1 exit 1
