# see http://www.cmake.org/Wiki/CMake:Packaging_With_CPack
cmake_minimum_required(VERSION 2.4)

SET(CPACK_PACKAGE_DESCRIPTION_SUMMARY "Warmux - a convivial mass murder game")
SET(CPACK_PACKAGE_NAME "Warmux")
SET(CPACK_PACKAGE_VENDOR "Warmux Development Team")
SET(CPACK_PACKAGE_DESCRIPTION_FILE "${PROJECT_SOURCE_DIR}/README")
SET(CPACK_RESOURCE_FILE_LICENSE "${PROJECT_SOURCE_DIR}/COPYING")
SET(CPACK_PACKAGE_VERSION ${VERSION})
SET(CPACK_PACKAGE_VERSION_MAJOR ${WARMUX_MAJOR})
SET(CPACK_PACKAGE_VERSION_MINOR ${WARMUX_MINOR})
SET(CPACK_PACKAGE_VERSION_PATCH ${WARMUX_PATCH})
SET(CPACK_PACKAGE_FILE_NAME ${CPACK_PACKAGE_NAME}-${CPACK_PACKAGE_VERSION})
SET(CPACK_PACKAGE_INSTALL_DIRECTORY "Warmux ${WARMUX_MAJOR}.${WARMUX_MINOR}")

IF(UNIX)
  SET(CPACK_GENERATOR "TBZ2")
  SET(CPACK_SOURCE_GENERATOR "TBZ2")
  SET(CPACK_PACKAGE_EXECUTABLES "warmux" "Warmux")
  SET(CPACK_STRIP_FILES "bin/warmux")
ENDIF(UNIX)
IF(WIN32)
  SET(CPACK_GENERATOR "NSIS")
  SET(CPACK_SOURCE_GENERATOR "ZIP")
  SET(CPACK_PACKAGE_EXECUTABLES "warmux.exe" "Warmux")
  # because of a bug in nsis there have to be at least 4 backslashes once
  SET(CPACK_PACKAGE_ICON "${PROJECT_SOURCE_DIR}/data\\\\icon\\\\warmux_32x32.png")
  SET(CPACK_NSIS_URL_INFO_ABOUT "http:\\\\\\\\www.warmux.org")
  SET(CPACK_NSIS_CONTACT "warmux-dev@gna.org")
ENDIF(WIN32)

INCLUDE(CPack)
