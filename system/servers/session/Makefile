.PHONY: default clean

include ../../../mkspec.mk

BUILD := $(BUILDROOT)/system/servers/session
ZFLAGS += -I$(ROOT)/system/libs -L$(BUILDROOT)/system/libs/libzrt -I$(BUILDROOT)/system/generated
LIBS := -lzrt

default: $(BUILD)/session

-include $(BUILD)/session.d

$(BUILD)/%: %.zaa
	@echo "ZZ $<"
	@mkdir -p $(@D)
	@$(ZZ) $(ZFLAGS) -g -o $@ $^ $(LIBS)

clean:
	rm -f $(BUILD)/session $(BUILD)/*.o $(BUILD)/*.d
