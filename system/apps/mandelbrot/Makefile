.PHONY: default clean

include ../../../mkspec.mk

BUILD := $(BUILDROOT)/system/apps/mandelbrot
ZFLAGS := ${TARGETZFLAGS} -I$(ROOT)/system/libs -L$(BUILDROOT)/system/libs/libzrt
LIBS := -lzrt

default: $(BUILD)/mandelbrot

-include $(BUILD)/mandelbrot.d

$(BUILD)/%: %.zaa
	@echo "ZZ $<"
	@mkdir -p $(@D)
	@$(ZZ) $(ZFLAGS) -g -o $@ $^ $(LIBS)

clean:
	rm -f $(BUILD)/mandelbrot $(BUILD)/*.o $(BUILD)/*.d
