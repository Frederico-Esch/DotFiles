cmake_minimum_required(VERSION 3.8)
project("build-PathModifier")

add_subdirectory(PathModifier)

add_custom_target(build-All ALL DEPENDS PathModifier)
add_custom_command(
    TARGET build-All
    POST_BUILD
    COMMAND ${CMAKE_COMMAND}
    ARGS -E copy ${CMAKE_CURRENT_BINARY_DIR}/PathModifier/PathModifier.exe ${CMAKE_CURRENT_SOURCE_DIR}/PathModifier.exe
    DEPENDS PathModifier/PathModifier.exe
    COMMENT "Moving executable"
)

#COMMAND mv ${CMAKE_CURRENT_BINARY_DIR}/PathModifier/PathModifier.exe ${CMAKE_CURRENT_CURRENT_SOURCE_DIR}/PathModifier.exe
