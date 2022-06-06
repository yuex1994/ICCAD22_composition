cmake_minimum_required(VERSION 3.8)

# ---------------------------------------------------------------------------- #
# PROJECT
# name version language
# ---------------------------------------------------------------------------- #
project(BSGOFFCHIP VERSION 1.0 LANGUAGES CXX)

# ---------------------------------------------------------------------------- #
# VARIABLE
# alias and configurations
# ---------------------------------------------------------------------------- #
 set(CMAKE_CXX_COMPILER "g++-9")
 set(CMAKE_PREFIX_PATH /home/tmp/local)
set(BSGOFFCHIP_TARGET ${PROJECT_NAME})

set(CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/cmake" ${CMAKE_MODULE_PATH})

# ---------------------------------------------------------------------------- #
# External dependencies
# ---------------------------------------------------------------------------- #
##
## ilang
##
find_package(ilang REQUIRED)

##
## Python (required if CMake version < 3.12)
##
if(${CMAKE_VERSION} VERSION_LESS 3.12)

  if(NOT TARGET Python::Python)
    add_library(Python::Python IMPORTED INTERFACE)

    set_property(TARGET Python::Python 
      PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${PYTHON_INCLUDE_DIRECTORIES}
    )

    set_property(TARGET Python::Python
      PROPERTY INTERFACE_LINK_LIBRARIES ${PYTHON_LIBRARIES}
    )
    
  endif()

endif()


# ---------------------------------------------------------------------------- #
# TARGET
# library
# ---------------------------------------------------------------------------- #
add_library(${BSGOFFCHIP_TARGET}
  src/upstream_ila.cc
  src/downstream_ila.cc
  src/upstream_child.cc
)

target_include_directories(${BSGOFFCHIP_TARGET} PRIVATE include)

target_link_libraries(${BSGOFFCHIP_TARGET} PUBLIC ilang::ilang)


# ---------------------------------------------------------------------------- #
# TARGET
# executable
# ---------------------------------------------------------------------------- #
add_executable(${BSGOFFCHIP_TARGET}Exe
  app/main.cc
)

target_include_directories(${BSGOFFCHIP_TARGET}Exe PRIVATE include)

target_link_libraries(${BSGOFFCHIP_TARGET}Exe ${BSGOFFCHIP_TARGET})
