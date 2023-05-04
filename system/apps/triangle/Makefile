.PHONY: default clean

include ../../../mkspec.mk

BUILD:=$(BUILDROOT)/system/apps/triangle
TARGETZFLAGS+=-I$(ROOT)/system/libs -L$(BUILDROOT)/system/libs/libzrt -lzrt

SRCS=\
triangle.zaa\

default: $(BUILD)/triangle

$(BUILD)/triangle: $(SRCS)
	@echo "ZZ $<"
	@mkdir -p $(@D)
	@$(ZZ) $(TARGETZFLAGS) -g -fpic -o $@ triangle.zaa

clean:
	rm -f $(BUILD)/triangle $(BUILD)/*.o
