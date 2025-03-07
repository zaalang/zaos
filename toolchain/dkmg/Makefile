.PHONY: default clean

include ../../mkspec.mk

BUILD := $(BUILDROOT)/toolchain/dkmg
ZFLAGS := $(HOSTZFLAGS) -I$(ROOT)/system/libs
LIBS := -lzrt

default: $(BUILD)/dkmg

-include $(BUILD)/dkmg.d

$(BUILD)/%: %.zaa
	@echo "ZZ $<"
	@mkdir -p $(@D)
	@$(ZZ) $(ZFLAGS) -g -o $@ $^ $(LIBS)

clean:
	rm -f $(BUILD)/dkmg $(BUILD)/*.o $(BUILD)/*.d
