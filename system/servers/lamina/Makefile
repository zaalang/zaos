.PHONY: default clean

include ../../../mkspec.mk

BUILD := $(BUILDROOT)/system/servers/lamina
ZFLAGS += -I$(ROOT)/system/libs -L$(BUILDROOT)/system/libs/libzrt -I$(BUILDROOT)/system/generated
LIBS := -lzrt

default: $(BUILD)/lamina

-include $(BUILD)/lamina.d

$(BUILD)/%: %.zaa
	@echo "ZZ $<"
	@mkdir -p $(@D)
	@$(ZZ) $(ZFLAGS) -g -o $@ $^ $(LIBS)

clean:
	rm -f $(BUILD)/lamina $(BUILD)/*.o $(BUILD)/*.d
