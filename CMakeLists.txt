project(lua C)

cmake_minimum_required(VERSION 2.8.9)

if(WIN32)
  add_definitions(-DLUA_BUILD_AS_DLL)
  add_definitions(-DLUA_COMPAT_BITLIB)
  add_definitions(-DLUA_COMPAT_APIINTCASTS)
  if(MSVC)
    set(CMAKE_DEBUG_POSTFIX "d")
    add_definitions(/MP)
  endif()  
elseif(APPLE)
  add_definitions(-DLUA_USE_MACOSX)
else()
  add_definitions(-DLUA_USE_UNIX -DLUA_USE_DLOPEN)
endif()

include_directories(src ${CMAKE_CURRENT_BINARY_DIR})

set(SRC_LIB src/lapi.c src/lcode.c src/lctype.c src/ldebug.c src/ldo.c src/ldump.c src/lfunc.c 
  src/lgc.c src/llex.c src/lmem.c src/lobject.c src/lopcodes.c src/lparser.c src/lstate.c 
  src/lstring.c src/ltable.c src/ltm.c src/lundump.c src/lvm.c src/lzio.c src/lauxlib.c 
  src/lbaselib.c src/ldblib.c src/liolib.c src/lmathlib.c src/loslib.c src/ltablib.c 
  src/lstrlib.c src/linit.c src/lcorolib.c src/lutf8lib.c src/lbitlib.c src/loadlib.c)
set(SRC_LUA src/lua.c)
set(SRC_LUAC src/luac.c)

add_library(liblua SHARED ${SRC_LIB})
set_target_properties(liblua PROPERTIES OUTPUT_NAME lua CLEAN_DIRECT_OUTPUT 1)

add_executable(lua ${SRC_LUA})

if(UNIX)
target_link_libraries(lua liblua m dl)
else()
target_link_libraries(lua liblua)
endif()

add_library(liblua_static STATIC ${SRC_LIB})

add_executable(luac ${SRC_LUAC})
if(UNIX)
target_link_libraries(luac liblua_static m dl)
else()
target_link_libraries(luac liblua_static)
endif()

set(INSTALL_BIN bin CACHE PATH "Where to install binaries to.")
set(INSTALL_LIB lib CACHE PATH "Where to install libraries to.")
set(INSTALL_INC include CACHE PATH "Where to install headers to.")

install(TARGETS lua luac RUNTIME DESTINATION ${INSTALL_BIN})
install(TARGETS liblua DESTINATION ${INSTALL_LIB})
install(FILES 
  src/lua.h 
  src/lualib.h
  src/lauxlib.h
  src/lua.hpp
  src/luaconf.h
  DESTINATION ${INSTALL_INC})
  
