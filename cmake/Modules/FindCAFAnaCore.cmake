####  FindCAFAnaCore.cmake:
####     Find the CAFAnaCore library.
####     Assumes you have a $CAFANACORE_INC environment variable set.
####
####   Original author:  J. Wolcott <jwolcott@fnal.gov>
####   Date:             August 2020

set(CAFANACORE_DIR $ENV{CAFANACORE_DIR})
message(STATUS "Trying CAFAnaCore directory: ${CAFANACORE_DIR}")

set(CAFANACORE_VERSION $ENV{CAFANACORE_VERSION})
if(NOT CAFANACORE_VERSION)
	if (EXISTS ${CAFANACORE_DIR}/ups/cafanacore.table)
		file(READ ${CAFANACORE_DIR}/ups/cafanacore.table table_contents)
		if(${table_contents} MATCHES "VERSION=([^ \t\r\n]+)")
			set(CAFANACORE_VERSION ${CMAKE_MATCH_1})
		endif()
	endif()
endif()
message(STATUS "Found CAFAnaCore version: ${CAFANACORE_VERSION}")

set(CAFANACORE_INC $ENV{CAFANACORE_INC})
if(NOT CAFANACORE_INC)
	if (EXISTS ${CAFANACORE_DIR}/include)
		set(CAFANACORE_INC ${CAFANACORE_DIR}/include)
	endif()
endif()
message(STATUS "Found CAFAnaCore include dir: ${CAFANACORE_INC}")

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(CAFAnaCore
		REQUIRED_VARS CAFANACORE_DIR CAFANACORE_VERSION CAFANACORE_INC
		VERSION_VAR CAFANACORE_VERSION)
