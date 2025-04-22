.PHONY: default clean

include ../../../mkspec.mk

BUILD := $(BUILDROOT)/system/servers/test
ZFLAGS += -I$(ROOT)/system/libs -L$(BUILDROOT)/system/libs/libzrt -I$(BUILDROOT)/system/generated
LIBS := -lzrt

default: $(BUILD)/test

-include $(BUILD)/test.d

$(BUILD)/%: %.zaa
	@echo "ZZ $<"
	@mkdir -p $(@D)
	@$(ZZ) $(ZFLAGS) -g -o $@ $^ $(LIBS) 

clean:
	rm -f $(BUILD)/test $(BUILD)/*.o $(BUILD)/*.d
