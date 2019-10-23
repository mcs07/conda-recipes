
scons install -j %CPU_COUNT% PREFIX=%LIBRARY_PREFIX%
if errorlevel 1 exit 1
