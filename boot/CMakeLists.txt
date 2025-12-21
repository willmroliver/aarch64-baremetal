add_executable(${BOOT_EXEC} 
  boot.s
  boot.c
)

target_link_options(${BOOT_EXEC} 
  PUBLIC -T ${CMAKE_CURRENT_SOURCE_DIR}/linker.ld
)

target_link_libraries(${BOOT_EXEC} PRIVATE ${DRIVERS_LIB})
