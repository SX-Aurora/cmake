if(__COMPILER_NEC)
  return()
endif()
set(__COMPILER_NEC 1)

include(Compiler/CMakeCommonCompilerMacros)

# Find other tools
get_filename_component(_CMAKE_C_TOOLCHAIN_LOCATION "${CMAKE_C_COMPILER}" PATH)
get_filename_component(_CMAKE_CXX_TOOLCHAIN_LOCATION "${CMAKE_CXX_COMPILER}" PATH)

find_program(CMAKE_NEC_LINKER nld HINTS "${_CMAKE_C_TOOLCHAIN_LOCATION}" "${_CMAKE_CXX_TOOLCHAIN_LOCATION}" )
find_program(CMAKE_NEC_LD     nld HINTS "${_CMAKE_C_TOOLCHAIN_LOCATION}" "${_CMAKE_CXX_TOOLCHAIN_LOCATION}" )
find_program(CMAKE_NEC_AR     nar   HINTS "${_CMAKE_C_TOOLCHAIN_LOCATION}" "${_CMAKE_CXX_TOOLCHAIN_LOCATION}" )
find_program(CMAKE_NEC_NM     nnm   HINTS "${_CMAKE_C_TOOLCHAIN_LOCATION}" "${_CMAKE_CXX_TOOLCHAIN_LOCATION}" )
find_program(CMAKE_NEC_RANLIB nranlib   HINTS "${_CMAKE_C_TOOLCHAIN_LOCATION}" "${_CMAKE_CXX_TOOLCHAIN_LOCATION}" )


set(CMAKE_LINKER "${CMAKE_NEC_LINKER}" CACHE FILEPATH "The NEC linker" FORCE)
mark_as_advanced(CMAKE_NEC_LINKER)
set(CMAKE_LD "${CMAKE_NEC_LD}" CACHE FILEPATH "The NEC linker" FORCE)
mark_as_advanced(CMAKE_NEC_LINKER)
set(CMAKE_AR "${CMAKE_NEC_AR}" CACHE FILEPATH "The NEC archiver" FORCE)
mark_as_advanced(CMAKE_NEC_AR)
set(CMAKE_NM "${CMAKE_NEC_NM}" CACHE FILEPATH "The NEC symbol viewer" FORCE)
mark_as_advanced(CMAKE_NEC_NM)
set(CMAKE_RANLIB "${CMAKE_NEC_RANLIB}" CACHE FILEPATH "The NEC archive indexer" FORCE)
mark_as_advanced(CMAKE_NEC_RANLIB)

macro(__compiler_nec lang)
  set(CMAKE_${lang}_VERBOSE_FLAG "-v")

  # Initial configuration flags
  string(APPEND CMAKE_${lang}_FLAGS_INIT " ")
  string(APPEND CMAKE_${lang}_FLAGS_DEBUG_INIT " -g -O0")
  string(APPEND CMAKE_${lang}_FLAGS_RELEASE_INIT " -O3")
  string(APPEND CMAKE_${lang}_FLAGS_RELWITHDEBINFO_INIT " -O3 -g")

  # PIC flags
  set(CMAKE_${lang}_COMPILE_OPTIONS_PIC "-fPIC")

  # Passing link options to the compiler
  set(CMAKE_${lang}_LINKER_WRAPPER_FLAG "-Wl,")
  set(CMAKE_${lang}_LINKER_WRAPPER_FLAG_SEP ",")

  # How to actually call the compiler
  set(CMAKE_${lang}_CREATE_PREPROCESSED_SOURCE "<CMAKE_${lang}_COMPILER> <DEFINES> <INCLUDES> <FLAGS> -E <SOURCE> > <PREPROCESSED_SOURCE>")
  set(CMAKE_${lang}_CREATE_ASSEMBLY_SOURCE "<CMAKE_${lang}_COMPILER> <DEFINES> <INCLUDES> <FLAGS> -S <SOURCE> -o <ASSEMBLY_SOURCE>")

endmacro()
