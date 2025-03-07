.PHONY: default clean

include ../../../mkspec.mk

BUILD := $(BUILDROOT)/system/apps/mandlebrot
ZFLAGS += -I$(ROOT)/system/libs -L$(BUILDROOT)/system/libs/libzrt
LIBS := -lzrt

default: $(BUILD)/mandlebrot

-include $(BUILD)/mandlebrot.d

$(BUILD)/%: %.zaa
	@echo "ZZ $<"
	@mkdir -p $(@D)
	@$(ZZ) $(ZFLAGS) -g -o $@ $^ $(LIBS)

clean:
	rm -f $(BUILD)/mandlebrot $(BUILD)/*.o $(BUILD)/*.d
