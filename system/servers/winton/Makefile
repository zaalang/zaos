.PHONY: default clean

include ../../../mkspec.mk

BUILD:=$(BUILDROOT)/system/servers/winton
TARGETZFLAGS+=-I$(ROOT)/system/libs -L$(BUILDROOT)/system/libs/libzrt -lzrt

SRCS=\
winton.zaa\
seat.zaa\
display.zaa\
compositor.zaa\
scene.zaa\
theme.zaa\
math.zaa\
$(BUILDROOT)/system/generated/zidl/zaos_sys.zaa\
$(BUILDROOT)/system/generated/zidl/zaos_winton.zaa\

default: $(BUILD)/winton

$(BUILD)/winton: $(SRCS)
	@echo "ZZ $<"
	@mkdir -p $(@D)
	@$(ZZ) $(TARGETZFLAGS) -g -fpic -o $@ winton.zaa

clean:
	rm -f $(BUILD)/winton $(BUILD)/*.o


