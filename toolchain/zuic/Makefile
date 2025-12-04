.PHONY: default clean

include ../../mkspec.mk

BUILD := $(BUILDROOT)/toolchain/zuic
ZFLAGS := $(HOSTZFLAGS) -I$(ROOT)/system/libs
LIBS := -lzrt

default: $(BUILD)/zuic

-include $(BUILD)/zuic.d

$(BUILD)/%: %.zaa
	@echo "ZZ $<"
	@mkdir -p $(@D)
	@$(ZZ) $(ZFLAGS) -g -o $@ $^ $(LIBS)

clean:
	rm -f $(BUILD)/zuic $(BUILD)/*.o $(BUILD)/*.d 
