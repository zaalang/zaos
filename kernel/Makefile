.PHONY: default clean

include ../mkspec.mk

BUILD := $(BUILDROOT)/kernel
ZFLAGS += -I$(ROOT)/system/libs

PLATFORM=\
platform/platform.zaa\
platform/x64-efi/boot.s\
platform/x64-efi/exit.zaa\
platform/x64-efi/task.s\
platform/x64-efi/interrupt.s\
platform/x64-efi/syscall.s\
platform/x64-efi/debugcon.s\
platform/x64-efi/sys.zaa\
platform/x64-efi/cpu.zaa\
platform/x64-efi/smp.zaa\
platform/x64-efi/mmu.zaa\
platform/x64-efi/rtc.zaa\
platform/x64-efi/apic.zaa\
platform/x64-efi/task.zaa\
platform/x64-efi/video.zaa\
platform/x64-efi/memory.zaa\
platform/x64-efi/handlers.zaa\
platform/x64-efi/bootinfo.zaa\
platform/x64-efi/x64-efi.zaa\
$(ROOT)/system/libs/efi/efi.zaa\
$(ROOT)/system/libs/acpi/acpi.zaa\

KERNEL=\
kernel.zaa\
cpu.zaa\
sys.zaa\
heap.zaa\
slab.zaa\
vm/vm.zaa\
vm/page.zaa\
vm/space.zaa\
vm/region.zaa\
vm/iovec.zaa\
vm/result.zaa\
mutex.zaa\
semaphore.zaa\
waitqueue.zaa\
thread.zaa\
process.zaa\
scheduler.zaa\
vdso.zaa\
io.zaa\
input.zaa\
result.zaa\
kprint.zaa\
event.zaa\
buffer.zaa\
channel.zaa\
futex.zaa\
vfs/vfs.zaa\
vfs/fs.zaa\
vfs/node.zaa\
vfs/result.zaa\
vfs/fd.zaa\
vfs/stat.zaa\
vfs/notify.zaa\
dev/dev.zaa\
chr/chr.zaa\
chr/chrdev.zaa\
chr/result.zaa\
blk/blk.zaa\
blk/blkdev.zaa\
blk/result.zaa\
blk/request.zaa\
blk/partdev.zaa\
blk/gpt.zaa\
blk/cache.zaa\
support/rc.zaa\
support/json.zaa\
support/lockcell.zaa\
modules/ioapic/ioapic.zaa\
modules/pci/pci.zaa\
modules/msi/msi.zaa\
modules/msix/msix.zaa\
modules/ahci/ahci.zaa\
modules/ahci/satadev.zaa\
modules/nvme/nvme.zaa\
modules/nvme/namespace.zaa\
modules/rootfs/rootfs.zaa\
modules/devfs/devfs.zaa\
modules/ext2fs/ext2fs.zaa\
modules/ext2fs/volume.zaa\
modules/ps2/ps2.zaa\
modules/ps2/mouse.zaa\
modules/ps2/keyboard.zaa\
modules/pty/pty.zaa\
modules/pty/ptm.zaa\
modules/pty/ptmx.zaa\
modules/pty/ptty.zaa\
modules/sysfs/sysfs.zaa\
modules/sysfs/proc.zaa\
modules/video/video.zaa\
modules/console/console.zaa\
modules/cfg/cfg.zaa\
modules/cfg/acpi.zaa\
modules/cfg/acpi/namespace.zaa\
modules/cfg/acpi/registers.zaa\
modules/usb/usb.zaa\
modules/usb/usbdev.zaa\
modules/usb/result.zaa\
modules/usb/transfer.zaa\
modules/usb/xhci/xhci.zaa\
modules/usb/modules/hid/hid.zaa\
modules/usb/modules/hid/hiddev.zaa\
modules/usb/modules/hid/report.zaa\
modules/usb/modules/storage/storage.zaa\
modules/usb/modules/storage/bot.zaa\
modules/usb/modules/storage/botdev.zaa\
modules/usb/modules/storage/uas.zaa\
modules/usb/modules/storage/uasdev.zaa\
modules/usb/modules/hub/hub.zaa\
modules/usb/modules/modules.zaa\
syscalls/syscalls.zaa\
syscalls/thread.zaa\
syscalls/process.zaa\
syscalls/system.zaa\
syscalls/mmap.zaa\
syscalls/ioring.zaa\
syscalls/time.zaa\
syscalls/sched.zaa\
syscalls/kill.zaa\
syscalls/unknown.zaa\
ioring/ioring.zaa\
ioring/workman.zaa\
ioring/open.zaa\
ioring/stat.zaa\
ioring/ioctl.zaa\
ioring/read.zaa\
ioring/write.zaa\
ioring/select.zaa\
ioring/mkdir.zaa\
ioring/rename.zaa\
ioring/link.zaa\
ioring/symlink.zaa\
ioring/chstat.zaa\
ioring/unlink.zaa\
ioring/poll.zaa\
ioring/notify.zaa\
ioring/event.zaa\
ioring/buffer.zaa\
ioring/channel.zaa\
ioring/close.zaa\
ioring/sleep.zaa\
platform/platform.zaa\
platform/x64-efi/cpu.zaa\
platform/x64-efi/mmu.zaa\
platform/x64-efi/rtc.zaa\
platform/x64-efi/apic.zaa\
platform/x64-efi/task.zaa\
platform/x64-efi/bootinfo.zaa\
$(ROOT)/system/libs/elf/elf.zaa\
$(ROOT)/system/libs/elf/hash.zaa\
$(ROOT)/system/libs/elf/image.zaa\
$(ROOT)/system/libs/elf/auxvec.zaa\
$(ROOT)/system/libs/ext2/ext2.zaa\
$(ROOT)/system/libs/acpi/acpi.zaa\

