include(Compiler/NEC)
__compiler_nec(Fortran)

set(CMAKE_Fortran_SUBMODULE_SEP ".")
set(CMAKE_Fortran_SUBMODULE_EXT ".smod")

set(CMAKE_Fortran_PREPROCESS_SOURCE
  "<CMAKE_Fortran_COMPILER> <DEFINES> <INCLUDES> <FLAGS> -E <SOURCE> > <PREPROCESSED_SOURCE>")

set(CMAKE_Fortran_LINK_EXECUTABLE
  "<CMAKE_Fortran_COMPILER> <LINK_FLAGS> <OBJECTS> -o <TARGET> <LINK_LIBRARIES>")
set(CMAKE_Fortran_COMPILE_OPTIONS_PREPROCESS_ON "-fpp")

set(CMAKE_Fortran_FORMAT_FIXED_FLAG "-ffixed-form")
set(CMAKE_Fortran_FORMAT_FREE_FLAG "-ffree-form")

string(APPEND CMAKE_Fortran_FLAGS_DEBUG_INIT "")

set(CMAKE_Fortran_MODDIR_FLAG "-module ")
