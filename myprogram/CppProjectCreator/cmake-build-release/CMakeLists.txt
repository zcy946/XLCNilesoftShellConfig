cmake_minimum_required(VERSION 3.16)
project()
add_compile_options("$<$<CXX_COMPILER_ID:MSVC>:/utf-8>")

aux_source_directory(${CMAKE_CURRENT_SOURCE_DIR}/src SRC)

add_executable(${PROJECT_NAME}
        ${SRC}
)