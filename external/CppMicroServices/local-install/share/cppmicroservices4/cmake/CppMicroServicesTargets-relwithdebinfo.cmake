#----------------------------------------------------------------
# Generated CMake target import file for configuration "RelWithDebInfo".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "usResourceCompiler" for configuration "RelWithDebInfo"
set_property(TARGET usResourceCompiler APPEND PROPERTY IMPORTED_CONFIGURATIONS RELWITHDEBINFO)
set_target_properties(usResourceCompiler PROPERTIES
  IMPORTED_LOCATION_RELWITHDEBINFO "${_IMPORT_PREFIX}/bin/usResourceCompiler4"
  )

list(APPEND _IMPORT_CHECK_TARGETS usResourceCompiler )
list(APPEND _IMPORT_CHECK_FILES_FOR_usResourceCompiler "${_IMPORT_PREFIX}/bin/usResourceCompiler4" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