VDSO=\
$(BUILD)/platform/x64-efi/vdso.s.o\

OBJS=\
$(BUILD)/platform/x64-efi/boot.s.o\
$(BUILD)/platform/x64-efi/task.s.o\
$(BUILD)/platform/x64-efi/interrupt.s.o\
$(BUILD)/platform/x64-efi/syscall.s.o\
$(BUILD)/platform/x64-efi/check.s.o\
$(BUILD)/platform/x64-efi/memset.s.o\
$(BUILD)/platform/x64-efi/memcpy.s.o\
$(BUILD)/platform/x64-efi/memmove.s.o\
$(BUILD)/platform/x64-efi/memfind.s.o\
$(BUILD)/platform/x64-efi/debugcon.s.o\
$(BUILD)/platform/x64-efi/trampoline.s.o\
$(BUILD)/platform/x64-efi/x64-efi.zaa.o\
$(BUILD)/kernel.zaa.o\

default: $(BUILD)/kernel.efi

$(BUILD)/kernel.efi: kernel.ld $(OBJS)
	@echo "LD kernel"
	@$(LD) -T kernel.ld -pie --no-dynamic-linker -Bsymbolic -znocombreloc -nostdlib -o $(BUILD)/kernel.elf $(OBJS) 
	@$(OBJCOPY) -j .text -j .data -j .tls -j .dynamic -j .rela -j .reloc --output-target pei-x86-64 --subsystem=efi-app $(BUILD)/kernel.elf $(BUILD)/kernel.efi
	@$(OBJDUMP) -dC -Mintel -S -l $(BUILD)/kernel.elf > $(BUILD)/kernel.asm
	@$(OBJDUMP) -t $(BUILD)/kernel.elf | sed '1,/SYMBOL TABLE/d; s/ .* / /; /^$$/d' > $(BUILD)/kernel.sym

$(BUILD)/%.s.o: %.s 
	@echo "AS $<"
	@mkdir -p $(@D)
	@$(AS) -o $@ $^

$(BUILD)/platform/x64-efi/x64-efi.zaa.o: $(PLATFORM)
	@echo "ZZ platform"
	@mkdir -p $(@D)
	@$(ZZ) $(ZFLAGS) -O3 -g -c -mno-red-zone -fno-stack-protect --features=-sse,-mmx,+soft-float -o $@ platform/x64-efi/x64-efi.zaa

$(BUILD)/vdso.so: vdso.ld $(VDSO)
	@echo "LD vdso"
	@mkdir -p $(@D)
	@$(LD) -T vdso.ld -shared --no-dynamic-linker -nostdlib -o $@ $(VDSO)

$(BUILD)/kernel.zaa.o: $(BUILD)/vdso.so $(KERNEL)
	@echo "ZZ kernel"
	@mkdir -p $(@D)
	@$(ZZ) $(ZFLAGS) -O3 -g -c -mno-red-zone -mprobe-stack --features=-sse,-mmx,+soft-float -I modules -o $@ kernel.zaa

clean:
	rm -f $(BUILD)/kernel.* $(BUILD)/vdso.* $(OBJS) $(VDSO)
