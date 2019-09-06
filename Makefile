# OPENCM3_DIR - duh
# PROJECT - will be the basename of the output elf, eg usb-gadget0-stm32f4disco
# CFILES - basenames only, eg main.c blah.c
# DEVICE - the full device name, eg stm32f405ret6
#  _or_
# LDSCRIPT - full path, eg ../../examples/stm32/f4/stm32f4-discovery/stm32f4-discovery.ld
# OPENCM3_LIB - the basename, eg: opencm3_stm32f1
# OPENCM3_DEFS - the target define eg: -DSTM32F1
# ARCH_FLAGS - eg, -mthumb -mcpu=cortex-m3 -msoft-float -mfix-cortex-m3-ldrd 
#    (ie, the full set of cpu arch flags, _none_ are defined in this file)


PROJECT = epd_demo
BUILD_DIR = bin

SOURCE_PATH = ./src
PROJECT_SRCS := $(shell find $(SOURCE_PATH) -name '*.c')
INCLUDES += $(patsubst %,-I%, . $(SOURCE_PATH))

SHARED_DIR = ./shared
# AFILES += api-asm.S

CFILES += $(PROJECT_SRCS)

# TODO - you will need to edit these two lines!
# define device will generates LDSCRIPT, OPENCM3_LIB, OPENCM3_DEFS and ARCH_FLAGS options
DEVICE = stm32f103rct6
OOCD_FILE = board/stm32f4discovery.cfg

VPATH += $(SHARED_DIR)
INCLUDES += $(patsubst %,-I%, . $(SHARED_DIR))
OPENCM3_DIR=./libopencm3

include $(OPENCM3_DIR)/mk/genlink-config.mk
include ./rules.mk
include $(OPENCM3_DIR)/mk/genlink-rules.mk
