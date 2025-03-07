.PHONY: default clean

include ../../../mkspec.mk

BUILD := $(BUILDROOT)/system/apps/terminal
ZFLAGS += -I$(ROOT)/system/libs -L$(BUILDROOT)/system/libs/libzrt -I$(BUILDROOT)/system/generated 
LIBS := -lzrt

default: $(BUILD)/terminal

-include $(BUILD)/terminal.d

$(BUILD)/%: %.zaa
	@echo "ZZ $<"
	@mkdir -p $(@D)
	@$(ZZ) $(ZFLAGS) -g -o $@ $^ $(LIBS)

clean:
	rm -f $(BUILD)/terminal $(BUILD)/*.o $(BUILD)/*.d
