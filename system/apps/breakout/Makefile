.PHONY: default clean

include ../../../mkspec.mk

BUILD := $(BUILDROOT)/system/apps/breakout
ZFLAGS := ${TARGETZFLAGS} -I$(ROOT)/system/libs -L$(BUILDROOT)/system/libs/libzrt
LIBS := -lzrt

default: $(BUILD)/breakout

-include $(BUILD)/breakout.d

$(BUILD)/%: %.zaa
	@echo "ZZ $<"
	@mkdir -p $(@D)
	@$(ZZ) $(ZFLAGS) -g -o $@ $^ $(LIBS)

clean:
	rm -f $(BUILD)/breakout $(BUILD)/*.o $(BUILD)/*.d
