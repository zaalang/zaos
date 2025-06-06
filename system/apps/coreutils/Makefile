.PHONY: default clean

include ../../../mkspec.mk

BUILD := $(BUILDROOT)/system/apps/coreutils
ZFLAGS += -I$(ROOT)/system/libs -L$(BUILDROOT)/system/libs/libzrt -I$(BUILDROOT)/system/generated
LIBS := -lzrt

BINS=\
$(BUILD)/basename\
$(BUILD)/cat\
$(BUILD)/chgrp\
$(BUILD)/chown\
$(BUILD)/chmod\
$(BUILD)/cp\
$(BUILD)/cut\
$(BUILD)/date\
$(BUILD)/dd\
$(BUILD)/df\
$(BUILD)/dirname\
$(BUILD)/du\
$(BUILD)/echo\
$(BUILD)/ls\
$(BUILD)/mkdir\
$(BUILD)/touch\
$(BUILD)/rm\
$(BUILD)/mv\

default: $(BINS)

-include $(BINS:=.d)

$(BUILD)/%: %.zaa
	@echo "ZZ $<"
	@mkdir -p $(@D)
	@$(ZZ) $(ZFLAGS) -g -o $@ $^ $(LIBS)

clean:
	rm -f $(BINS) $(BUILD)/*.o $(BUILD)/*.d
