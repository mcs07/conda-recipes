mkdir build
cd build

cmake -G "%CMAKE_GENERATOR%" ^
      -D BUILD_PROG=1 ^
      -D CMAKE_PREFIX_PATH=%LIBRARY_PREFIX% ^
      -D CMAKE_INCLUDE_PATH=%LIBRARY_INC% ^
      -D CMAKE_LIBRARY_PATH=%LIBRARY_LIB% ^
      -D CMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
      ..
if errorlevel 1 exit 1

cmake --build . --config Release
if errorlevel 1 exit 1

mkdir %LIBRARY_INC%\leptonica
MOVE ..\src\*.h %LIBRARY_INC%\leptonica\
MOVE src\*.h %LIBRARY_INC%\leptonica\
MOVE bin\Release\*.exe %SCRIPTS%\
MOVE bin\Release\*.dll %LIBRARY_BIN%\leptonica.dll
MOVE src\Release\*.lib %LIBRARY_LIB%\leptonica.lib
mkdir %LIBRARY_LIB%\cmake\Leptonica
MOVE LeptonicaConfig.cmake %LIBRARY_LIB%\cmake\Leptonica\
MOVE LeptonicaConfig-version.cmake %LIBRARY_LIB%\cmake\Leptonica\
if errorlevel 1 exit 1
