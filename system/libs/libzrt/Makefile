.PHONY: default clean

include ../../../mkspec.mk

BUILD := $(BUILDROOT)/system/libs/libzrt
ZFLAGS += -I$(ROOT)/system/libs

OBJS=\
$(BUILD)/start.s.o\
$(BUILD)/check.zaa.o\
$(BUILD)/memset.s.o\
$(BUILD)/memcpy.s.o\
$(BUILD)/memmove.s.o\
$(BUILD)/memfind.s.o\
$(BUILD)/fd.zaa.o\
$(BUILD)/mem.zaa.o\
$(BUILD)/clock.zaa.o\
$(BUILD)/env.zaa.o\
$(BUILD)/ceil.zaa.o\
$(BUILD)/floor.zaa.o\
$(BUILD)/trunc.zaa.o\
$(BUILD)/round.zaa.o\
$(BUILD)/fmod.zaa.o\
$(BUILD)/sqrt.zaa.o\
$(BUILD)/frexp.zaa.o\
$(BUILD)/ldexp.zaa.o\
$(BUILD)/stringcmp.zaa.o\
$(BUILD)/exit.zaa.o\

default: $(BUILD)/libzrt.a

$(BUILD)/libzrt.a: $(OBJS)
	@echo "AR libzrt"
	@mkdir -p $(@D)
	@$(AR) rcs $@ $(OBJS) 

$(BUILD)/%.s.o: %.s 
	@echo "AS $<"
	@mkdir -p $(@D)
	@$(AS) -o $@ $^

$(BUILD)/%.zaa.o: %.zaa
	@echo "ZZ $<"
	@mkdir -p $(@D)
	@$(ZZ) $(ZFLAGS) -g -c -fno-stack-protect -o $@ $^

clean:
	rm -f $(BUILD)/libzrt.a $(OBJS)
