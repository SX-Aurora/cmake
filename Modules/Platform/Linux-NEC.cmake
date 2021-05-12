if(__LINUX_COMPILER_NEC)
  return()
endif()
set(__LINUX_COMPILER_NEC 1)

macro(__linux_compiler_nec lang)
  set(CMAKE_${lang}_COMPILE_OPTIONS_PIC "-fPIC")
  set(CMAKE_${lang}_COMPILE_OPTIONS_PIE "") # -fPIE is not supported and ignored by NEC compiler
  set(CMAKE_SHARED_LIBRARY_${lang}_FLAGS "-fPIC")
  set(CMAKE_SHARED_LIBRARY_CREATE_${lang}_FLAGS "-shared")
endmacro()

# Will be used by find_library as search path
list(APPEND CMAKE_PREFIX_PATH /opt/nec/ve/lib)
