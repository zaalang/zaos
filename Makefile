.PHONY: default kernel system toolchain image clean distclean

include ./mkspec.mk

TOOLCHAIN := 20250606

default:
ifneq ($(file < $(BUILDROOT)/toolchain/version), $(TOOLCHAIN))
	@$(MAKE) toolchain
endif
	@$(MAKE) image

kernel: 
	@cd kernel; $(MAKE)

system: 
	@cd system; $(MAKE)

toolchain: 
	@cd toolchain; $(MAKE)
	@ln -sf ../bin/launch $(BUILDROOT)/launch
	@echo $(TOOLCHAIN) > $(BUILDROOT)/toolchain/version

image: kernel system
	@echo "DKMG image.img"
	@bin/mkimg image.yaml $(BUILDROOT)

clean:
	cd kernel; $(MAKE) clean
	cd system; $(MAKE) clean

distclean: clean
	cd toolchain; $(MAKE) clean
	rm -f $(BUILDROOT)/toolchain/version
