mkdir build
cd build
cmake .. -G "%CMAKE_GENERATOR%" -DBUILD_PROG=1 -DCMAKE_INSTALL_PREFIX="%PREFIX%"
if errorlevel 1 exit 1

cmake --build  . --config Release
if errorlevel 1 exit 1
