# STM32 & libopencm3 boilerplate

## disclaimer
It is **not** a professional code example. It's only for personal needs to be able to very quickly setup  _something_ that is not meant to be perfect but only to work :).

It works with STM32L476 but it can be adjusted to any STM by changing some linker options and `opencm3` settings.

## prerequisites
- ARM toolchain ([xpack](https://github.com/xpack-dev-tools/) - I used [10.3.1-2.3 version](https://github.com/xpack-dev-tools/arm-none-eabi-gcc-xpack/releases/download/v10.3.1-2.3/xpack-arm-none-eabi-gcc-10.3.1-2.3-win32-x64.zip))
- Python >3.8 version (3.8.3 for me)
- ninja ([from here](https://github.com/ninja-build/ninja/releases/) - I used 1.10.2 version) 
- openocd ([from here](https://gnutoolchains.com/arm-eabi/openocd/) - I used 20211118 version)
- cmake ([from here](https://github.com/Kitware/CMake/releases) - I used 3.18.6 version)

## setup
- Download the repo to the `src` directory.
- Create `local.cmake` file in `.local` directory in source directory. Fill it with content specified in `local-cmake-example`.
- Create `build` directory on the same level as `src` directory.
- Go to `build` directory.
- Run cmake (`[path-to-cmake]/cmake.exe -DCMAKE_BUILD_TYPE=Debug -DCMAKE_C_COMPILER=[path-to-arm-none-eabi]/arm-none-eabi-gcc.exe -DCMAKE_CXX_COMPILER=[path-to-arm-none-eabi]/arm-none-eabi-g++.exe -G Ninja -DLOCAL_CFG=[path-to-project-sources]/.local/local.cmake [path-to-project-sources]`).
- Run `ninja all`.
- Run `ninja stm32.flash`.
- Enjoy.

While running cmake the important part is: `-G Ninja -DLOCAL_CFG=../src/.local/local.cmake` - use Ninja as generator and `local.cmake` as file defining your specific paths.