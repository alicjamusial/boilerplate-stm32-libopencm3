#include "libopencm3/stm32/flash.h"
#include "libopencm3/stm32/gpio.h"
#include "libopencm3/stm32/rcc.h"

static void SetupLed()
{
    rcc_periph_clock_enable(rcc_periph_clken::RCC_GPIOA);

    gpio_mode_setup(GPIOA, GPIO_MODE_OUTPUT, GPIO_PUPD_NONE, GPIO5);

    while (true)
    {

        gpio_toggle(GPIOA, GPIO5);

        for (auto i = 0; i < 200000; i++)
        {
            ;;
        }
    }
}

int main()
{
    SetupLed();
    return 0;
}
