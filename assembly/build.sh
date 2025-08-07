#!bin/bash

arm-none-eabi-as -mcpu=arm7tdmi crt0.s -o a.elf
arm-none-eabi-objcopy -O binary a.elf aa.gba
