.PHONY: default clean

include ../../mkspec.mk

BUILD:=$(BUILDROOT)/toolchain/readelf

default: $(BUILD)/readelf

$(BUILD)/readelf: readelf.zaa
	@echo "HOSTZZ $<"
	@mkdir -p $(@D)
	@$(ZZ) $(HOSTZFLAGS) -g -I$(ROOT)/system/libs -lzrt -o $@ $^

clean:
	rm -f $(BUILD)/readelf $(BUILD)/*.o
