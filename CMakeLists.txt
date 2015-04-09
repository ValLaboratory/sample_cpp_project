cmake_minimum_required(VERSION 2.8)
project(sample_cpp_project)

# set(CMAKE_CXX_COMPILER "clang++")
# set(CMAKE_CXX_COMPILER "g++")
set(CMAKE_CXX_COMPILER "g++-4.8")
set(CMAKE_CXX_FLAGS "-std=c++11")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall")


find_package(Boost COMPONENTS REQUIRED)

include_directories(include ${Boost_INCLUDE_DIRS})

# libsample_cpp_project.a
file(GLOB_RECURSE SRC_FILES "src/*.cc")
add_library(sample_cpp_project STATIC ${SRC_FILES})

# sample_cpp_project-test
file(GLOB_RECURSE TEST_FILES "test/*.cc")
add_executable(sample_cpp_project-test ${TEST_FILES})
set_target_properties(sample_cpp_project-test PROPERTIES OUTPUT_NAME sample_cpp_project_test)

link_directories(
  /usr/lib
  /usr/local/lib
  ${Boost_LIBRARY_DIRS}
)

target_link_libraries(sample_cpp_project-test
  sample_cpp_project
  glog
#iconv   ubuntu だといらない
  msgpack
  boost_date_time
  boost_graph
  boost_system
  boost_filesystem
  gflags
  gtest
  gmock
  pthread
)

