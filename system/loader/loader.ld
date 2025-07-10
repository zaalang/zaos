OUTPUT_FORMAT("elf64-x86-64", "elf64-x86-64", "elf64-x86-64")
OUTPUT_ARCH(i386:x86-64)
ENTRY(_dlstart)

SECTIONS
{
  . = SIZEOF_HEADERS;

  .hash : { *(.hash) }
  .gnu.hash : { *(.gnu.hash) }

  .dynsym : { *(.dynsym) }
  .dynstr : { *(.dynstr) }

  .rela.data : { *(.rela.data*) }
  .rela.rodata : { *(.rela.rodata*) }
  .rela.bss : { *(.rela.bss*) }
  .rela.got : { *(.rela.got) }
  .rela.plt : { *(.rela.plt) }
  .plt : { *(.plt) }

  .text :
  {
    *(.text .text.* .gnu.linkonce.t.*)
  }

  . = ALIGN(4096);

  .data :
  {
    *(.rodata .rodata* .gnu.linkonce.r.*)
    *(.data .data.* .gnu.linkonce.d.*)
    *(.bss .bss.* .gnu.linkonce.b.*)
    *(COMMON)
  }

  .dynamic : { *(.dynamic) }

  .comment 0 : { *(.comment) }

  /DISCARD/ :
  {
    *(.note* .eh_frame)
  }
}
