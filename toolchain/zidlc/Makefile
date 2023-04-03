.PHONY: default clean

include ../../mkspec.mk

BUILD:=$(BUILDROOT)/toolchain/zidlc

default: $(BUILD)/zidlc

$(BUILD)/zidlc: zidlc.zaa
	@echo "HOSTZZ $<"
	@mkdir -p $(@D)
	@$(ZZ) $(HOSTZFLAGS) -g -I$(ROOT)/system/libs -lzrt -o $@ $^

clean:
	rm -f $(BUILD)/zidlc $(BUILD)/*.o
