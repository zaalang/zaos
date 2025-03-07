.PHONY: default clean

include ../../mkspec.mk

BUILD := $(BUILDROOT)/system/loader
ZFLAGS += -I$(ROOT)/system/libs
LDFLAGS := -L$(BUILDROOT)/system/libs/libzrt
LIBS := -lzrt

OBJS=\
$(BUILD)/start.s.o\
$(BUILD)/loader.zaa.o\

default: $(BUILD)/loader

-include $(BUILD)/loader.zaa.d

$(BUILD)/loader: loader.ld $(OBJS)
	@echo "LD loader"
	@mkdir -p $(@D)
	@$(LD) $(LDFLAGS) -T loader.ld -pie --dynamic-linker=/system/lib/loader -nostdlib -o $@ $(OBJS) $(LIBS)

$(BUILD)/%.s.o: %.s 
	@echo "AS $<"
	@mkdir -p $(@D)
	@$(AS) -o $@ $^
	
$(BUILD)/%.zaa.o: %.zaa
	@echo "ZZ $<"
	@mkdir -p $(@D)
	@$(ZZ) $(ZFLAGS) -g -c -fno-stack-protect -o $@ $^

clean:
	rm -f $(BUILD)/loader $(BUILD)/*.o $(BUILD)/*.d
