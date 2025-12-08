# Top level makefile, the real stuff is at ./src/Makefile and in ./modules/Makefile

SUBDIRS = src
ifeq ($(BUILD_WITH_MODULES), yes)
	SUBDIRS += modules
endif

default: all

export TARGET=aarch64-none-elf
export CPU=cortex-a57
export BUILD_DIR=build
export RANLIB=llvm-ranlib
export AR=llvm-ar

.DEFAULT:
	for dir in $(SUBDIRS); do $(MAKE) -C $$dir $@; done

install:
	for dir in $(SUBDIRS); do $(MAKE) -C $$dir $@; done

.PHONY: install
