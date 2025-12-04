.PHONY: default clean

include ../../mkspec.mk

BUILD := $(BUILDROOT)/system/generated/zidl

IDLS=\
$(BUILD)/zaos/sys.zaa\
$(BUILD)/zaos/winton.zaa\

default: $(IDLS)

.SECONDEXPANSION:
$(BUILD)/%.zaa: $$(subst /,.,%.zidl)
	@echo "ZIDL $<"
	@mkdir -p $(@D)
	@$(ZIDLC) -o $@ $^

clean:
	rm -f $(IDLS)
