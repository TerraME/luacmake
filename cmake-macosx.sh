mkdir "cmake"
cd "cmake"
mkdir "build"
cd "build"
cmake -G "Xcode" -DCMAKE_INSTALL_PREFIX="../install" ../../
cmake --build . --target install --config Release

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