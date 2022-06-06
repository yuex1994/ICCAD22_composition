cmake_minimum_required(VERSION 3.9.6)

# ---------------------------------------------------------------------------- #
# PROJECT
# name version language
# ---------------------------------------------------------------------------- #
project(flex VERSION 0.1 LANGUAGES CXX)

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
  src/arch_state_pe.cc
  src/config_state_pe.cc
  src/init_conditions_pe.cc
  src/interface_pe.cc
  src/pe_act_instrs.cc
  src/pe_config_instrs.cc
  src/pe_core_instrs.cc
  src/pe_store_instrs.cc
  src/pe_top.cc
  src/util.cc
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
