function(target_openocd_command)
	cmake_parse_arguments("CMD" "" "TARGET" "COMMAND;DEPENDS" ${ARGN})

	set(OCD_ARGS "")
    list(APPEND OCD_ARGS "--file" "interface/stlink.cfg")
	list(APPEND OCD_ARGS "--file" "board/st_nucleo_l4.cfg")
#	list(APPEND OCD_ARGS "-d3") # VERBOSE DEBUG FLAG
	list(APPEND OCD_ARGS "--command" "adapter_khz 1000")

	foreach(I ${CMD_COMMAND})
		list(APPEND OCD_ARGS "--command" ${I})
	endforeach(I)
	
	add_custom_target(${CMD_TARGET}
		COMMAND ${OPENOCD} ${OCD_ARGS}
		USES_TERMINAL
		DEPENDS ${CMD_DEPENDS}
	)
endfunction()

function(target_flash TARGET)
	set(ELF_FILE ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/${TARGET})

	target_openocd_command(
		TARGET ${TARGET}.flash
		COMMAND 
			"program ${ELF_FILE} verify reset exit"
		DEPENDS
			${ELF_FILE}
	)
endfunction()

