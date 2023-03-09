cmake_minimum_required(VERSION 3.10.2)

# where to find our CMake modules
set(CMAKE_MODULE_PATH "$ENV{CARMA_OPT_DIR}/cmake")

project(action-test
    DESCRIPTION "Action test library"
    HOMEPAGE_URL https://github.com/usdot-fhwa-stol/actions
	VERSION 0.0.1
)

add_library(${PROJECT_NAME} SHARED)
set_target_properties(${PROJECT_NAME} PROPERTIES
    SOVERSION 1
)

include(CommonSource)
include(InstallingGeneral)
include(InstallingConfigs)
include(Packing)
