.PHONY: serve stop clean help

# Default port
PORT ?= 8000

# Check if python3 is available, fallback to python
PYTHON := $(shell command -v python3 2> /dev/null || echo python)

help: ## Show this help message
	@echo "Available commands:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-10s\033[0m %s\n", $$1, $$2}'

serve: ## Start local development server on port 8000 (or PORT=xxxx)
	@echo "Starting local server at http://localhost:$(PORT)"
	@echo "Press Ctrl+C to stop"
	@$(PYTHON) -m http.server $(PORT)

serve-cors: ## Start server with CORS headers enabled using npx (requires Node.js)
	@echo "Starting CORS-enabled server at http://localhost:$(PORT)"
	@echo "Installing http-server if needed..."
	@npx http-server . -p $(PORT) --cors -o

serve-php: ## Start PHP built-in server (if PHP is available)
	@echo "Starting PHP server at http://localhost:$(PORT)"
	@php -S localhost:$(PORT)

stop: ## Stop any process running on the PORT
	@echo "Stopping processes on port $(PORT)..."
	@lsof -ti:$(PORT) | xargs -r kill -9
	@echo "Stopped."

clean: ## Clean up temporary files
	@echo "Cleaning up..."
	@find . -name "*.pyc" -delete
	@find . -name "__pycache__" -delete
	@echo "Done."

open: ## Open the page in default browser
	@echo "Opening http://localhost:$(PORT)"
	@xdg-open http://localhost:$(PORT) 2>/dev/null || open http://localhost:$(PORT) 2>/dev/null || echo "Please open http://localhost:$(PORT) manually"

dev: serve ## Alias for serve

status: ## Check if server is running
	@if lsof -Pi :$(PORT) -sTCP:LISTEN -t >/dev/null; then \
		echo "Server is running on port $(PORT)"; \
		echo "URL: http://localhost:$(PORT)"; \
	else \
		echo "No server running on port $(PORT)"; \
	fi

push:
	@git add .
	@git commit -am "$$(printf "Enter commit message: " >&2 && read -r message && echo $${message})" || true
	@git push
