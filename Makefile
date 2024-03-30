
###################
### include #####
###################

.DEFAULT_GOAL := help 
TEST_DIR=test

###################
###### App #######
###################
hello: ## Start the project
	@cd $(TEST_DIR) && ./hello.sh
.PHONY: hello

###################
###### Help #######
###################

help: ## Display this help screen
	@echo "Les commandes disponibles sont :"
	@echo ""
# @grep -E '^[a-zA-Z0-9_-]+:.*?# .*$$' Makefile | sort | awk -F':.*?# ' '/^[a-zA-Z0-9_-]+:.*?#/ {printf "  make \033[36m%-16s\033[0m %s\n", $$1, $$2}'
	@bash -c 'source makefile-functions.sh; generate_help "Makefile"'
.PHONY: help

