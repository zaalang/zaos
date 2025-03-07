.PHONY: default clean

include ../../../mkspec.mk

BUILD := $(BUILDROOT)/system/apps/triangle
ZFLAGS += -I$(ROOT)/system/libs -L$(BUILDROOT)/system/libs/libzrt -I$(BUILDROOT)/system/generated
LIBS := -lzrt

default: $(BUILD)/triangle

-include $(BUILD)/triangle.d

$(BUILD)/%: %.zaa
	@echo "ZZ $<"
	@mkdir -p $(@D)
	@$(ZZ) $(ZFLAGS) -g -o $@ $^ $(LIBS)

clean:
	rm -f $(BUILD)/triangle $(BUILD)/*.o $(BUILD)/*.d
