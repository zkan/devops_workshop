
set(GTEST_SRC_DIR /usr/src/googletest/googletest/src)

set(SRC_DIR ${CMAKE_SOURCE_DIR})
set(TESTS_DIR ${CMAKE_CURRENT_SOURCE_DIR})

add_executable(fd_unittest ${SRC_DIR}/FaceDetectionService.cpp
                           ${TESTS_DIR}/TestFaceDetectionService.cpp
                           ${SRC_DIR}/json/jsoncpp.cpp
                           ${SRC_DIR}/base64/base64.cpp
)

set_target_properties(
  fd_unittest PROPERTIES COMPILE_FLAGS
  "-g -O0 -fprofile-arcs -ftest-coverage --coverage -Wall -Wshadow -fexceptions -DGTEST_HAS_PTHREAD=1 -fexceptions"
)

set_target_properties(fd_unittest PROPERTIES LINK_FLAGS "--coverage")

find_library(GTEST_MAIN_LIB gtest_main ${CMAKE_SOURCE_DIR}/../test)
find_library(GTEST_LIB gtest ${CMAKE_SOURCE_DIR}/../test)
find_library(GMOCK_LIB gmock ${CMAKE_SOURCE_DIR}/../test)
find_library(GMOCK_MAIN_LIB gmock_main ${CMAKE_SOURCE_DIR}/../test)

target_link_libraries(fd_unittest ${GTEST_MAIN_LIB}
                                  ${GTEST_LIB}
                                  ${GMOCK_MAIN_LIB}
                                  ${GMOCK_LIB}
                                  ${OpenCV_LIBS}
                                  webcc
                                  Boost::thread
                                  Boost::filesystem
#target_link_libraries (facedetector ${OpenCV_LIBS} mysqlcppconn webcc Boost::filesystem Boost::thread)
)

target_include_directories(fd_unittest PUBLIC ${OpenCV_INCLUDE_DIRS}
                                       PRIVATE ${CMAKE_SOURCE_DIR})
