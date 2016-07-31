# Test makefile

PRJ_ROOT_DIR=~/prog/blink
PRJ=blink

TOOLCHAIN_PREF=arm-none-eabi-

CC=$(TOOLCHAIN_PREF)gcc
LD=$(TOOLCHAIN_PREF)gcc
AS=$(TOOLCHAIN_PREF)gcc

INCLUDE_DIRS= $(PRJ_ROOT_DIR)/system

C_FLAGS= -g -Wall -mthumb -mcpu=cortex-m3 -ffunction-sections -fdata-sections

L_FLAGS= --gc-sections,--print-output-format,--print-memory-usage
LD_SCRIPT= $(PRJ_ROOT_DIR)/ld/link.ld

A_FLAGS= -x assembler

OBJ= main.o \
     startup_stm32l1xx_md.oS \
     system_stm32l1xx.o

default: $(OBJ) Makefile 
	$(LD) --specs=nosys.specs -Wl,$(L_FLAGS) -T $(LD_SCRIPT) -o $(PRJ).elf $(OBJ)

main.o : $(PRJ_ROOT_DIR)/main.c $(PRJ_ROOT_DIR)/system/stm32l152xe.h
	$(CC) -c $(C_FLAGS) $(PRJ_ROOT_DIR)/main.c -I $(INCLUDE_DIRS) 

system_stm32l1xx.o : $(PRJ_ROOT_DIR)/system/system_stm32l1xx.c
	$(CC) -c $(C_FLAGS) $(PRJ_ROOT_DIR)/system/system_stm32l1xx.c -I $(INCLUDE_DIRS)

startup_stm32l1xx_md.oS : $(PRJ_ROOT_DIR)/system/startup_stm32l1xx_md.s.txt
	$(AS) -c $(A_FLAGS) $(PRJ_ROOT_DIR)/system/startup_stm32l1xx_md.s.txt -o startup_stm32l1xx_md.oS

.PHONY: clean

clean:
	rm -f $(OBJ) $(PRJ).elf $(PRJ).hex
