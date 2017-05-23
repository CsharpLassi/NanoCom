MEMORY
{
    ROM (rx) : ORIGIN = 0, LENGTH = 0x3FFF
    RAM (wr) : ORIGIN = 0x800100, LENGTH = 0xFF
}


SECTIONS
{
  .text :
  {
    *(.init0)
    *(.init1)
    *(.text)
  } > ROM

  .rodata :
  {
    *(.rodata)
    *(.rodata.*)
  } > ROM

  .comment :
  {
    *(.comment)
  } > ROM


}

SECTIONS
{
  .data :
  {
    *(.data)
  } > RAM
}
