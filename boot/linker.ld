MEMORY
{
  FLASH (RX) : ORIGIN = 0x0, LENGTH = 4M
  RAM (!RX) : ORIGIN = 0x40000000, LENGTH = 126M 
} 

ENTRY(_start)

SECTIONS
{
  . = ORIGIN(RAM);

  .boot ALIGN(0x4) : {
    _start = . ;
    *(.boot) ;
    _eboot = . ;
  } > RAM

  .text ALIGN(0x4) : {
    _stext = . ;
    *(.text*) ;
    _etext = . ;
  } > RAM

  .data ALIGN(0x4) : {
    _sdata = . ;
    *(.data*) ;
    _edata = . ;
  } > RAM

  .bss ALIGN(0x4) : {
    _sbss = . ;
    *(.bss*) ;
    _ebss = . ;
  } > RAM

  .rodata ALIGN(0x4) : {
    _srodata = . ;
    *(.rodata*) ; 
    _erodata = . ;
  } > RAM

  _stack_top = ORIGIN(RAM) + LENGTH(RAM);
}
