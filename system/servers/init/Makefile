.PHONY: default clean

include ../../../mkspec.mk

BUILD := $(BUILDROOT)/system/servers/init
ZFLAGS := ${TARGETZFLAGS} -I$(ROOT)/system/libs -L$(BUILDROOT)/system/libs/libzrt -I$(BUILDROOT)/system/generated
LIBS := -lzrt

default: $(BUILD)/init

-include $(BUILD)/init.d

$(BUILD)/%: %.zaa
	@echo "ZZ $<"
	@mkdir -p $(@D)
	@$(ZZ) $(ZFLAGS) -g -o $@ $^ $(LIBS) 

clean:
	rm -f $(BUILD)/init $(BUILD)/*.o $(BUILD)/*.d
