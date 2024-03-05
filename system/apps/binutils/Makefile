.PHONY: default clean

include ../../../mkspec.mk

BUILD:=$(BUILDROOT)/system/apps/binutils
TARGETZFLAGS+=-I$(ROOT)/system/libs -L$(BUILDROOT)/system/libs/libzrt -lzrt

BINS=\
$(BUILD)/ls\
$(BUILD)/cat\

default: $(BINS)

$(BUILD)/%: %.zaa
	@echo "ZZ $<"
	@mkdir -p $(@D)
	@$(ZZ) $(TARGETZFLAGS) -g -fpic -o $@ $^

clean:
	rm -f $(BINS) $(BUILD)/*.o
