OUTPUT_FORMAT("elf64-x86-64", "elf64-x86-64", "elf64-x86-64")
OUTPUT_ARCH(i386:x86-64)
ENTRY(_start)

SECTIONS
{
  _BASE = .;

  .hash : { *(.hash) }
  .gnu.hash : { *(.gnu.hash) }

  . = 0x1000;

  .text :
  {
    _text = .;
    *(.text .text.* .gnu.linkonce.t.*)
    *(.plt .plt.*)
    . = ALIGN(16);
    text_ = .;
  }

  . = ALIGN(4096);

  .data :
  {
    _data = .;
    *(.rodata .rodata* .gnu.linkonce.r.*)
    *(.data .data.* .gnu.linkonce.d.*)
    *(.bss .bss.* .gnu.linkonce.b.*)
    *(.got.plt)
    *(COMMON)
    data_ = .;
  }

  BASE_ = .;

  . = ALIGN(4096);

  .tls (NOLOAD) : ALIGN(64)
  {
    _tls = .;
    *(.tdata .tdata.*)
    *(.tbss .tbss.*)
    . = ALIGN(64);
    tls_ = .;
  }

  . = ALIGN(4096);

  .reloc :
  {
    LONG(0)
    LONG(8)
    *(.reloc)
  }

  .rela :
  {
    *(.rela.*)
  }

  .dynamic : { *(.dynamic) }

  .comment 0 : { *(.comment) }

  /DISCARD/ :
  {
    *(.note .eh_frame)
  }
}
