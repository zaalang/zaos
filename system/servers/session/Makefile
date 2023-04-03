.PHONY: default clean

include ../../../mkspec.mk

BUILD:=$(BUILDROOT)/system/servers/session
TARGETZFLAGS+=-I$(ROOT)/system/libs -L$(BUILDROOT)/system/libs/libzrt -lzrt

SRCS=\
session.zaa\
$(BUILDROOT)/system/generated/zidl/zaos_sys.zaa\

default: $(BUILD)/session

$(BUILD)/session: $(SRCS)
	@echo "ZZ $<"
	@mkdir -p $(@D)
	@$(ZZ) $(TARGETZFLAGS) -g -fpic -o $@ session.zaa

clean:
	rm -f $(BUILD)/session $(BUILD)/*.o

