.PHONY: default clean

include ../../../mkspec.mk

BUILD:=$(BUILDROOT)/system/servers/coco
TARGETZFLAGS+=-I$(ROOT)/system/libs -L$(BUILDROOT)/system/libs/libzrt -lzrt

SRCS=\
coco.zaa\
font.zaa\
display.zaa\
terminal.zaa\
pty.zaa\
env.zaa\
tab.zaa\
pwd.zaa\
ls.zaa\
cd.zaa\
cat.zaa\
stat.zaa\
cp.zaa\
mkdir.zaa\
rename.zaa\
symlink.zaa\
rm.zaa\
ps.zaa\
start.zaa\
$(ROOT)/system/libs/input/driver.zaa\
$(ROOT)/system/libs/input/keymap.zaa\
$(ROOT)/system/libs/vt/result.zaa\
$(ROOT)/system/libs/vt/screen.zaa\
$(ROOT)/system/libs/vt/vt.zaa\
$(ROOT)/system/libs/vt/vte.zaa\
unifont-14.0.03.hex\

default: $(BUILD)/coco

$(BUILD)/coco: $(SRCS) 
	@echo "ZZ $<"
	@mkdir -p $(@D)
	@$(ZZ) $(TARGETZFLAGS) -g -fpic -o $@ coco.zaa

clean:
	rm -f $(BUILD)/coco $(BUILD)/*.o
