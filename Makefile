BOLD = \033[1m     # 粗體
GREEN = \033[0;32m # 綠色
NC = \033[0m       # 無色

lint:
	@ruff check --select I --fix
	@ruff format
	@ruff check
	@mypy .
	@echo "\n$(GREEN)$(BOLD)🎉 All checks passed! 🎉$(NC)"

fix:
	@ruff check --fix --unsafe-fixes

toml-fmt:
	@taplo format -o array_auto_collapse=false -o indent_string="    "


clear_pyc:
	@find . -type d -name "__pycache__" -exec rm -r {} +
	@find . -type d -empty -delete
	@echo "$(GREEN)$(BOLD)All __pycache__ removed!$(NC)"

clear_cache:
	@rm -rf .ruff_cache
	@rm -rf .mypy_cache
	@rm -rf .pytest_cache
	@echo "$(GREEN)$(BOLD)All cache removed!$(NC)"

clear_all: clear_pyc clear_cache


install:
	uv sync --all-groups

update:
	uv lock --upgrade


help:
	@echo "lint - run ruff check and ruff format and mypy"
	@echo "fix - run ruff check with --fix and --unsafe-fix"
	@echo "toml-fmt - format toml file"

	@echo "clear_pyc - remove all __pycache__ directories"
	@echo "clear_cache - remove .ruff_cache, .mypy_cache, .pytest_cache"
	@echo "clear_all - remove all __pycache__, linter and test cache"

	@echo "install - install all dependencies"
	@echo "update - update lock file"

	@echo "help - show this help message"
