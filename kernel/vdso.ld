OUTPUT_FORMAT("elf64-x86-64", "elf64-x86-64", "elf64-x86-64")
OUTPUT_ARCH(i386:x86-64)

PHDRS
{
  data PT_LOAD FLAGS(4) FILEHDR PHDRS;
  text PT_LOAD FLAGS(5);
  dynamic PT_DYNAMIC FLAGS(4);
}

SECTIONS
{
  . = SIZEOF_HEADERS;

  .hash : { *(.hash) } :data
  .gnu.hash : { *(.gnu.hash) } :data

  .dynsym : { *(.dynsym) } :data
  .dynstr : { *(.dynstr) } :data
  .dynamic : { *(.dynamic) } :data :dynamic

  .rodata : { *(.rodata*) . = ALIGN(4096); } :data = 0x00000000
  .text : { *(.text*) . = ALIGN(4096); } :text = 0x90909090

  .data : { *(.data*) *(.sdata*) *(.bss*) *(.sbss*) }
  ASSERT(SIZEOF(.data) == 0, "writable data sections!")

  .comment 0 : { *(.comment) }

  /DISCARD/ :
  {
    *(.note* .eh_frame)
  }
}
