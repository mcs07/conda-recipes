mkdir build
cd build

cmake -G "%CMAKE_GENERATOR%" ^
      -D CMAKE_BUILD_TYPE=Release ^
      -D CMAKE_PREFIX_PATH=%LIBRARY_PREFIX% ^
      -D CMAKE_INCLUDE_PATH=%LIBRARY_INC% ^
      -D CMAKE_LIBRARY_PATH=%LIBRARY_LIB% ^
      -D CMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
      ..
if errorlevel 1 exit 1

cmake --build . --config Release
if errorlevel 1 exit 1

cmake --build . --config Release --target install 
if errorlevel 1 exit 1

:: Make copies of the .lib file without the embedded version number
copy %LIBRARY_LIB%\tesseract305.lib %LIBRARY_LIB%\tesseract.lib

:: Download tessdata to bin directory so tesseract executable works
mkdir %LIBRARY_BIN%\tessdata
cd %LIBRARY_BIN%\tessdata
curl -L -O "https://github.com/tesseract-ocr/tessdata/raw/3.04.00/eng.traineddata"
curl -L -O "https://github.com/tesseract-ocr/tessdata/raw/3.04.00/osd.traineddata"

:: Copy tessdata to build prefix so tesseract API works
mkdir %PREFIX%\tessdata
copy %LIBRARY_BIN%\tessdata\*.traineddata %PREFIX%\tessdata\
