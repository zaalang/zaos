.PHONY: default clean

include ../mkspec.mk

default:
	@echo "PULL zrt"
	@if [ -d ${BUILDROOT}/toolchain/zrt ]; then cd ${BUILDROOT}/toolchain/zrt && git pull; else git clone https://github.com/zaalang/zrt.git ${BUILDROOT}/toolchain/zrt; fi
	@echo "PULL zacc"
	@if [ -d ${BUILDROOT}/toolchain/zacc ]; then cd ${BUILDROOT}/toolchain/zacc && git pull; else git clone https://github.com/zaalang/zacc.git ${BUILDROOT}/toolchain/zacc; fi
	@echo "PULL std"
	@if [ -d ${BUILDROOT}/toolchain/std ]; then cd ${BUILDROOT}/toolchain/std && git pull; else git clone https://github.com/zaalang/std.git ${BUILDROOT}/toolchain/std; fi
	
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
