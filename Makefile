#!/bin/make -f
SHELL=/bin/bash
.ONESHELL:
.PHONY: all mkdir-store

all: 
	$(MAKE) -C usage
	$(MAKE) -C smartcard

help:
	$(info make help)
	$(info make test)

enumstore.txt:
	certutil.exe -enumstore | iconv -f cp932 | tee $@

mkdir-store:
	mkdir -p LocalMachine
	mkdir -p CurrentService
	mkdir -p Services
	mkdir -p Users
	mkdir -p CurrentUserGroupPolicy
	mkdir -p LocalMachineGroupPolicy
	mkdir -p LocalMachineEnterprise

