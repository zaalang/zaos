.PHONY: default clean

include ../../../mkspec.mk

BUILD:=$(BUILDROOT)/system/apps/terminal
TARGETZFLAGS+=-I$(ROOT)/system/libs -L$(BUILDROOT)/system/libs/libzrt -lzrt

SRCS=\
main.zaa\
$(BUILDROOT)/system/generated/zidl/zaos_sys.zaa\
$(BUILDROOT)/system/generated/zidl/zaos_winton.zaa\

default: $(BUILD)/terminal

$(BUILD)/terminal: $(SRCS)
	@echo "ZZ $<"
	@mkdir -p $(@D)
	@$(ZZ) $(TARGETZFLAGS) -g -fpic -o $@ main.zaa

clean:
	rm -f $(BUILD)/terminal $(BUILD)/*.o
