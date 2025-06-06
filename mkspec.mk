
mkspec_path := $(abspath $(lastword $(MAKEFILE_LIST)))
current_dir := $(patsubst %/, %, $(dir $(mkspec_path)))

AS ?= as
AR ?= ar
LD ?= ld
ZZ ?= $(current_dir)/build/toolchain/zacc/bin/zacc
HOSTZFLAGS ?= -I$(current_dir)/build/toolchain/std -L$(current_dir)/build/toolchain/zrt/lib
ZFLAGS ?= --target=x86_64-unknown-zaos-gnu -I$(current_dir)/build/toolchain/std
ZIDLC ?= $(current_dir)/build/toolchain/zidlc/zidlc
OBJCOPY ?= objcopy
OBJDUMP ?= objdump
ROOT ?= $(current_dir)
BUILDROOT ?= $(current_dir)/build
