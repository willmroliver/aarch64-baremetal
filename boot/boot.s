.arch armv8-a

.section .boot, "ax"

.global _boot_start
.global _boot_main

_boot_start:
	ldr x0, =_stack_top
	mov sp, x0
	bl _boot_main

