.PHONY: default clean

include ../../../mkspec.mk

BUILD := $(BUILDROOT)/system/apps/baz
ZFLAGS += -I$(ROOT)/system/libs -L$(BUILDROOT)/system/libs/libzrt -I$(BUILDROOT)/system/generated
LIBS := -lzrt

default: $(BUILD)/baz

-include $(BUILD)/baz.d

$(BUILD)/%: %.zaa
	@echo "ZZ $<"
	@mkdir -p $(@D)
	@$(ZZ) $(ZFLAGS) -g -o $@ $^ $(LIBS)

clean:
	rm -f $(BUILD)/baz $(BUILD)/*.o $(BUILD)/*.d
