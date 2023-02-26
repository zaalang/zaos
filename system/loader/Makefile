.PHONY: default clean

include ../../mkspec.mk

BUILD:=$(BUILDROOT)/system/loader
TARGETZFLAGS+=-I$(ROOT)/system/libs

SRCS=\
loader.zaa\
$(ROOT)/system/libs/elf/elf.zaa\
$(ROOT)/system/libs/elf/hash.zaa\
$(ROOT)/system/libs/elf/image.zaa\
$(ROOT)/system/libs/elf/auxvec.zaa\

OBJS=\
$(BUILD)/loader.zaa.o\
$(BUILD)/start.s.o\

ZRT=$(BUILDROOT)/system/libs/libzrt/libzrt.a
LIBS=-L$(BUILDROOT)/system/libs/libzrt -lzrt

default: $(BUILD)/loader

$(BUILD)/loader: loader.ld $(OBJS) $(ZRT)
	@echo "LD loader"
	@mkdir -p $(@D)
	@$(LD) -T loader.ld -pie --dynamic-linker=/system/lib/loader -nostdlib -o $@ $(OBJS) $(LIBS)

$(BUILD)/%.s.o: %.s 
	@echo "AS $<"
	@mkdir -p $(@D)
	@$(AS) -o $@ $^
	
$(BUILD)/loader.zaa.o: $(SRCS)
	@echo "ZZ $<"
	@mkdir -p $(@D)
	@$(ZZ) $(TARGETZFLAGS) -g -c -fpic -fno-stack-protect -o $@ loader.zaa

clean:
	rm -f $(BUILD)/loader $(OBJS)
