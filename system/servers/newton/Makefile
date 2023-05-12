.PHONY: default clean

include ../../../mkspec.mk

BUILD:=$(BUILDROOT)/system/servers/newton
TARGETZFLAGS+=-I$(ROOT)/system/libs -L$(BUILDROOT)/system/libs/libzrt -lzrt

SRCS=\
newton.zaa\
shell.zaa\
desktop.zaa\
$(BUILDROOT)/system/generated/zidl/zaos_sys.zaa\
$(BUILDROOT)/system/generated/zidl/zaos_winton.zaa\

default: $(BUILD)/newton

$(BUILD)/newton: $(SRCS)
	@echo "ZZ $<"
	@mkdir -p $(@D)
	@$(ZZ) $(TARGETZFLAGS) -g -fpic -o $@ newton.zaa

clean:
	rm -f $(BUILD)/newton $(BUILD)/*.o


