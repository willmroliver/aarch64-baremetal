.arch armv8-a

.section .boot, "ax"

.global _boot_main

_boot_start:
	ldr x0, =_boot_stack_top
	mov sp, x0
	b _init_mmu

	; bl _boot_main

_init_mmu:
	xor x9, x9, x9
	mov x9, #0x1
	lsl x9, x9, #0x30   ; ASID [bits 63-48 of TTBR0_EL1] = 1
	ldr x10, =_stables  ; 48-bit base address of page tables
	orr x9, x9, x10	    ; concat
	msr TTBR0_EL1, x9   ; set

