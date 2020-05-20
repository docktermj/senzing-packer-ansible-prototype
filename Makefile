
# Default location of var file.

VAR_FILE := vars/ubuntu-18.04.04.json
AWS_FILE := vars/aws.json
TIMESTAMP := $(shell date +%s)

# -----------------------------------------------------------------------------
# The first "make" target runs as default.
# -----------------------------------------------------------------------------

.PHONY: help
help:
	@echo "Perform a Packer build."
	@echo 'Usage:'
	@echo '  make [VAR_FILE=$(VAR_FILE)] [AWS_FILE=$(AWS_FILE)] amazon-ebs'	
	@echo '  make [VAR_FILE=$(VAR_FILE)] {target}'	
	@echo '  make template-validate  # lint template.json'
	@echo '  make template-debug     # inspect template.json'
	@echo '  make template-format    # After formatting, variables need to be moved to top of template.json'
	@echo
	@echo 'Where:'
	@echo '  Targets:'
	@$(MAKE) -pRrq -f $(lastword $(MAKEFILE_LIST)) : 2>/dev/null | awk -v RS= -F: '/^# File/,/^# Finished Make data base/ {if ($$1 !~ "^[#.]") {print $$1}}' | sort | egrep -v -e '^[^[:alnum:]]' -e '^$@$$' | xargs

# -----------------------------------------------------------------------------
# Build all images.
# -----------------------------------------------------------------------------

.PHONY: all
all:
	packer build -var-file $(VAR_FILE)  template.json

# -----------------------------------------------------------------------------
# Build specific images.
# -----------------------------------------------------------------------------

.PHONY: amazon-ebs
amazon-ebs:
	packer build -only=amazon-ebs -var-file $(VAR_FILE) -var-file $(AWS_FILE) template.json


.PHONY: amazon-ebs-debug
amazon-ebs-debug:
	packer build -only=amazon-ebs -var-file $(VAR_FILE) -var-file $(AWS_FILE) -debug template.json


.PHONY: vmware-iso
vmware-iso:
	packer build -only=vmware-iso -var-file $(VAR_FILE) template.json


.PHONY: virtualbox-iso
virtualbox-iso:
	packer build -only=virtualbox-iso -var-file $(VAR_FILE) template.json

# -----------------------------------------------------------------------------
# Utility targets
# -----------------------------------------------------------------------------

.PHONY: template-debug
template-debug:
	packer console -var-file $(VAR_FILE) -var-file $(AWS_FILE) template.json

	
.PHONY: template-format
template-format:
	mv template.json template.json.$(TIMESTAMP)
	packer fix template.json.$(TIMESTAMP) > template.json

	
.PHONY: template-validate
template-validate:
	packer validate -var-file $(VAR_FILE) template.json
		
# -----------------------------------------------------------------------------
# Clean up targets.
# -----------------------------------------------------------------------------

.PHONY: clean
clean:
	rm -rf output-*
	rm *.box
