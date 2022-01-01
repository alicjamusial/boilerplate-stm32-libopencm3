set(NAME stm32)

set(LINKER_SCRIPT ${LD_SCRIPTS}/stm32l476rg.ld)

add_executable(${NAME}
    main.cpp
)

set_target_properties(${NAME} PROPERTIES LINK_DEPENDS ${LINKER_SCRIPT})

set_property(TARGET ${NAME} APPEND_STRING PROPERTY LINK_FLAGS  "-Wl,-T${LINKER_SCRIPT}")
set_property(TARGET ${NAME} APPEND_STRING PROPERTY LINK_FLAGS  " -Wl,-Map=${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/${NAME}.map")

target_flash(${NAME})

target_link_libraries(${NAME}
    cm3
)
