ROOTDIR := $(abspath $(dir $(lastword $(MAKEFILE_LIST))))

.PHONY: build install source test rpm

build:
	@echo "Nothing to build!"

install:
	$(ROOTDIR)/scripts/install.sh
	
source:
	$(ROOTDIR)/scripts/make_source.sh

test:
	bash `which roundup` ./scripts/tests.sh

rpm:
	$(ROOTDIR)/scripts/make_rpm.sh
