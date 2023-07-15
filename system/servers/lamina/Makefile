.PHONY: default clean

include ../../../mkspec.mk

BUILD:=$(BUILDROOT)/system/servers/lamina
TARGETZFLAGS+=-I$(ROOT)/system/libs -L$(BUILDROOT)/system/libs/libzrt -lzrt

SRCS=\
lamina.zaa\
shell.zaa\
desktop.zaa\
$(BUILDROOT)/system/generated/zidl/zaos_sys.zaa\
$(BUILDROOT)/system/generated/zidl/zaos_winton.zaa\

default: $(BUILD)/lamina

$(BUILD)/lamina: $(SRCS)
	@echo "ZZ $<"
	@mkdir -p $(@D)
	@$(ZZ) $(TARGETZFLAGS) -g -fpic -o $@ lamina.zaa

clean:
	rm -f $(BUILD)/lamina $(BUILD)/*.o


