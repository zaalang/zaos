.PHONY: default clean

include ../../mkspec.mk

BUILD := $(BUILDROOT)/system/generated/zuic

WIDGETS=\
$(BUILD)/std/button.zaa\
$(BUILD)/std/checkbox.zaa\
$(BUILD)/std/slider.zaa\
$(BUILD)/std/spinbox.zaa\
$(BUILD)/std/lineedit.zaa\

default: $(WIDGETS)

$(BUILD)/%.zaa: %.ui
	@echo "UI $<"
	@mkdir -p $(@D)
	@$(ZUIC) -o $@ $^
	
clean:
	rm -f $(WIDGETS)
