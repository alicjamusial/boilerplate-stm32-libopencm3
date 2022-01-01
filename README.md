# STM32 & libopencm3 boilerplate

## disclaimer
It is **not** a professional code example. It's only for personal needs to be able to very quickly setup  _something_ that is not meant to be perfect but only to work :).

## prerequisites
- ARM toolchain (xpack)
- Python >3.8
- ninja

## setup
- Download the repo to the `src` directory.
- Create `local.cmake` file in `.local` directory in source directory. Fill it with content specified in `local-cmake-example`.
- Create `build` directory on the same level as `src` directory.
- Go to `build` directory.
- Run `ninja all`.
- Run `ninja stm32.flash`.
- Enjoy.

While running cmake, use params:
`-G Ninja -DLOCAL_CFG=../src/.local/local.cmake`