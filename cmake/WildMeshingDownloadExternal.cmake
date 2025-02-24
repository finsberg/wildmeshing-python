################################################################################
include(DownloadProject)

# With CMake 3.8 and above, we can hide warnings about git being in a
# detached head by passing an extra GIT_CONFIG option
if(NOT (${CMAKE_VERSION} VERSION_LESS "3.8.0"))
    set(WILDMESHING_EXTRA_OPTIONS "GIT_CONFIG advice.detachedHead=false")
else()
    set(WILDMESHING_EXTRA_OPTIONS "")
endif()

# Shortcut function
function(wildmeshing_download_project name)
    download_project(
        PROJ         ${name}
        SOURCE_DIR   ${WILDMESHING_EXTERNAL}/${name}
        DOWNLOAD_DIR ${WILDMESHING_EXTERNAL}/.cache/${name}
        QUIET
        ${WILDMESHING_EXTRA_OPTIONS}
        ${ARGN}
    )
endfunction()

################################################################################

function(wildmeshing_download_triwild)
    wildmeshing_download_project(triwild
        GIT_REPOSITORY  https://github.com/MariusCausemann/TriWild
        GIT_TAG         ec752debe750628ad8147df99e11c766e0794efc
    )
endfunction()

function(wildmeshing_download_tetwild)
    wildmeshing_download_project(tetwild
        GIT_REPOSITORY  https://github.com/MariusCausemann/fTetWild.git
        GIT_TAG         7f2e76be786cb62540ede53764a14355b5412d79
    )
endfunction()

function(wildmeshing_download_pybind11)
    wildmeshing_download_project(pybind11
        GIT_REPOSITORY https://github.com/pybind/pybind11
        GIT_TAG        a2e59f0e7065404b44dfe92a28aca47ba1378dc4
    )
endfunction()

# data
function(wildmeshing_download_data)
    wildmeshing_download_project(data
        GIT_REPOSITORY https://github.com/wildmeshing/data
        GIT_TAG        363f8e860673a4e4f68df6465b99e86809c96283
    )
endfunction()
