include bin/docker.mk

.PHONY: install
install:
	@chmod +x bin/go-installer.sh
	@./bin/go-installer.sh
	@chmod +x bin/act-installer.sh
	@./bin/act-installer.sh