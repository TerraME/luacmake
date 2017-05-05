mkdir "cmake"
cd "cmake"
mkdir "build"
cd "build"
cmake -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX="../install" ../../
make -j 4
make install

echo 
echo "*************************************************" 
echo "Lua generated in:"
echo "-- cmake"
echo "      |"
echo "      -- build"
echo "      -- install"
echo "              |"
echo "              -- bin"
echo "              -- include"
echo "              -- lib"
echo "*************************************************" 
echo 

cd ../..
