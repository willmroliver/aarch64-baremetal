add_library(${DRIVERS_LIB} STATIC
  uart.c
)

target_include_directories(${DRIVERS_LIB} 
  PUBLIC
    inc
)
