.PHONY: default clean

include ../../../mkspec.mk

BUILD:=$(BUILDROOT)/system/servers/system
TARGETZFLAGS+=-I$(ROOT)/system/libs -L$(BUILDROOT)/system/libs/libzrt -lzrt

SRCS=\
system.zaa\
$(BUILDROOT)/system/generated/zidl/zaos_sys.zaa\

default: $(BUILD)/system

$(BUILD)/system: $(SRCS)
	@echo "ZZ $<"
	@mkdir -p $(@D)
	@$(ZZ) $(TARGETZFLAGS) -g -fpic -o $@ system.zaa

clean:
	rm -f $(BUILD)/system $(BUILD)/*.o


