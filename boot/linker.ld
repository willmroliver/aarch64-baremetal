KERNEL_VMA = 0xfff0000000000000 ;

ENTRY(_sboot)

SECTIONS
{
  . = LOAD_ADDRESS ;
  _ram_start = . ;

  .boot ALIGN(0x4) : AT(LOAD_ADDRESS) {
    _sboot = . ;
    *(.boot*) ;
    _eboot = . ;
    _stables = . ;
    . = . + 0x10000;
    _etables = . ;
    . = . + 0x4000;
    _boot_stack_top = . ;
  }

  . = KERNEL_VMA ;
  _skernel = . ;

  .text ALIGN(0x4) : AT(ADDR(.boot) + SIZEOF(.boot)) {
    _stext = . ;
    *(.text*) ;
    _etext = . ;
  }

  .data ALIGN(0x4) : AT(ADDR(.text) + SIZEOF(.text)) {
    _sdata = . ;
    *(.data*) ;
    _edata = . ;
  }

  .bss ALIGN(0x4) : AT(ADDR(.data) + SIZEOF(.data)){
    _sbss = . ;
    *(.bss*) ; FILL(0x0)
    _ebss = . ;
  }

  .rodata ALIGN(0x4) : AT(ADDR(.bss) + SIZEOF(.bss)) {
    _srodata = . ;
    *(.rodata*) ; 
    _erodata = . ;
  }

  _end = . ; 
}
