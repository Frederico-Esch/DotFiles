cmake_minimum_required(VERSION 3.5)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

project(musiquinha-reborn C)

add_executable(musiquinha-reborn 
    src/main.c
)

target_link_libraries(musiquinha-reborn PUBLIC playerctl glib-2.0 gio-2.0 gobject-2.0)
target_include_directories(musiquinha-reborn PUBLIC
    /usr/include/glib-2.0
    /usr/include/glib-2.0/include
    /usr/include/sysprof-6
    /usr/include/playerctl
)
