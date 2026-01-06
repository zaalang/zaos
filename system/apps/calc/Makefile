.PHONY: default clean

include ../../../mkspec.mk

BUILD := $(BUILDROOT)/system/apps/calc
ZFLAGS := ${TARGETZFLAGS} -I$(ROOT)/system/libs -L$(BUILDROOT)/system/libs/libzrt -I$(BUILDROOT)/system/generated -I$(BUILD)/generated 
LIBS := -lzrt

default: $(BUILD)/calc

-include $(BUILD)/calc.d

$(BUILD)/generated/zuic/%.zaa: %.ui
	@echo "UI $<"
	@mkdir -p $(@D)
	@$(ZUIC) -I$(ROOT)/system/widgets -o $@ $^

$(BUILD)/%: %.zaa $(BUILD)/generated/zuic/calc.zaa 
	@echo "ZZ $<"
	@mkdir -p $(@D)
	@$(ZZ) $(ZFLAGS) -g -o $@ $^ $(LIBS)

clean:
	rm -f $(BUILD)/calc $(BUILD)/*.o $(BUILD)/*.d $(BUILD)/generated/zuic/*
