.PHONY: default clean

default:
	@cd idl; $(MAKE)
	@cd libs; $(MAKE)
	@cd widgets; $(MAKE)
	@cd loader; $(MAKE)
	@cd servers; $(MAKE)
	@cd apps; $(MAKE)

clean:
	cd idl; $(MAKE) clean
	cd libs; $(MAKE) clean
	cd widgets; $(MAKE) clean
	cd loader; $(MAKE) clean
	cd servers; $(MAKE) clean
	cd apps; $(MAKE) clean
