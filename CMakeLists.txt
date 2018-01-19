function(make_plugin_frontend libname srcs)
    if(APPLE)
        add_library(${libname} SHARED ${srcs})
    else()
        add_library(${libname} MODULE ${srcs})
    endif()

    set(i 2)
    while( ${i} LESS ${ARGC} )
        if(NOT MSVC OR NOT("${ARGV${i}}" MATCHES "m"))
            target_link_libraries(${libname} ${ARGV${i}})
        endif()
        math(EXPR i "${i}+1")
    endwhile()

    set_target_properties(${libname} PROPERTIES
        RUNTIME_OUTPUT_DIRECTORY ${BUILD_PLUGINS_DIR}
        LIBRARY_OUTPUT_DIRECTORY ${BUILD_PLUGINS_DIR}
        ARCHIVE_OUTPUT_DIRECTORY ${BUILD_PLUGINS_DIR})

    install(TARGETS ${libname}
	LIBRARY DESTINATION "${PLUGIN_INSTALL_DIR}" )
endfunction(make_plugin_frontend)

message(STATUS "Building csLadspa.")

make_plugin_frontend(csladspa "csladspa/csladspa.cpp" "${CSOUNDLIB}")
# We do not want the lib prefix
set_target_properties(csladspa PROPERTIES PREFIX "")
