.PHONY: default clean

include ../../../mkspec.mk

BUILD:=$(BUILDROOT)/system/servers/init
TARGETZFLAGS+=-I$(ROOT)/system/libs -L$(BUILDROOT)/system/libs/libzrt -lzrt

SRCS=\
init.zaa\
$(BUILDROOT)/system/generated/zidl/zaos_sys.zaa\

default: $(BUILD)/init

$(BUILD)/init: $(SRCS)
	@echo "ZZ $<"
	@mkdir -p $(@D)
	@$(ZZ) $(TARGETZFLAGS) -g -fpic -o $@ init.zaa

clean:
	rm -f $(BUILD)/init $(BUILD)/*.o


