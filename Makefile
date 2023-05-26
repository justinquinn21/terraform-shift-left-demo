.PHONY: help
help:
	@echo "-------------------------------------------------------------------"
	@echo "Wiz terraform-shift-left-demo Makefile helper:"
	@echo ""
	@grep -Fh "##" $(MAKEFILE_LIST) | grep -v grep | sed -e 's/\\$$//' | sed -E 's/^([^:]*):.*##(.*)/ \1 -\2/'
	@echo "-------------------------------------------------------------------"

default: ci

.PHONY: ci
ci: ## *CI ONLY* Runs tests on CI pipeline
	scripts/ci_tests.sh
