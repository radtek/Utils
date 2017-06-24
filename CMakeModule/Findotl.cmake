IF(otl_VERSION_MAJOR)
	SET(OtlFileName otlv${otl_VERSION_MAJOR}.h)
ELSE()
	SET(OtlFileName otl.h)
ENDIF()
FIND_PATH(otl_INCLUDE_DIR otl/${OtlFileName} PATHS ${otl_INCLUDEDIR})

IF(NOT otl_INCLUDE_DIR)
	MESSAGE(FATAL_ERROR "Unable to find the requested otl library,please set otl_INCLUDEDIR to right path.")
ELSE()
	INCLUDE_DIRECTORIES(${otl_INCLUDE_DIR})
	SET(otl_FOUND TRUE)
	MESSAGE(STATUS "Found otl library")
	MESSAGE(STATUS "  Include path: " ${otl_INCLUDE_DIR})
ENDIF()