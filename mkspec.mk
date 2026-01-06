
mkspec_path := $(abspath $(lastword $(MAKEFILE_LIST)))
mkspec_dir := $(patsubst %/, %, $(dir $(mkspec_path)))

ROOT ?= $(mkspec_dir)
BUILDROOT ?= $(mkspec_dir)/build

AS ?= as
AR ?= ar
LD ?= ld
ZZ ?= $(BUILDROOT)/toolchain/zacc/bin/zacc
HOSTZFLAGS ?= -I$(BUILDROOT)/toolchain/std -L$(BUILDROOT)/toolchain/zrt/lib
TARGETZFLAGS ?= --target=x86_64-unknown-zaos-gnu -I$(BUILDROOT)/toolchain/std
ZIDLC ?= $(BUILDROOT)/toolchain/zidlc/zidlc
ZUIC ?= $(BUILDROOT)/toolchain/zuic/zuic
OBJCOPY ?= objcopy
OBJDUMP ?= objdump
