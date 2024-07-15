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
    *(.text)
    *(.plt)
    . = ALIGN(16);
    text_ = .;
  }

  . = ALIGN(4096);

  .data :
  {
    _data = .;
    *(.rodata*)
    *(.data*)
    *(.bss)
    *(.got.plt)
    *(COMMON)
    data_ = .;
  }

  BASE_ = .;

  . = ALIGN(4096);

  .tls (NOLOAD) : ALIGN(64)
  {
    _tls = .;
    *(.tdata)
    *(.tbss)
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
    *(.rela.data*)
    *(.rela.rodata*)
    *(.rela.bss*)
    *(.rela.got)
    *(.rela.plt)
  }

  .dynamic : { *(.dynamic) }

  .comment 0 : { *(.comment) }

  /DISCARD/ :
  {
    *(.note* .eh_frame)
  }
}
