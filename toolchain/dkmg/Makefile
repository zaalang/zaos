.PHONY: default clean

include ../../mkspec.mk

BUILD:=$(BUILDROOT)/toolchain/dkmg

SRCS=\
dkmg.zaa\
$(ROOT)/system/libs/gpt/gpt.zaa\
$(ROOT)/system/libs/gpt/image.zaa\
$(ROOT)/system/libs/fat/fat.zaa\
$(ROOT)/system/libs/fat/image.zaa\
$(ROOT)/system/libs/ext2/ext2.zaa\
$(ROOT)/system/libs/ext2/image.zaa\

default: $(BUILD)/dkmg

$(BUILD)/dkmg: $(SRCS)
	@echo "HOSTZZ $<"
	@mkdir -p $(@D)
	@$(ZZ) $(HOSTZFLAGS) -g -I$(ROOT)/system/libs -lzrt -o $@ $^

clean:
	rm -f $(BUILD)/dkmg $(BUILD)/*.o
