MEMORY
{
    ROM (rx) : ORIGIN = 0, LENGTH = 0x3FFF
    RAM (wr) : ORIGIN = 0x800100, LENGTH = 0xFF
}


SECTIONS
{
  .init :
  {
    *(.init0)
    *(.init1)
  } > ROM
  .text :
  {
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
  }


}

SECTIONS
{
  .data :
  {
    *(.data)
  } > RAM
}
