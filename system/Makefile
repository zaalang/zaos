.PHONY: default clean

default:
	@cd libs; $(MAKE)
	@cd loader; $(MAKE)
	@cd servers; $(MAKE)
	@cd apps; $(MAKE)

clean:
	cd libs; $(MAKE) clean
	cd loader; $(MAKE) clean
	cd servers; $(MAKE) clean
	cd apps; $(MAKE) clean
