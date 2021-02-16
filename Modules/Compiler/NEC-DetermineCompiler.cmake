set(_compiler_id_pp_test "defined(__NEC__)")

set(_compiler_id_version_compute "
# if defined(__NEC_VERSION__)
#   define @PREFIX@COMPILER_VERSION_MAJOR @MACRO_DEC@(__NEC_VERSION__/10000)
#   define @PREFIX@COMPILER_VERSION_MINOR @MACRO_DEC@(__NEC_VERSION__/100 % 100)
#   define @PREFIX@COMPILER_VERSION_PATCH @MACRO_DEC@(__NEC_VERSION__     % 100)
# endif
")
