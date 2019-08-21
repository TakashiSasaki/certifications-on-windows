#!/bin/make -f
.ONESHELL:
.PHONY: all

all: 
	$(MAKE) -C usage
	$(MAKE) -C machine
	$(MAKE) -C smartcard
	$(MAKE) -C user

help:
	$(info make help)
	$(info make test)


