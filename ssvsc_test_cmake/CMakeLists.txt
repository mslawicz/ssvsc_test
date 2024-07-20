# Define minimal required version of CMake.
cmake_minimum_required(VERSION "3.25")

# Project definition
project(
	ssvsc_test
	VERSION 1.0
	LANGUAGES C CXX ASM
)

# Include the definition of the slc_ssvsc_test target,
# which contains the content of the SLC project
include(ssvsc_test.cmake)

# project source files
file(GLOB PROJECT_SOURCE_FILES CONFIGURE_DEPENDS ../src/*.c)

add_executable(ssvsc_test
    # Add additional sources here
    ${PROJECT_SOURCE_FILES}
)

target_include_directories(ssvsc_test PUBLIC
    # Add additional include paths here
    ../src
)

target_compile_definitions(ssvsc_test PUBLIC
    # Add additional macros here
)

target_compile_options(ssvsc_test PUBLIC
    # Set additional compiler flags here
    "-O0"
)

target_link_options(ssvsc_test PUBLIC
    # Set additional linker flags here
)

# Link with the content defined in the SLC project
target_link_libraries(ssvsc_test PRIVATE
    slc_ssvsc_test
)

# Include managed project content if available
include(ssvsc_test_project.cmake OPTIONAL RESULT_VARIABLE managed_project)
if(managed_project)
    message(STATUS "Using managed project content from ${managed_project}")
endif()

# Force the gcc linker command
set_target_properties(ssvsc_test PROPERTIES LINKER_LANGUAGE C)

# Create .bin, .hex and .s37 artifacts after building the project
add_custom_command(TARGET ssvsc_test
    POST_BUILD
    COMMAND ${CMAKE_OBJCOPY} -O srec "$<TARGET_FILE:ssvsc_test>" "$<TARGET_FILE_DIR:ssvsc_test>/$<TARGET_FILE_BASE_NAME:ssvsc_test>.s37"
    COMMAND ${CMAKE_OBJCOPY} -O ihex "$<TARGET_FILE:ssvsc_test>" "$<TARGET_FILE_DIR:ssvsc_test>/$<TARGET_FILE_BASE_NAME:ssvsc_test>.hex"
    COMMAND ${CMAKE_OBJCOPY} -O binary "$<TARGET_FILE:ssvsc_test>" "$<TARGET_FILE_DIR:ssvsc_test>/$<TARGET_FILE_BASE_NAME:ssvsc_test>.bin" 
)

# Run post-build pipeline to perform additional post-processing
if(post_build_command)
add_custom_command(TARGET ssvsc_test
    POST_BUILD
    WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/..
    COMMAND ${post_build_command}
)
endif()