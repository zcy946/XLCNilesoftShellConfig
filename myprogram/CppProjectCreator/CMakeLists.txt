cmake_minimum_required(VERSION 3.16)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

project(CppProjectCreator)
add_compile_options("$<$<CXX_COMPILER_ID:MSVC>:/utf-8>")

aux_source_directory(${CMAKE_CURRENT_SOURCE_DIR} SRC)

add_executable(${PROJECT_NAME}
        ${SRC}
)