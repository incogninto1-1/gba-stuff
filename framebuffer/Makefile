obj := crt0.o example.o
bin := example.gba

CC := arm-none-eabi-gcc
AS := arm-none-eabi-as
OBJCOPY := arm-none-eabi-objcopy

opt := -O3 -fomit-frame-pointer -marm -mcpu=arm7tdmi

CFLAGS := $(opt) -std=c99 -pedantic -Wall

$(bin): $(obj)
	$(CC) -o out.elf $(obj) -Tlnkscript -nostartfiles -lm
	$(OBJCOPY) -O binary out.elf $(bin)
	#$(RM) out.elf

-include $(obj:.o=.d)

%.d: %.c
	@rm -f $@; $(CC) -MM $(CFLAGS) $< > $@

.PHONY: clean
clean:
	rm -f $(obj) $(obj:.o=.d)
