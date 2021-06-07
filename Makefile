

# ==================================================================================== # 
# HELPERS
# ==================================================================================== #
## help: print this help message
.PHONY: help
help:
	@echo 'Usage:'
	@sed -n 's/^##//p' ${MAKEFILE_LIST} | column -t -s ':' | sed -e 's/^/ /'


# ==================================================================================== # 
# TEST
# ==================================================================================== #
## test: test code
.PHONY: test
test:
	@echo 'Running tests...'
	go test -v -race -vet=off ./...


# ==================================================================================== # 
# QUALITY CONTROL
# ==================================================================================== #
## audit: tidy dependencies and format, vet and test all code
.PHONY: audit 
audit: audit_helper test

.PHONY: audit_helper
audit_helper: audit_helper
	@echo 'Tidying and verifying module dependencies...'
	go mod tidy
	go mod verify
	@echo 'Formatting code...'
	go fmt ./...
	@echo 'Vetting code...'
	go vet ./...
	staticcheck ./...
