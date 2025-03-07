.PHONY: default clean

include ../../../mkspec.mk

BUILD := $(BUILDROOT)/system/apps/bar
ZFLAGS += -I$(ROOT)/system/libs -L$(BUILDROOT)/system/libs/libzrt -I$(BUILDROOT)/system/generated
LIBS := -lzrt

default: $(BUILD)/bar

-include $(BUILD)/bar.d

$(BUILD)/%: %.zaa
	@echo "ZZ $<"
	@mkdir -p $(@D)
	@$(ZZ) $(ZFLAGS) -g -o $@ $^ $(LIBS)

clean:
	rm -f $(BUILD)/bar $(BUILD)/*.o $(BUILD)/*.d
