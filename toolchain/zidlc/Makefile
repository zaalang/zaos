.PHONY: default clean

include ../../mkspec.mk

BUILD := $(BUILDROOT)/toolchain/zidlc
ZFLAGS := $(HOSTZFLAGS) -I$(ROOT)/system/libs
LIBS := -lzrt

default: $(BUILD)/zidlc

-include $(BUILD)/zidlc.d

$(BUILD)/%: %.zaa
	@echo "ZZ $<"
	@mkdir -p $(@D)
	@$(ZZ) $(ZFLAGS) -g -o $@ $^ $(LIBS)

clean:
	rm -f $(BUILD)/zidlc $(BUILD)/*.o $(BUILD)/*.d
