.PHONY: default clean

include ../../../mkspec.mk

BUILD:=$(BUILDROOT)/system/servers/systemd
TARGETZFLAGS+=-I$(ROOT)/system/libs

SRCS=\
systemd.zaa\

OBJS=\
$(BUILD)/systemd.zaa.o\

ZRT=$(BUILDROOT)/system/libs/libzrt/libzrt.a
LIBS=-L$(BUILDROOT)/system/libs/libzrt -lzrt

default: $(BUILD)/systemd

$(BUILD)/systemd: $(OBJS) $(ZRT)
	@echo "LD systemd"
	@mkdir -p $(@D)
	@$(LD) -pie --dynamic-linker=/system/lib/loader -nostdlib -o $@ $(OBJS) $(LIBS)

$(BUILD)/%.s.o: %.s 
	@echo "AS $<"
	@mkdir -p $(@D)
	@$(AS) -o $@ $^
	
$(BUILD)/systemd.zaa.o: $(SRCS)
	@echo "ZZ $<"
	@mkdir -p $(@D)
	@$(ZZ) $(TARGETZFLAGS) -g -c -fpic -o $@ systemd.zaa

clean:
	rm -f $(BUILD)/systemd $(OBJS)
