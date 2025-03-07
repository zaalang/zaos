.PHONY: default clean

include ../../mkspec.mk

BUILD := $(BUILDROOT)/system/generated/zidl

IDLS=\
$(BUILD)/zaos_sys.zaa\
$(BUILD)/zaos_winton.zaa\

default: $(IDLS)

.SECONDEXPANSION:
$(BUILD)/%.zaa: $$(subst _,.,%.zidl)
	@echo "ZIDL $<"
	@mkdir -p $(@D)
	@$(ZIDLC) -o $@ $^

clean:
	rm -f $(IDLS)
