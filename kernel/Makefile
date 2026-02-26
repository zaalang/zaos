.PHONY: default clean

include ../mkspec.mk

BUILD := $(BUILDROOT)/kernel
ZFLAGS := ${TARGETZFLAGS} -I$(ROOT)/system/libs

VDSO=\
$(BUILD)/platform/x64-efi/vdso.s.o\

OBJS=\
$(BUILD)/platform/x64-efi/boot.s.o\
$(BUILD)/platform/x64-efi/task.s.o\
$(BUILD)/platform/x64-efi/interrupt.s.o\
$(BUILD)/platform/x64-efi/syscall.s.o\
$(BUILD)/platform/x64-efi/check.s.o\
$(BUILD)/platform/x64-efi/memset.s.o\
$(BUILD)/platform/x64-efi/memcpy.s.o\
$(BUILD)/platform/x64-efi/memmove.s.o\
$(BUILD)/platform/x64-efi/memfind.s.o\
$(BUILD)/platform/x64-efi/debugcon.s.o\
$(BUILD)/platform/x64-efi/trampoline.s.o\
$(BUILD)/platform/x64-efi/x64-efi.zaa.o\
$(BUILD)/kernel.zaa.o\

default: $(BUILD)/kernel.efi

-include $(BUILD)/platform/x64-efi/x64-efi.zaa.d
-include $(BUILD)/kernel.zaa.d

$(BUILD)/kernel.efi: kernel.ld $(OBJS)
	@echo "LD kernel"
	@$(LD) -T kernel.ld -pie --no-dynamic-linker -Bsymbolic -znocombreloc -nostdlib -o $(BUILD)/kernel.elf $(OBJS) 
	@$(OBJCOPY) -j .text -j .data -j .tls -j .dynamic -j .rela -j .reloc --output-target pei-x86-64 --subsystem=efi-app $(BUILD)/kernel.elf $(BUILD)/kernel.efi
	@$(OBJDUMP) -dC -Mintel -S -l $(BUILD)/kernel.elf > $(BUILD)/kernel.asm
	@$(OBJDUMP) -t $(BUILD)/kernel.elf | sed '1,/SYMBOL TABLE/d; s/ .* / /; /^$$/d' > $(BUILD)/kernel.sym

$(BUILD)/%.s.o: %.s 
	@echo "AS $<"
	@mkdir -p $(@D)
	@$(AS) -o $@ $^

$(BUILD)/platform/x64-efi/x64-efi.zaa.o: platform/x64-efi/x64-efi.zaa
	@echo "ZZ platform"
	@mkdir -p $(@D)
	@$(ZZ) $(ZFLAGS) -O3 -g -c -mno-red-zone -fno-stack-protect --features=-sse,-mmx,+soft-float -o $@ platform/x64-efi/x64-efi.zaa

$(BUILD)/vdso.so: vdso.ld $(VDSO)
	@echo "LD vdso"
	@mkdir -p $(@D)
	@$(LD) -T vdso.ld -shared --no-dynamic-linker -nostdlib -o $@ $(VDSO)

$(BUILD)/kernel.zaa.o: $(BUILD)/vdso.so kernel.zaa
	@echo "ZZ kernel"
	@mkdir -p $(@D)
	@$(ZZ) $(ZFLAGS) -O3 -g -c -mno-red-zone -mprobe-stack --features=-sse,-mmx,+soft-float -I modules -o $@ kernel.zaa

clean:
	rm -f $(BUILD)/kernel.* $(BUILD)/vdso.* $(OBJS) $(VDSO)
