.PHONY: default clean

include ../../../mkspec.mk

BUILD:=$(BUILDROOT)/system/apps/baz
TARGETZFLAGS+=-I$(ROOT)/system/libs -L$(BUILDROOT)/system/libs/libzrt -lzrt

SRCS=\
baz.zaa\

default: $(BUILD)/baz

$(BUILD)/baz: $(SRCS)
	@echo "ZZ $<"
	@mkdir -p $(@D)
	@$(ZZ) $(TARGETZFLAGS) -g -fpic -o $@ baz.zaa

clean:
	rm -f $(BUILD)/baz $(BUILD)/*.o
