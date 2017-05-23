MEMORY
{
    ROM (rx) : ORIGIN = 0, LENGTH = 0x3FFF
}

MEMORY
{
    RAM (wr) : ORIGIN = 0, LENGTH = 0xFF
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
