# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.
include(Compiler/NEC)
__compiler_nec(C)

set(CMAKE_DEPFILE_FLAGS_C "-MD -MT <OBJECT> -MF <DEPFILE>")

if(CMAKE_C_COMPILER_VERSION VERSION_GREATER_EQUAL 2.3.0)
  set(CMAKE_C89_EXTENSION_COMPILE_OPTION -std=gnu89)

  set(CMAKE_C99_STANDARD_COMPILE_OPTION  -std=c99)
  set(CMAKE_C99_EXTENSION_COMPILE_OPTION -std=gnu99)
  set(CMAKE_C99_STANDARD__HAS_FULL_SUPPORT ON)

  set(CMAKE_C11_STANDARD_COMPILE_OPTION  -std=c11)
  set(CMAKE_C11_EXTENSION_COMPILE_OPTION -std=gnu11)
  set(CMAKE_C11_STANDARD__HAS_FULL_SUPPORT ON)
endif()

__compiler_check_default_language_standard(C 2.3.0 99 4 11)
