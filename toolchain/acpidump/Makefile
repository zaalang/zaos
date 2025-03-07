.PHONY: default clean

include ../../mkspec.mk

BUILD := $(BUILDROOT)/toolchain/acpidump
ZFLAGS := $(HOSTZFLAGS) -I$(ROOT)/system/libs

OBJS=\
$(BUILD)/uefi.o\
$(BUILD)/uefi.s.o\
$(BUILD)/acpidump.o\

default: $(BUILD)/acpidump.efi

$(BUILD)/acpidump.efi: uefi.ld $(OBJS)
	@echo "LD acpidump"
	@$(LD) -T uefi.ld -pie --no-dynamic-linker -Bsymbolic -znocombreloc -nostdlib -o $(BUILD)/acpidump.elf $(OBJS)
	@$(OBJCOPY) -j .text -j .data -j .tls -j .dynamic -j .rela -j .reloc --output-target pei-x86-64 --subsystem=efi-app $(BUILD)/acpidump.elf $(BUILD)/acpidump.efi

$(BUILD)/%.s.o: %.s 
	@echo "AS $<"
	@mkdir -p $(@D)
	@$(AS) -o $@ $^

$(BUILD)/%.o: %.zaa
	@echo "ZZ $<"
	@mkdir -p $(@D)
	@$(ZZ) $(ZFLAGS) -g -c -o $@ $^

clean:
	rm -f $(BUILD)/acpidump.elf $(BUILD)/acpidump.efi $(BUILD)/*.o
