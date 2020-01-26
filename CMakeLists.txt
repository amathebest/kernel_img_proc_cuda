cmake_minimum_required(VERSION 3.15)
project(kernel_img_proc_cuda LANGUAGES CXX CUDA)
find_package(CUDA)
set(CMAKE_CXX_STANDARD 17)

add_executable(kernel_img_proc_cuda main.cu utils.cpp utils.h)