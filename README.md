# STM32 & libopencm3 boilerplate

## disclaimer
It is **not** a professional code example. It's only for personal needs to be able to very quickly setup  _something_ that is not meant to be perfect but only to work :).

## prerequisites
- ARM toolchain (xpack)
- Python >3.8
- ninja

## setup
- Create `local.cmake` file in `.local.` folder in root
. Fill it with content specified in `local-cmake-example`
- run `ninja all`
- run `ninja stm.flash`

While running cmake, use params:
`-DLOCAL_CFG=../src/.local/local.cmake -G Ninja`