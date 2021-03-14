
OLED_DRIVER_ENABLE = yes
ENCODER_ENABLE = yes
EXTRAKEY_ENABLE = yes
WPM_ENABLE = yes

#Debug options
VERBOSE = no
CONSOLE_ENABLE = no
COMMAND_ENABLE = no

PIMORONI_TRACKBALL_ENABLE = yes
POINTING_DEVICE_ENABLE = yes
LTO_ENABLE = yes

SPLIT_KEYBOARD = yes
SPLIT_TRANSPORT = custom


# ifeq ($(strip $(PIMORONI_TRACKBALL_ENABLE)), yes)
    SRC += pimoroni_trackball.c
    OPT_DEFS += -DPIMORONI_TRACKBALL_ENABLE
    POINTING_DEVICE_ENABLE := yes
	QUANTUM_LIB_SRC += transport.c serial.c i2c_master.c i2c_slave.c
# QUANTUM_LIB_SRC += transport.c

# QUANTUM_LIB_SRC += $(QUANTUM_DIR)/split_common/transport.c
# Functions added via QUANTUM_LIB_SRC are only included in the final binary if they're called.
# Unused functions are pruned away, which is why we can add multiple drivers here without bloat.
# ifeq ($(PLATFORM),AVR)
#     ifneq ($(NO_I2C),yes)
#         QUANTUM_LIB_SRC += i2c_master.c \
#                             i2c_slave.c
#     endif
# endif

# SERIAL_DRIVER ?= bitbang
# OPT_DEFS += -DSERIAL_DRIVER_$(strip $(shell echo $(SERIAL_DRIVER) | tr '[:lower:]' '[:upper:]'))
# ifeq ($(strip $(SERIAL_DRIVER)), bitbang)
#     QUANTUM_LIB_SRC += serial.c
# else
#     QUANTUM_LIB_SRC += serial_$(strip $(SERIAL_DRIVER)).c
# endif

# endif

ifeq ($(PROMICRO), yes)
  BOOTLOADER = caterina
else ifeq ($(ELITEC), yes)
  BOOTLOADER = atmel-dfu
endif
