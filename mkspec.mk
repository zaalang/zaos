
mkspec_path := $(abspath $(lastword $(MAKEFILE_LIST)))
current_dir := $(patsubst %/, %, $(dir $(mkspec_path)))

AS ?= as
AR ?= ar
LD ?= ld
ZZ ?= $(current_dir)/build/toolchain/zacc/bin/zacc
HOSTZFLAGS ?= -I$(current_dir)/build/toolchain/std -L$(current_dir)/build/toolchain/zrt/lib
TARGETZFLAGS ?= --target=x86_64-pc-zaos-gnu -I$(current_dir)/build/toolchain/std
OBJCOPY ?= objcopy
ROOT ?= $(current_dir)
BUILDROOT ?= $(current_dir)/build
