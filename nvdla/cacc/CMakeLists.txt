cmake_minimum_required(VERSION 3.8)

# ---------------------------------------------------------------------------- #
# PROJECT
# name version language
# ---------------------------------------------------------------------------- #
project(nvdla_cacc VERSION 1.0 LANGUAGES CXX)

# ---------------------------------------------------------------------------- #
# VARIABLE
# alias and configurations
# ---------------------------------------------------------------------------- #
set(CACC_TARGET ${PROJECT_NAME})

set(CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/cmake" ${CMAKE_MODULE_PATH})

# ---------------------------------------------------------------------------- #
# External dependencies
# ---------------------------------------------------------------------------- #
##
## ilang
##
find_package(ilang REQUIRED)


# ---------------------------------------------------------------------------- #
# TARGET
# executable
# ---------------------------------------------------------------------------- #
add_library(${CACC_TARGET} src/cacc_ila.cc)

target_include_directories(${CACC_TARGET} PRIVATE include)
target_link_libraries(${CACC_TARGET} ilang::ilang)

include_directories(/home/tmp/local/src/ILAng/include)
add_executable(${CACC_TARGET}Exe
  app/main.cc
)

target_include_directories(${CACC_TARGET}Exe PUBLIC include)
target_link_libraries(${CACC_TARGET}Exe ${CACC_TARGET})
