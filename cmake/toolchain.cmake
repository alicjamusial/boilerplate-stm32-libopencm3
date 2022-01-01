list(APPEND CMAKE_MODULE_PATH ..)
SET(CMAKE_SYSTEM_NAME Generic)
SET(CMAKE_CROSSCOMPILING 1)
set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)
set(CMAKE_SYSTEM_PROCESSOR armv6)

find_program(CMAKE_C_COMPILER NAMES arm-none-eabi-gcc PATHS ${ARM_TOOLCHAIN})
find_program(CMAKE_CXX_COMPILER NAMES arm-none-eabi-g++ PATHS ${ARM_TOOLCHAIN})
find_program(CMAKE_AR NAMES arm-none-eabi-gcc-ar PATHS ${ARM_TOOLCHAIN})
find_program(CMAKE_RANLIB NAMES arm-none-eabi-gcc-ranlib PATHS ${ARM_TOOLCHAIN})
find_program(CMAKE_OBJCOPY NAMES arm-none-eabi-objcopy PATHS C:/tools/pack/bin)
find_program(CMAKE_OBJDUMP NAMES arm-none-eabi-objdump PATHS ${ARM_TOOLCHAIN})
find_program(CMAKE_GCC_SIZE NAMES arm-none-eabi-size PATHS ${ARM_TOOLCHAIN})

find_program(OPENOCD NAME openocd PATHS ${OPENOCD_DIR})

set(CMAKE_EXECUTABLE_FORMAT ELF)

set(COMPILER_FLAGS "-mcpu=cortex-m3 -mthumb -ffunction-sections -fdata-sections -g -O0 -mfix-cortex-m3-ldrd -flto")

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${COMPILER_FLAGS}")
set(CMAKE_ASM_FLAGS "${CMAKE_C_FLAGS}")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${COMPILER_FLAGS} -std=c++17 -fno-exceptions -fno-rtti")
set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -nostartfiles -Wl,-gc-sections -specs=nano.specs -specs=nosys.specs -flto")

add_definitions(
    -DSTM32L4
    -DSTM32L476RG
)