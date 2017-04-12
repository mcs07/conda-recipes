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

MOVE bin\tesseract.exe %SCRIPTS%\
MOVE *.dll %LIBRARY_BIN%\
MOVE *.lib %LIBRARY_LIB%\
if errorlevel 1 exit 1
