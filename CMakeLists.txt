cmake_minimum_required(VERSION 3.18)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_C_STANDARD 11)

set(LOCAL_CFG "" CACHE FILEPATH "Path to local config")

if(NOT LOCAL_CFG)
    message(FATAL_ERROR "LOCAL_CFG variable not set. Use -DLOCAL_CFG=<file> to set local config. See local-cmake-example for available options")
endif()

message(STATUS "Using local config from ${LOCAL_CFG}")
include(${LOCAL_CFG})

include(cmake/toolchain.cmake)
include(cmake/openocd.cmake)

set(NAME stm32-project)
project(${NAME} C CXX ASM)

set(OUTPUT_PATH ${CMAKE_CURRENT_BINARY_DIR}/build)

file(MAKE_DIRECTORY ${OUTPUT_PATH})

set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${OUTPUT_PATH}/lib)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${OUTPUT_PATH}/lib)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${OUTPUT_PATH}/bin)

find_program(CMAKE_MAKE_PROGRAM NAMES ninja HINTS ${NINJA_DIR})

if(NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE Debug CACHE STRING "" FORCE)
else()
    set(CMAKE_BUILD_TYPE ${CMAKE_BUILD_TYPE} CACHE STRING "" FORCE)
endif()


add_subdirectory(libs)
add_subdirectory(src)