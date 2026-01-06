.PHONY: default clean

include ../../../mkspec.mk

BUILD := $(BUILDROOT)/system/servers/coco
ZFLAGS := ${TARGETZFLAGS} -I$(ROOT)/system/libs -L$(BUILDROOT)/system/libs/libzrt
LIBS := -lzrt

default: $(BUILD)/coco

-include $(BUILD)/coco.d

$(BUILD)/%: %.zaa
	@echo "ZZ $<"
	@mkdir -p $(@D)
	@$(ZZ) $(ZFLAGS) -g -o $@ $^ $(LIBS) 

clean:
	rm -f $(BUILD)/coco $(BUILD)/*.o $(BUILD)/*.d
