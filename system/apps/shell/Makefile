.PHONY: default clean

include ../../../mkspec.mk

BUILD:=$(BUILDROOT)/system/apps/shell
TARGETZFLAGS+=-I$(ROOT)/system/libs -L$(BUILDROOT)/system/libs/libzrt -lzrt

SRCS=\
main.zaa\
ast.zaa\
lexer.zaa\
parser.zaa\
value.zaa\
engine.zaa\
command.zaa\
pipeline.zaa\

default: $(BUILD)/shell

$(BUILD)/shell: $(SRCS)
	@echo "ZZ $<"
	@mkdir -p $(@D)
	@$(ZZ) $(TARGETZFLAGS) -g -fpic -o $@ main.zaa

clean:
	rm -f $(BUILD)/shell $(BUILD)/*.o
