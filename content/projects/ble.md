---
title: "Smart Building Using BLE"
date: 2023-03-04T12:34:38+05:30
---

# Other Resources

- _Getting Started with Bluetooth Low Energy_ by Kevin Townsend, Carles Cufí, Akiba, and Robert Davidson
(O’Reilly). Copyright 2014 Kevin Townsend, Carles Cufí, Akiba, and Robert
Davidson, 978-1-491-94951-1.
- [nRF52840 DK User Guide](https://infocenter.nordicsemi.com/pdf/nRF52840_DK_User_Guide_v1.2.pdf)
- [nRF52840 Tutorial videos](https://youtube.com/playlist?list=PLiKJljyEUlZj4z8RqJKTaoMpSqjLdBGO4)

# Personal Notes

## Harwarde Info
- nRF52840 is an ARM Cortex M4F _SOC_.
- The nRF52840 DK is a hardware development platform used to design and develop
  application firmware on the nRF52840.
- There are *32 pins* on the board
### Buttons and LEDs

| Part     | GPIO  |
|----------|-------|
| Button 1 | P0.11 |
| Button 2 | P0.12 |
| Button 3 | P0.24 |
| Button 4 | P0.25 |
| LED 1    | P0.13 |
| LED 2    | P0.14 |
| LED 3    | P0.15 |
| LED 4    | P0.16 |

Both the buttons and the LEDs are **Active low**.
![LED circuit](/led_pin.png)
![Button circuit](/button_pin.png)

## API

### GPIO

#### Manual way
`nrf_gpio.h`  
Header file

- `nrf_gpio_cfg_output(pin_number)`  sets a pin as output
- `nrf_gpio_cfg_input(pin_number, pull_config)` sets a pin as input
- `nrf_gpio_range_cfg_input(start, end, pull_config)` sets a _pin(s)_ as input
{{< highlight c>}}
enum pull_config {
        NRF_GPIO_PIN_PULLUP,
        NRF_GPIO_PIN_PULLDOWN,
        NRF_GPIO_PIN_NOPULL
}
{{< /highlight>}}

- `nrf_gpio_pin_set(pin_number)`  sets a pin to logic 1
- `nrf_gpio_pin_clear(pin_number)`  sets a pin to logic 0
- `nrf_gpio_pin_toggle(pin_number)`  inverts the pin's state
- `nrf_gpio_pin_read(pin_number)` gets the logical value of a pin

#### Board Support Package (BSP)

With the help of `boards.h` all the pins of a specific board will have predefined
macros. `boards.h` also has several abstracted function to handle GPIO operations.

- `bsp_board_init(BSP_INIT_LEDS | BSP_INIT_BUTTONS | BSP_INIT_NONE)` initializes
  the given group

##### LED functions
- `bsp_board_led_on(led_idx)`
- `bsp_board_led_off(led_idx)`
- `bsp_board_led_invert(led_idx)`
- `bsp_board_leds_on()`
- `bsp_board_leds_off()`
