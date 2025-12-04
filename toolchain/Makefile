.PHONY: default clean

include ../mkspec.mk

default:
	@echo "PULL zrt"
	@if cd ${BUILDROOT}/toolchain/zrt &>/dev/null; then git pull; else git clone https://github.com/zaalang/zrt.git ${BUILDROOT}/toolchain/zrt; fi
	@echo "PULL zacc"
	@if cd ${BUILDROOT}/toolchain/zacc &>/dev/null; then git pull; else git clone https://github.com/zaalang/zacc.git ${BUILDROOT}/toolchain/zacc; fi
	@echo "PULL std"
	@if cd ${BUILDROOT}/toolchain/std &>/dev/null; then git pull; else git clone https://github.com/zaalang/std.git ${BUILDROOT}/toolchain/std; fi
	
	@echo "MAKE zrt"
	@mkdir -p ${BUILDROOT}/toolchain/zrt/build
	@cd ${BUILDROOT}/toolchain/zrt/build; cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo ..; cmake --build . --target install
	
	@echo "MAKE zacc"
	@mkdir -p ${BUILDROOT}/toolchain/zacc/build
	@cd ${BUILDROOT}/toolchain/zacc/build; cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo ..; cmake --build . --target install
	
	@cd dkmg; $(MAKE)
	@cd readelf; $(MAKE)
	@cd acpidump; $(MAKE)
	@cd zidlc; $(MAKE)
	@cd zuic; $(MAKE)

clean:
	cd dkmg; $(MAKE) clean
	cd readelf; $(MAKE) clean
	cd acpidump; $(MAKE) clean
	cd zidlc; $(MAKE) clean
	cd zuic; $(MAKE) clean	
	cd ${BUILDROOT}/toolchain/zrt/build; cmake --build . --target clean
	cd ${BUILDROOT}/toolchain/zacc/build; cmake --build . --target clean
