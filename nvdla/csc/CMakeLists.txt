cmake_minimum_required(VERSION 3.9.6)

# ---------------------------------------------------------------------------- #
# PROJECT
# name version language
# ---------------------------------------------------------------------------- #
project(nvdla VERSION 0.1 LANGUAGES CXX)

# ---------------------------------------------------------------------------- #
# VARIABLE
# alias and configurations
# ---------------------------------------------------------------------------- #
set(CMAKE_CXX_COMPILER "g++-9")
set(CMAKE_PREFIX_PATH /home/tmp/local)
set(MyTarget ${PROJECT_NAME})

set(CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/cmake" ${CMAKE_MODULE_PATH})

# ---------------------------------------------------------------------------- #
# External dependencies
# ---------------------------------------------------------------------------- #
##
## ilang
##
find_package(ilang REQUIRED 1.1.0)

# ---------------------------------------------------------------------------- #
# TARGET
# library
# ---------------------------------------------------------------------------- #
add_library(${MyTarget}ila
  src/csc_input.cc
  src/csc_state.cc
  src/csc_instrs.cc
  src/csc_top.cc
)

add_library(${PROJECT_NAME}::${MyTarget}ila ALIAS ${MyTarget}ila)

target_include_directories(${MyTarget}ila
  PUBLIC
    $<INSTALL_INTERFACE:include>
    $<BUILD_INTERFACE:${PROJECT_SOURCE_DIR}/include>
)

target_link_libraries(${MyTarget}ila ilang::ilang)

# ---------------------------------------------------------------------------- #
# TARGET
# executable
# ---------------------------------------------------------------------------- #
add_executable(${MyTarget} 
  app/main.cc
)

target_link_libraries(${MyTarget} PUBLIC ${MyTarget}ila)
