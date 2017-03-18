mkdir build
cd build
cmake -G "%CMAKE_GENERATOR%" ^
      -D BUILD_PROG=1 ^
      -D CMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
      -D JPEG_LIBRARY=%LIBRARY_LIB%\jpeg.lib ^
      -D JPEG_INCLUDE_DIR=%LIBRARY_INC% ^
      -D TIFF_LIBRARY=%LIBRARY_LIB%\libtiff.lib ^
      -D TIFF_INCLUDE_DIR=%LIBRARY_INC% ^
      -D PNG_LIBRARY=%LIBRARY_LIB%\libpng.lib ^
      -D PNG_PNG_INCLUDE_DIR=%LIBRARY_INC% ^
      -D ZLIB_LIBRARY=%LIBRARY_LIB%\zlib.lib ^
      -D ZLIB_INCLUDE_DIR=%LIBRARY_INC% ^
      ..
if errorlevel 1 exit 1

cmake --build  . --config Release
if errorlevel 1 exit 1
