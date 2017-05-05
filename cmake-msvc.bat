@echo OFF

mkdir cmake
cd cmake
mkdir build
cd build
cmake -G "Visual Studio 12 2013 Win64" -DCMAKE_INSTALL_PREFIX="../install" ..\..\
cmake --build . --target INSTALL --config Release
cmake --build . --target INSTALL --config Debug

echo. 
echo ************************************************* 
echo Lua generated in:
echo -- cmake
echo       ^|
echo        -- build
echo        -- install
echo                ^|
echo                 -- bin
echo                 -- include
echo                 -- lib
echo ************************************************* 
echo. 

cd ..\..