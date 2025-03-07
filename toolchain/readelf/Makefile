.PHONY: default clean

include ../../mkspec.mk

BUILD := $(BUILDROOT)/toolchain/readelf
ZFLAGS := $(HOSTZFLAGS) -I$(ROOT)/system/libs
LIBS := -lzrt

default: $(BUILD)/readelf

-include $(BUILD)/readelf.d

$(BUILD)/%: %.zaa
	@echo "ZZ $<"
	@mkdir -p $(@D)
	@$(ZZ) $(ZFLAGS) -g -o $@ $^ $(LIBS)

clean:
	rm -f $(BUILD)/readelf $(BUILD)/*.o $(BUILD)/*.d
