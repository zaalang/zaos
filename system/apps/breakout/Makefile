.PHONY: default clean

include ../../../mkspec.mk

BUILD:=$(BUILDROOT)/system/apps/breakout
TARGETZFLAGS+=-I$(ROOT)/system/libs -L$(BUILDROOT)/system/libs/libzrt -lzrt

SRCS=\
breakout.zaa\

default: $(BUILD)/breakout

$(BUILD)/breakout: $(SRCS)
	@echo "ZZ $<"
	@mkdir -p $(@D)
	@$(ZZ) $(TARGETZFLAGS) -g -fpic -o $@ breakout.zaa

clean:
	rm -f $(BUILD)/breakout $(BUILD)/*.o
