cmake -G "NMake Makefiles" ^
      -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
      -DCMAKE_PREFIX_PATH="%LIBRARY_PREFIX%" ^
      -DCMAKE_BUILD_TYPE=Release ^
      -DWITH_INCHI=ON ^
      -DOPENBABEL_USE_SYSTEM_INCHI=ON ^
      -DRUN_SWIG=ON ^
      -DPYTHON_BINDINGS=ON ^
      -DPYTHON_EXECUTABLE=%PYTHON% ^
      .
if errorlevel 1 exit 1

cmake --build . --target install --config Release
if errorlevel 1 exit 1

echo d|xcopy %LIBRARY_PREFIX%\bin\data %PREFIX%\share\openbabel /e /c
rmdir /s /q %LIBRARY_PREFIX%\bin\data

xcopy %LIBRARY_PREFIX%\Lib\site-packages %PREFIX%\Lib /e /c
rmdir /s /q %LIBRARY_PREFIX%\Lib\site-packages
