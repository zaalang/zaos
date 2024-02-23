.PHONY: default clean

include ../../../mkspec.mk

BUILD:=$(BUILDROOT)/system/apps/binutils
TARGETZFLAGS+=-I$(ROOT)/system/libs -L$(BUILDROOT)/system/libs/libzrt -lzrt

default: $(BUILD)/ls

$(BUILD)/ls: ls.zaa
	@echo "ZZ $<"
	@mkdir -p $(@D)
	@$(ZZ) $(TARGETZFLAGS) -g -fpic -o $@ ls.zaa

clean:
	rm -f $(BUILD)/ls $(BUILD)/*.o
