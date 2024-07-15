.PHONY: default clean

include ../../mkspec.mk

BUILD:=$(BUILDROOT)/toolchain/acpidump

default: $(BUILD)/acpidump.efi

$(BUILD)/%.s.o: %.s 
	@echo "AS $<"
	@mkdir -p $(@D)
	@$(AS) -o $@ $^

$(BUILD)/%.o: %.zaa
	@echo "ZZ $<"
	@mkdir -p $(@D)
	@$(ZZ) $(HOSTZFLAGS) -g -c -fpic -I$(ROOT)/system/libs -o $@ $^

$(BUILD)/acpidump.efi: $(BUILD)/uefi.s.o $(BUILD)/uefi.o $(BUILD)/acpidump.o
	@echo "LD acpidump"
	@$(LD) -T uefi.ld -pie --no-dynamic-linker -Bsymbolic -znocombreloc -nostdlib -o $(BUILD)/acpidump.elf $^
	@$(OBJCOPY) -j .text -j .data -j .tls -j .dynamic -j .rela -j .reloc --output-target pei-x86-64 --subsystem=efi-app $(BUILD)/acpidump.elf $(BUILD)/acpidump.efi

clean:
	rm -f $(BUILD)/acpidump.elf $(BUILD)/acpidump.efi $(BUILD)/*.o
