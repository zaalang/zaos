.PHONY: default clean

include ../../../mkspec.mk

BUILD:=$(BUILDROOT)/system/apps/bar
TARGETZFLAGS+=-I$(ROOT)/system/libs -L$(BUILDROOT)/system/libs/libzrt -lzrt

SRCS=\
bar.zaa\

default: $(BUILD)/bar

$(BUILD)/bar: $(SRCS)
	@echo "ZZ $<"
	@mkdir -p $(@D)
	@$(ZZ) $(TARGETZFLAGS) -g -fpic -o $@ bar.zaa

clean:
	rm -f $(BUILD)/bar $(BUILD)/*.o
