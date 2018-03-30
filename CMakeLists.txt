cmake_minimum_required(VERSION 2.8.12)
set(CMAKE_MACOSX_RPATH 1)
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_SOURCE_DIR}/cmake/Modules/")
if(MSVC AND NOT "${CMAKE_GENERATOR}" MATCHES "(Win64|IA64)")
  message(FATAL_ERROR "ERROR: Building with Visual Studio requires 
          using a 64-bit project generator 
          (e.g. cmake -G \"Visual Studio 15 2017 Win64\")")
endif()


find_package(Csound)
if(CSOUND_FOUND)
  message(STATUS "Building CsLadspa Plugin!")
  add_library(csladspa64 MODULE "src/csladspa.cpp")
  if(MSVC) 
    target_include_directories(csladspa64 PRIVATE "${CMAKE_SOURCE_DIR}/include")
    target_link_libraries(csladspa64 PRIVATE ${CSOUND_LIBRARY})
  else()
    target_link_libraries(csladspa64 ${CSOUND_LIBRARY})
    target_include_directories(csladspa64 PRIVATE ${CSOUND_INCLUDE_DIRS})
  endif()
  # We do not want the lib prefix
  set_target_properties(csladspa64 PROPERTIES PREFIX "")
  if(APPLE)
    set(PLUGIN_INSTALL_DIR "$ENV{HOME}/Library/Audio/Plug-Ins/ladspa")
  else()
    set(PLUGIN_INSTALL_DIR "${CMAKE_INSTALL_PREFIX}/lib")
  endif()
  install(TARGETS  csladspa64
	LIBRARY DESTINATION "${PLUGIN_INSTALL_DIR}")
else()
  message(STATUS "The Csound library is required for CsLadspa")
endif()
