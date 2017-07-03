BUILD = build/

SOURCE = source/

OBJECTS := $(patsubst $(SOURCE)%.S,$(BUILD)%.o,$(wildcard $(SOURCE)*.S)) $(patsubst $(SOURCE)%.c,$(BUILD)%.o,$(wildcard $(SOURCE)*.c)) $(patsubst $(SOURCE)%.cpp,$(BUILD)%.o,$(wildcard $(SOURCE)*.cpp))

TARGET = output.hex

MCU = atmega328p

CONF = config/avrdude.conf

PORT = /dev/ttyUSB0

MAP = output.map

MAINFILE = main

LD = linkerscripts/$(MCU).ld

all: $(TARGET)

rebuild: all

$(TARGET): $(BUILD)output.elf
	avr-objdump -h -S -D "$(BUILD)output.elf" > "$(MAP)"
	avr-objcopy -R .data  --output-target=ihex $(BUILD)output.elf $@


$(BUILD)output.elf : $(OBJECTS)
	@echo Building target: $@
	avr-ld -o $@ -A $(MCU) -T $(LD) $(OBJECTS)
	@echo Finished building target: $@

$(BUILD)%.o: $(SOURCE)%.S $(BUILD)
	@echo Building file: $<
	avr-as -mmcu=$(MCU) -I "./def" -I "$(SOURCE)" -o $@ "$<"
	avr-objdump -h -S -D $@ > $@.map

$(BUILD)%.o: $(SOURCE)%.c $(BUILD)
		@echo Building file: $<
		avr-gcc -mmcu=$(MCU) -c -Wall -O3 -I "./source/include" -o $@ "$<"
		avr-objdump -h -S -D $@ > $@.map

$(BUILD)%.o: $(SOURCE)%.cpp $(BUILD)
		@echo Building file: $<
		avr-gcc -mmcu=$(MCU) -c -Wall -O3 -I "./source/include" -o $@ "$<"
		avr-objdump -h -S -D $@ > $@.map


$(BUILD):
	mkdir $@

install:
	avrdude -C $(CONF) -v -p $(MCU) -carduino -P $(PORT) -b57600 -D -Uflash:w:$(TARGET):i


clean :
	-rm -rf $(BUILD)
	rm output.hex
	rm output.map
