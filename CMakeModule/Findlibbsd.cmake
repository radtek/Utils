FIND_PATH(libbsd_INCLUDE_DIR NAMES bsd/libutil.h PATHS ${libbsd_INCLUDEDIR})

GET_FILENAME_COMPONENT(libbsd_LIBRARY_DIR_DEBUG ./Debug ABSOLUTE BASE_DIR ${libbsd_LIBRARYDIR})
FIND_LIBRARY(libbsd_LIBRARY_DEBUG "bsd" PATHS ${libbsd_LIBRARY_DIR_DEBUG})
GET_FILENAME_COMPONENT(libbsd_LIBRARY_DIR_RELEASE ./Release ABSOLUTE BASE_DIR ${libbsd_LIBRARYDIR})
FIND_LIBRARY(libbsd_LIBRARY_RELEASE "bsd" PATHS ${libbsd_LIBRARY_DIR_RELEASE})
IF(libbsd_LIBRARY_DEBUG AND libbsd_LIBRARY_RELEASE)
	SET(libbsd_LIBRARY_DEBUG ${libbsd_LIBRARY_DEBUG} CACHE PATH "libbsd debug include path" FORCE)
	SET(libbsd_LIBRARY_RELEASE ${libbsd_LIBRARY_RELEASE} CACHE PATH "libbsd release include path" FORCE)
ENDIF()

IF(NOT libbsd_INCLUDE_DIR OR NOT libbsd_LIBRARY_DEBUG)
	MESSAGE(FATAL_ERROR "Unable to find the requested bsd library,please set libbsd_INCLUDEDIR and libbsd_LIBRARYDIR to right path.")
ELSE()
	ADD_LIBRARY(bsd STATIC IMPORTED)
	SET_TARGET_PROPERTIES(bsd PROPERTIES INTERFACE_INCLUDE_DIRECTORIES ${libbsd_INCLUDE_DIR})
	SET_TARGET_PROPERTIES(bsd PROPERTIES IMPORTED_LOCATION_DEBUG ${libbsd_LIBRARY_DEBUG})
	SET_TARGET_PROPERTIES(bsd PROPERTIES IMPORTED_LOCATION_RELEASE ${libbsd_LIBRARY_RELEASE})
	SET_TARGET_PROPERTIES(bsd PROPERTIES IMPORTED_LOCATION_RELWITHDEBINFO ${libbsd_LIBRARY_RELEASE})
	SET(libbsd_FOUND TRUE)
	MESSAGE(STATUS "Found bsd library")
	MESSAGE(STATUS "  Include path: " ${libbsd_INCLUDE_DIR})
	MESSAGE(STATUS "  Debug library path: " ${libbsd_LIBRARY_DEBUG})
	MESSAGE(STATUS "  Release library path: " ${libbsd_LIBRARY_RELEASE})
ENDIF()