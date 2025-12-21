#include "uart.h"

#define QEMU_CLK_HZ 24000000
#define BAUD_RATE 230400

extern void _boot_main()
{
	uart_baud_init(QEMU_CLK_HZ, BAUD_RATE);
	uart_transmit_init();

	char *word = "Hello, World!\n";
	int i = 0;

	while (1) {
		uart_write(word[i]);

		if (word[i] == '\n')
			break;

		++i;
	}

	for (;;);
}

