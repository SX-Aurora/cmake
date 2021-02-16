# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.
include(Compiler/NEC)
__compiler_nec(CXX)

if(CMAKE_CXX_COMPILER_VERSION GREATER_EQUAL 2)
  set(CMAKE_CXX98_STANDARD_COMPILE_OPTION  -std=c++03)
  set(CMAKE_CXX98_EXTENSION_COMPILE_OPTION -std=gnu++03)
  set(CMAKE_CXX98_STANDARD__HAS_FULL_SUPPORT ON)

  set(CMAKE_CXX11_STANDARD_COMPILE_OPTION  -std=c++11)
  set(CMAKE_CXX11_EXTENSION_COMPILE_OPTION -std=gnu++11)
  set(CMAKE_CXX11_STANDARD__HAS_FULL_SUPPORT ON)

  set(CMAKE_CXX14_STANDARD_COMPILE_OPTION  -std=c++14)
  set(CMAKE_CXX14_EXTENSION_COMPILE_OPTION -std=gnu++14)
  set(CMAKE_CXX14_STANDARD__HAS_FULL_SUPPORT ON)

  set(CMAKE_CXX17_STANDARD_COMPILE_OPTION  -std=c++17)
  set(CMAKE_CXX17_EXTENSION_COMPILE_OPTION -std=gnu++17)

  set(CMAKE_CXX_LINK_WITH_STANDARD_COMPILE_OPTION 1)
  __compiler_check_default_language_standard(CXX 2.3.0 11 3.1.1 17)
endif()
